// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:http/http.dart' as http;

// SimpleFIN protocol (https://www.simplefin.org/protocol.html)
class SimpleFinException implements Exception {
  final String message;
  final int? statusCode;

  const SimpleFinException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class SimpleFinTransaction {
  final String id;
  final DateTime? posted;
  final DateTime? transactedAt;
  final double amount;
  final String description;
  final bool pending;

  const SimpleFinTransaction({
    required this.id,
    required this.amount,
    required this.description,
    this.posted,
    this.transactedAt,
    this.pending = false,
  });

  DateTime? get date => posted ?? transactedAt;

  factory SimpleFinTransaction.fromJson(Map<String, dynamic> json) {
    final posted = SimpleFinClient.parseTime(json['posted']);
    return SimpleFinTransaction(
      id: json['id'].toString(),
      posted: posted,
      transactedAt: SimpleFinClient.parseTime(json['transacted_at']),
      amount: SimpleFinClient.parseAmount(json['amount']),
      description: (json['description'] ?? json['payee'] ?? '').toString().trim(),
      // If the transaction is pending, posted may be 0
      pending: json['pending'] == true || posted == null,
    );
  }
}

class SimpleFinAccount {
  final String id;
  final String name;
  final String? institution;
  final String currency;
  final double balance;
  final double? availableBalance;
  final DateTime? balanceDate;
  final List<SimpleFinTransaction> transactions;

  const SimpleFinAccount({
    required this.id,
    required this.name,
    required this.currency,
    required this.balance,
    this.institution,
    this.availableBalance,
    this.balanceDate,
    this.transactions = const [],
  });

  factory SimpleFinAccount.fromJson(Map<String, dynamic> json, Map<String, String> connections) {
    final org = json['org'];
    return SimpleFinAccount(
      id: json['id'].toString(),
      name: (json['name'] ?? '').toString().trim(),
      institution: connections[json['conn_id']] ?? (org is Map ? (org['name'] ?? org['domain'])?.toString() : null),
      currency: (json['currency'] ?? '').toString(),
      balance: SimpleFinClient.parseAmount(json['balance']),
      availableBalance:
          json['available-balance'] != null ? SimpleFinClient.parseAmount(json['available-balance']) : null,
      balanceDate: SimpleFinClient.parseTime(json['balance-date']),
      transactions: (json['transactions'] as List? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(SimpleFinTransaction.fromJson)
          .toList(),
    );
  }
}

class SimpleFinAccountSet {
  final List<SimpleFinAccount> accounts;
  final List<String> errors;

  const SimpleFinAccountSet({required this.accounts, this.errors = const []});

  factory SimpleFinAccountSet.fromJson(Map<String, dynamic> json) {
    final connections = <String, String>{
      for (final item in (json['connections'] as List? ?? []).whereType<Map<String, dynamic>>())
        item['conn_id'].toString(): (item['name'] ?? item['org_id'] ?? '').toString(),
    };
    final errlist = (json['errlist'] as List? ?? []).whereType<Map<String, dynamic>>();
    return SimpleFinAccountSet(
      accounts: (json['accounts'] as List? ?? [])
          .whereType<Map<String, dynamic>>()
          .map((e) => SimpleFinAccount.fromJson(e, connections))
          .toList(),
      errors: errlist.isNotEmpty
          ? errlist.map((e) => (e['msg'] ?? e['code'] ?? '').toString()).toList()
          : (json['errors'] as List? ?? []).map((e) => e.toString()).toList(),
    );
  }
}

class SimpleFinClient {
  static const timeout = Duration(seconds: 90);

  final http.Client _client;

  SimpleFinClient({http.Client? client}) : _client = client ?? http.Client();

  void close() => _client.close();

  static double parseAmount(dynamic value) {
    final result = double.tryParse(value?.toString().trim() ?? '');
    if (result == null) {
      throw SimpleFinException(AppLocale.labels.integrationInvalidAmount('$value'));
    }
    return result;
  }

  static DateTime? parseTime(dynamic value) {
    final seconds = value is num ? value.toInt() : int.tryParse(value?.toString() ?? '');
    return seconds == null || seconds <= 0 ? null : DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  }

  static Uri _requireHttps(Uri uri) {
    if (uri.scheme != 'https' || uri.host.isEmpty) {
      throw SimpleFinException(AppLocale.labels.integrationHttpsRequired);
    }
    return uri;
  }

  static Uri decodeToken(String token) {
    final value = token.replaceAll(RegExp(r'\s'), '');
    try {
      return _requireHttps(Uri.parse(utf8.decode(base64.decode(base64.normalize(value)))));
    } on FormatException {
      throw SimpleFinException(AppLocale.labels.simpleFinTokenInvalid);
    }
  }

  Future<Uri> claim(String token) async {
    final response = await _client.post(decodeToken(token), headers: {'Content-Length': '0'}).timeout(timeout);
    if (response.statusCode == 403) {
      throw SimpleFinException(AppLocale.labels.simpleFinTokenClaimed, 403);
    }
    _check(response);
    final access = _requireHttps(Uri.parse(response.body.trim()));
    if (!access.userInfo.contains(':')) {
      throw SimpleFinException(AppLocale.labels.simpleFinNoCredentials);
    }
    return access;
  }

  Future<SimpleFinAccountSet> getAccounts(
    Uri accessUrl, {
    DateTime? start,
    DateTime? end,
    bool pending = false,
    bool balancesOnly = false,
    List<String> accountIds = const [],
  }) async {
    _requireHttps(accessUrl);
    final path = accessUrl.path.endsWith('/') ? accessUrl.path : '${accessUrl.path}/';
    final uri = accessUrl.replace(
      userInfo: '',
      path: '${path}accounts',
      queryParameters: {
        if (start != null) 'start-date': '${start.millisecondsSinceEpoch ~/ 1000}',
        if (end != null) 'end-date': '${end.millisecondsSinceEpoch ~/ 1000}',
        if (pending) 'pending': '1',
        if (balancesOnly) 'balances-only': '1',
        if (accountIds.isNotEmpty) 'account': accountIds,
      },
    );
    final credentials = base64.encode(utf8.encode(Uri.decodeComponent(accessUrl.userInfo)));
    final response = await _client.get(uri, headers: {'Authorization': 'Basic $credentials'}).timeout(timeout);
    if (response.statusCode == 402) {
      throw SimpleFinException(AppLocale.labels.integrationPaymentRequired, 402);
    }
    if (response.statusCode == 403) {
      throw SimpleFinException(AppLocale.labels.integrationAccessDenied, 403);
    }
    _check(response);
    final json = jsonDecode(utf8.decode(response.bodyBytes));
    if (json is! Map<String, dynamic>) {
      throw SimpleFinException(AppLocale.labels.integrationUnexpectedResponse);
    }
    return SimpleFinAccountSet.fromJson(json);
  }

  static void _check(http.Response response) {
    if (response.statusCode != 200) {
      throw SimpleFinException(AppLocale.labels.integrationHttpError('${response.statusCode}'), response.statusCode);
    }
  }
}
