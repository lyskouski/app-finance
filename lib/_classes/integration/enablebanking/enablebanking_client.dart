// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:http/http.dart' as http;
import 'package:pointycastle/asymmetric/api.dart';

// Enable Banking API (https://enablebanking.com/docs/api/reference/)
class EnableBankingException implements Exception {
  final String message;
  final int? statusCode;

  const EnableBankingException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class EnableBankingAspsp {
  final String name;
  final String country;
  final Duration? maximumConsentValidity;

  const EnableBankingAspsp({required this.name, required this.country, this.maximumConsentValidity});

  factory EnableBankingAspsp.fromJson(Map<String, dynamic> json) => EnableBankingAspsp(
        name: json['name'].toString(),
        country: json['country'].toString(),
        maximumConsentValidity: json['maximum_consent_validity'] is num
            ? Duration(seconds: (json['maximum_consent_validity'] as num).toInt())
            : null,
      );
}

class EnableBankingAccount {
  final String uid;
  final String? iban;
  final String name;
  final String? currency;

  const EnableBankingAccount({required this.uid, required this.name, this.iban, this.currency});

  String get key => iban?.replaceAll(' ', '').toUpperCase() ?? uid;

  factory EnableBankingAccount.fromJson(Map<String, dynamic> json) {
    final accountId = json['account_id'];
    return EnableBankingAccount(
      uid: json['uid'].toString(),
      iban: accountId is Map ? accountId['iban']?.toString() : null,
      name: (json['name'] ?? json['product'] ?? json['details'] ?? '').toString().trim(),
      currency: json['currency']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'account_id': {'iban': iban},
        'name': name,
        'currency': currency,
      };
}

class EnableBankingBalance {
  final double amount;
  final String currency;
  final String? type;

  const EnableBankingBalance({required this.amount, required this.currency, this.type});

  factory EnableBankingBalance.fromJson(Map<String, dynamic> json) {
    final value = json['balance_amount'] as Map<String, dynamic>? ?? {};
    return EnableBankingBalance(
      amount: EnableBankingClient.parseAmount(value['amount']),
      currency: (value['currency'] ?? '').toString(),
      type: json['balance_type']?.toString(),
    );
  }
}

class EnableBankingTransaction {
  final String? reference;
  final double amount;
  final String currency;
  final String? status;
  final DateTime? date;
  final String title;

  const EnableBankingTransaction({
    required this.amount,
    required this.currency,
    required this.title,
    this.reference,
    this.status,
    this.date,
  });

  bool get isBooked => status == null || status == 'BOOK';

  factory EnableBankingTransaction.fromJson(Map<String, dynamic> json) {
    final value = json['transaction_amount'] as Map<String, dynamic>? ?? {};
    final isDebit = json['credit_debit_indicator'] == 'DBIT';
    final amount = EnableBankingClient.parseAmount(value['amount']).abs();
    final party = (isDebit ? json['creditor'] : json['debtor']) as Map<String, dynamic>?;
    final remittance = (json['remittance_information'] as List? ?? []).map((e) => e.toString().trim()).join(' ');
    final title = [party?['name']?.toString().trim() ?? '', remittance, json['note']?.toString().trim() ?? '']
        .where((e) => e.isNotEmpty)
        .take(2)
        .join(' — ');
    return EnableBankingTransaction(
      reference: (json['entry_reference'] ?? json['transaction_id'])?.toString(),
      amount: isDebit ? -amount : amount,
      currency: (value['currency'] ?? '').toString(),
      status: json['status']?.toString(),
      date: EnableBankingClient.parseDate(json['booking_date'] ?? json['value_date'] ?? json['transaction_date']),
      title: title,
    );
  }
}

class EnableBankingSession {
  final String id;
  final DateTime? validUntil;
  final List<EnableBankingAccount> accounts;

  const EnableBankingSession({required this.id, required this.accounts, this.validUntil});

  bool get isValid => validUntil == null || validUntil!.isAfter(DateTime.now());

  factory EnableBankingSession.fromJson(Map<String, dynamic> json) {
    final access = json['access'];
    return EnableBankingSession(
      id: json['session_id'].toString(),
      validUntil: access is Map ? DateTime.tryParse(access['valid_until']?.toString() ?? '') : null,
      accounts: (json['accounts'] as List? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(EnableBankingAccount.fromJson)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'session_id': id,
        'access': {'valid_until': validUntil?.toUtc().toIso8601String()},
        'accounts': accounts.map((e) => e.toJson()).toList(),
      };
}

class EnableBankingClient {
  static final baseUrl = Uri.parse('https://api.enablebanking.com');
  static const timeout = Duration(seconds: 90);
  static const tokenLifetime = Duration(hours: 1);

  final String applicationId;
  final RSAPrivateKey _key;
  final http.Client _client;
  final DateTime Function() _now;

  EnableBankingClient({
    required String applicationId,
    required String privateKey,
    http.Client? client,
    DateTime Function()? now,
  })  : applicationId = applicationId.trim(),
        _key = parsePrivateKey(privateKey),
        _client = client ?? http.Client(),
        _now = now ?? DateTime.now;

  void close() => _client.close();

  // Canonical PEM of a private key pasted with or without line breaks
  static String normalizePrivateKey(String pem) {
    final match = RegExp(r'-----BEGIN ([A-Z ]*PRIVATE KEY)-----(.+?)-----END \1-----', dotAll: true).firstMatch(pem);
    if (match == null) {
      throw const EnableBankingException('Invalid private key: PEM "PRIVATE KEY" expected');
    }
    final body = match.group(2)!.replaceAll(RegExp(r'\s'), '');
    final lines = [for (var i = 0; i < body.length; i += 64) body.substring(i, (i + 64).clamp(0, body.length))];
    return '-----BEGIN ${match.group(1)}-----\n${lines.join('\n')}\n-----END ${match.group(1)}-----';
  }

  // Accepts PKCS#1 and PKCS#8 keys
  static RSAPrivateKey parsePrivateKey(String pem) {
    final normalized = normalizePrivateKey(pem);
    try {
      final key = RSAKeyParser().parse(normalized);
      if (key is RSAPrivateKey) {
        return key;
      }
    } catch (_) {
      // Reported below
    }
    throw const EnableBankingException('Invalid private key: RSA key expected');
  }

  static double parseAmount(dynamic value) {
    final result = double.tryParse(value?.toString().trim() ?? '');
    if (result == null) {
      throw EnableBankingException('Invalid amount: $value');
    }
    return result;
  }

  static DateTime? parseDate(dynamic value) {
    final date = DateTime.tryParse(value?.toString() ?? '');
    return date == null ? null : DateTime(date.year, date.month, date.day);
  }

  static String _date(DateTime value) =>
      '${value.year.toString().padLeft(4, '0')}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}';

  static String _base64Url(List<int> bytes) => base64Url.encode(bytes).replaceAll('=', '');

  static String extractCode(String input, {String? state}) {
    final value = input.trim();
    final uri = Uri.tryParse(value);
    if (uri != null && uri.hasQuery) {
      final error = uri.queryParameters['error_description'] ?? uri.queryParameters['error'];
      if (error != null) {
        throw EnableBankingException(error);
      }
      final returned = uri.queryParameters['state'];
      if (state != null && returned != null && returned != state) {
        throw const EnableBankingException('The address belongs to another authorization');
      }
      final code = uri.queryParameters['code'];
      if (code != null && code.isNotEmpty) {
        return code;
      }
    }
    if (value.isEmpty || value.contains('://')) {
      throw const EnableBankingException('No authorization code found');
    }
    return value;
  }

  String token() {
    final now = _now().millisecondsSinceEpoch ~/ 1000;
    final header = _base64Url(utf8.encode(jsonEncode({'typ': 'JWT', 'alg': 'RS256', 'kid': applicationId})));
    final payload = _base64Url(utf8.encode(jsonEncode({
      'iss': 'enablebanking.com',
      'aud': 'api.enablebanking.com',
      'iat': now,
      'exp': now + tokenLifetime.inSeconds,
    })));
    final input = '$header.$payload';
    final signature = Signer(RSASigner(RSASignDigest.SHA256, privateKey: _key)).sign(input);
    return '$input.${_base64Url(signature.bytes)}';
  }

  Future<dynamic> _send(String method, String path, {Map<String, dynamic>? query, Object? body}) async {
    final uri = baseUrl.replace(path: path, queryParameters: query?.isEmpty == true ? null : query);
    final request = http.Request(method, uri)
      ..headers['Authorization'] = 'Bearer ${token()}'
      ..headers['Accept'] = 'application/json';
    if (body != null) {
      request
        ..headers['Content-Type'] = 'application/json'
        ..body = jsonEncode(body);
    }
    final response = await http.Response.fromStream(await _client.send(request).timeout(timeout));
    final text = utf8.decode(response.bodyBytes);
    dynamic json;
    try {
      json = text.isEmpty ? null : jsonDecode(text);
    } on FormatException {
      json = null;
    }
    if (response.statusCode < 200 || response.statusCode >= 300) {
      final message = json is Map ? (json['message'] ?? json['detail'] ?? json['error']) : null;
      throw EnableBankingException(
        'Enable Banking: ${message ?? 'HTTP ${response.statusCode}'}',
        response.statusCode,
      );
    }
    return json;
  }

  Future<List<EnableBankingAspsp>> getAspsps(String country) async {
    final json =
        await _send('GET', '/aspsps', query: {'country': country.trim().toUpperCase(), 'psu_type': 'personal'});
    return ((json as Map?)?['aspsps'] as List? ?? [])
        .whereType<Map<String, dynamic>>()
        .map(EnableBankingAspsp.fromJson)
        .toList();
  }

  Future<Uri> startAuthorization({
    required EnableBankingAspsp aspsp,
    required String redirectUrl,
    required String state,
    Duration validity = const Duration(days: 90),
  }) async {
    final maximum = aspsp.maximumConsentValidity;
    final duration = maximum != null && maximum < validity ? maximum : validity;
    final json = await _send('POST', '/auth', body: {
      'access': {'valid_until': _now().add(duration).toUtc().toIso8601String()},
      'aspsp': {'name': aspsp.name, 'country': aspsp.country},
      'state': state,
      'redirect_url': redirectUrl.trim(),
      'psu_type': 'personal',
    });
    final url = Uri.tryParse((json as Map?)?['url']?.toString() ?? '');
    if (url == null || url.scheme != 'https') {
      throw const EnableBankingException('Enable Banking: no authorization page returned');
    }
    return url;
  }

  Future<EnableBankingSession> createSession(String code) async {
    final json = await _send('POST', '/sessions', body: {'code': code});
    return EnableBankingSession.fromJson(json as Map<String, dynamic>);
  }

  Future<void> deleteSession(String sessionId) => _send('DELETE', '/sessions/${Uri.encodeComponent(sessionId)}');

  Future<List<EnableBankingBalance>> getBalances(String uid) async {
    final json = await _send('GET', '/accounts/${Uri.encodeComponent(uid)}/balances');
    return ((json as Map?)?['balances'] as List? ?? [])
        .whereType<Map<String, dynamic>>()
        .map(EnableBankingBalance.fromJson)
        .toList();
  }

  // All pages of transactions since [from]
  Future<List<EnableBankingTransaction>> getTransactions(String uid, {DateTime? from}) async {
    final result = <EnableBankingTransaction>[];
    String? continuation;
    var pages = 0;
    do {
      final json = await _send('GET', '/accounts/${Uri.encodeComponent(uid)}/transactions', query: {
        if (from != null) 'date_from': _date(from),
        if (continuation != null) 'continuation_key': continuation,
      }) as Map?;
      result.addAll((json?['transactions'] as List? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(EnableBankingTransaction.fromJson));
      final next = json?['continuation_key']?.toString();
      continuation = next == null || next.isEmpty || next == continuation ? null : next;
    } while (continuation != null && ++pages < 100);
    return result;
  }
}
