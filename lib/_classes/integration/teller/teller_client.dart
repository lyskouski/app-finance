// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:http/http.dart' as http;

// Teller API (https://teller.io/docs/api): access tokens per enrollment, mutual TLS for real bank data
class TellerException implements Exception {
  final String message;
  final int? statusCode;
  final String? code;

  const TellerException(this.message, [this.statusCode, this.code]);

  // The bank requires a user action (new login, MFA, ...): Teller Connect has to be opened again for the enrollment
  bool get isDisconnected => code?.startsWith('enrollment.disconnected') ?? false;

  @override
  String toString() => message;
}

enum TellerEnvironment {
  sandbox,
  development,
  production;

  // Real bank data is served only through mutual TLS
  bool get requiresCertificate => this != sandbox;

  static TellerEnvironment parse(String? value) => values.where((e) => e.name == value).firstOrNull ?? sandbox;
}

class TellerAccount {
  final String id;
  final String enrollmentId;
  final String name;
  final String? institution;
  final String? lastFour;
  final String currency;
  final String type;
  final bool isOpen;

  const TellerAccount({
    required this.id,
    required this.enrollmentId,
    required this.name,
    required this.currency,
    this.institution,
    this.lastFour,
    this.type = '',
    this.isOpen = true,
  });

  factory TellerAccount.fromJson(Map<String, dynamic> json) {
    final institution = json['institution'];
    return TellerAccount(
      id: json['id'].toString(),
      enrollmentId: (json['enrollment_id'] ?? '').toString(),
      name: (json['name'] ?? '').toString().trim(),
      institution: institution is Map ? institution['name']?.toString() : null,
      lastFour: json['last_four']?.toString(),
      currency: (json['currency'] ?? '').toString(),
      type: (json['type'] ?? '').toString(),
      isOpen: json['status'] != 'closed',
    );
  }
}

class TellerBalance {
  final double? ledger;
  final double? available;

  const TellerBalance({this.ledger, this.available});

  double? get amount => ledger ?? available;

  factory TellerBalance.fromJson(Map<String, dynamic> json) => TellerBalance(
        ledger: json['ledger'] != null ? TellerClient.parseAmount(json['ledger']) : null,
        available: json['available'] != null ? TellerClient.parseAmount(json['available']) : null,
      );
}

class TellerTransaction {
  final String id;
  final DateTime? date;
  final double amount;
  final String description;
  final bool pending;

  const TellerTransaction({
    required this.id,
    required this.amount,
    required this.description,
    this.date,
    this.pending = false,
  });

  factory TellerTransaction.fromJson(Map<String, dynamic> json) {
    final details = json['details'] is Map ? json['details'] as Map : const {};
    final counterparty = details['counterparty'] is Map ? details['counterparty'] as Map : const {};
    final description = (json['description'] ?? '').toString().trim();
    return TellerTransaction(
      id: json['id'].toString(),
      date: DateTime.tryParse((json['date'] ?? '').toString()),
      amount: TellerClient.parseAmount(json['amount']),
      description: description.isNotEmpty ? description : (counterparty['name'] ?? '').toString().trim(),
      pending: json['status'] != 'posted',
    );
  }
}

class TellerClient {
  static final baseUrl = Uri.parse('https://api.teller.io');
  static const timeout = Duration(seconds: 90);
  static const pageSize = 250;

  final http.Client _client;

  TellerClient({http.Client? client}) : _client = client ?? http.Client();

  void close() => _client.close();

  static double parseAmount(dynamic value) {
    final result = double.tryParse(value?.toString().trim() ?? '');
    if (result == null) {
      throw TellerException(AppLocale.labels.integrationInvalidAmount('$value'));
    }
    return result;
  }

  // Canonical PEM block (pasted with or without line breaks), [label] matches e.g. "CERTIFICATE" or "PRIVATE KEY"
  static String? normalizePem(String pem, String label) {
    final match = RegExp('-----BEGIN ([A-Z ]*$label)-----(.+?)-----END \\1-----', dotAll: true).firstMatch(pem);
    if (match == null) {
      return null;
    }
    final body = match.group(2)!.replaceAll(RegExp(r'\s'), '');
    final lines = [for (var i = 0; i < body.length; i += 64) body.substring(i, (i + 64).clamp(0, body.length))];
    return '-----BEGIN ${match.group(1)}-----\n${lines.join('\n')}\n-----END ${match.group(1)}-----\n';
  }

  static String normalizeCertificate(String pem) {
    // A chain may hold several certificates: each is kept
    final blocks = RegExp(r'-----BEGIN CERTIFICATE-----.+?-----END CERTIFICATE-----', dotAll: true)
        .allMatches(pem)
        .map((e) => normalizePem(e.group(0)!, 'CERTIFICATE')!)
        .toList();
    if (blocks.isEmpty) {
      throw TellerException(AppLocale.labels.tellerCertificateInvalid);
    }
    return blocks.join();
  }

  static String normalizePrivateKey(String pem) {
    final result = normalizePem(pem, 'PRIVATE KEY');
    if (result == null) {
      throw TellerException(AppLocale.labels.tellerKeyInvalid);
    }
    return result;
  }

  static String _date(DateTime value) =>
      '${value.year.toString().padLeft(4, '0')}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}';

  Future<dynamic> _request(String method, String accessToken, String path, [Map<String, String>? query]) async {
    final uri = baseUrl.replace(path: path, queryParameters: query == null || query.isEmpty ? null : query);
    final request = http.Request(method, uri)
      ..headers['Authorization'] = 'Basic ${base64.encode(utf8.encode('$accessToken:'))}'
      ..headers['Accept'] = 'application/json';
    final response = await http.Response.fromStream(await _client.send(request).timeout(timeout));
    final text = utf8.decode(response.bodyBytes);
    dynamic json;
    try {
      json = text.isEmpty ? null : jsonDecode(text);
    } on FormatException {
      json = null;
    }
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json;
    }
    final error = json is Map && json['error'] is Map ? json['error'] as Map : const {};
    final code = error['code']?.toString();
    final message = error['message']?.toString();
    final status = response.statusCode;
    if (code != null && code.startsWith('enrollment.disconnected')) {
      throw TellerException(AppLocale.labels.tellerDisconnected, status, code);
    }
    if (status == 400 && (message ?? '').toLowerCase().contains('certificate')) {
      throw TellerException(AppLocale.labels.tellerMissingCertificate, status, code);
    }
    if (status == 401 || status == 403) {
      throw TellerException(AppLocale.labels.integrationAccessDenied, status, code);
    }
    throw TellerException(
      message != null
          ? AppLocale.labels.integrationServiceError(message)
          : AppLocale.labels.integrationHttpError('$status'),
      status,
      code,
    );
  }

  static List<Map<String, dynamic>> _list(dynamic json) {
    if (json is! List) {
      throw TellerException(AppLocale.labels.integrationUnexpectedResponse);
    }
    return json.whereType<Map<String, dynamic>>().toList();
  }

  Future<List<TellerAccount>> getAccounts(String accessToken) async =>
      _list(await _request('GET', accessToken, '/accounts')).map(TellerAccount.fromJson).toList();

  Future<TellerBalance> getBalances(String accessToken, String accountId) async {
    final json = await _request('GET', accessToken, '/accounts/$accountId/balances');
    if (json is! Map<String, dynamic>) {
      throw TellerException(AppLocale.labels.integrationUnexpectedResponse);
    }
    return TellerBalance.fromJson(json);
  }

  // Pages backward (newest first) until the start date is covered
  Future<List<TellerTransaction>> getTransactions(String accessToken, String accountId, {DateTime? from}) async {
    final result = <TellerTransaction>[];
    String? lastId;
    while (true) {
      final page = _list(await _request('GET', accessToken, '/accounts/$accountId/transactions', {
        'count': '$pageSize',
        if (from != null) 'start_date': _date(from),
        if (lastId != null) 'from_id': lastId,
      }))
          .map(TellerTransaction.fromJson)
          .toList();
      result.addAll(page);
      if (page.length < pageSize || page.last.id == lastId) {
        break;
      }
      lastId = page.last.id;
    }
    return result;
  }

  // Revokes the application's access to all accounts of the enrollment
  Future<void> deleteEnrollment(String accessToken) => _request('DELETE', accessToken, '/accounts');
}
