// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:http/http.dart' as http;

// Investec Programmable Banking, South Africa Private Banking (https://developer.investec.com):
// OAuth 2.0 client credentials with an extra API key, bearer tokens valid for 30 minutes
class InvestecException implements Exception {
  final String message;
  final int? statusCode;

  const InvestecException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

typedef InvestecCredentials = ({String clientId, String secret, String apiKey});

class InvestecAccount {
  final String id;
  final String number;
  final String name;
  final String product;
  final String profile;

  const InvestecAccount({
    required this.id,
    required this.number,
    required this.name,
    this.product = '',
    this.profile = '',
  });

  String get title {
    final masked = number.length > 4 ? '…${number.substring(number.length - 4)}' : number;
    return [name.isNotEmpty ? name : product, masked].where((e) => e.isNotEmpty).join(' ');
  }

  factory InvestecAccount.fromJson(Map<String, dynamic> json) => InvestecAccount(
        id: json['accountId'].toString(),
        number: (json['accountNumber'] ?? '').toString(),
        name: (json['referenceName'] ?? json['accountName'] ?? '').toString().trim(),
        product: (json['productName'] ?? '').toString().trim(),
        profile: (json['profileName'] ?? '').toString().trim(),
      );
}

class InvestecBalance {
  final double current;
  final double? available;
  final String currency;

  const InvestecBalance({required this.current, required this.currency, this.available});

  factory InvestecBalance.fromJson(Map<String, dynamic> json) => InvestecBalance(
        current: InvestecClient.parseAmount(json['currentBalance']),
        available: json['availableBalance'] != null ? InvestecClient.parseAmount(json['availableBalance']) : null,
        currency: (json['currency'] ?? 'ZAR').toString(),
      );
}

class InvestecTransaction {
  final String? uuid;
  final bool isDebit;
  final bool pending;
  final String description;
  final DateTime? postingDate;
  final DateTime? transactionDate;
  // Always positive: the direction is given by the type (DEBIT or CREDIT)
  final double amount;

  const InvestecTransaction({
    required this.isDebit,
    required this.amount,
    required this.description,
    this.uuid,
    this.pending = false,
    this.postingDate,
    this.transactionDate,
  });

  double get signedAmount => isDebit ? -amount.abs() : amount.abs();

  // The day of the purchase; the posting may follow days later
  DateTime? get date => transactionDate ?? postingDate;

  factory InvestecTransaction.fromJson(Map<String, dynamic> json) {
    final uuid = json['uuid']?.toString().trim();
    return InvestecTransaction(
      uuid: uuid == null || uuid.isEmpty ? null : uuid,
      isDebit: json['type'].toString().toUpperCase() == 'DEBIT',
      pending: (json['status'] ?? 'POSTED').toString().toUpperCase() != 'POSTED',
      description: (json['description'] ?? '').toString().trim(),
      postingDate: InvestecClient.parseDate(json['postingDate']),
      transactionDate: InvestecClient.parseDate(json['transactionDate']),
      amount: InvestecClient.parseAmount(json['amount']),
    );
  }
}

class InvestecClient {
  static final liveUrl = Uri.parse('https://openapi.investec.com');
  static final sandboxUrl = Uri.parse('https://openapisandbox.investec.com');
  static const timeout = Duration(seconds: 90);
  // A token is renewed a bit before it expires
  static const tokenMargin = Duration(seconds: 60);

  final http.Client _client;
  final Uri baseUrl;
  final DateTime Function() now;
  String? _token;
  DateTime? _expiresAt;

  InvestecClient({http.Client? client, bool sandbox = false, DateTime Function()? now})
      : _client = client ?? http.Client(),
        baseUrl = sandbox ? sandboxUrl : liveUrl,
        now = now ?? DateTime.now;

  void close() => _client.close();

  static double parseAmount(dynamic value) {
    final result = value is num ? value.toDouble() : double.tryParse(value?.toString().trim() ?? '');
    if (result == null) {
      throw InvestecException(AppLocale.labels.integrationInvalidAmount('$value'));
    }
    return result;
  }

  static DateTime? parseDate(dynamic value) {
    final text = value?.toString() ?? '';
    return text.length < 10 ? null : DateTime.tryParse(text.substring(0, 10));
  }

  static String _date(DateTime value) =>
      '${value.year.toString().padLeft(4, '0')}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}';

  static dynamic _decode(http.Response response) {
    final text = utf8.decode(response.bodyBytes);
    try {
      return text.isEmpty ? null : jsonDecode(text);
    } on FormatException {
      return null;
    }
  }

  static Never _fail(http.Response response, dynamic json) {
    final status = response.statusCode;
    final error = json is Map ? (json['error_description'] ?? json['message'] ?? json['error']) : null;
    if (status == 401 || status == 403) {
      throw InvestecException(AppLocale.labels.integrationAccessDenied, status);
    }
    throw InvestecException(
      error is String && error.isNotEmpty
          ? AppLocale.labels.integrationServiceError(error)
          : AppLocale.labels.integrationHttpError('$status'),
      status,
    );
  }

  Future<String> _authorize(InvestecCredentials credentials) async {
    final token = _token;
    final expiresAt = _expiresAt;
    if (token != null && expiresAt != null && now().isBefore(expiresAt)) {
      return token;
    }
    final basic = base64.encode(utf8.encode('${credentials.clientId}:${credentials.secret}'));
    final response = await _client.post(
      baseUrl.replace(path: '/identity/v2/oauth2/token'),
      headers: {
        'Authorization': 'Basic $basic',
        'x-api-key': credentials.apiKey,
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {'grant_type': 'client_credentials'},
    ).timeout(timeout);
    final json = _decode(response);
    if (response.statusCode != 200) {
      _fail(response, json);
    }
    final value = json is Map ? json['access_token']?.toString() : null;
    if (value == null || value.isEmpty) {
      throw InvestecException(AppLocale.labels.integrationUnexpectedResponse);
    }
    // Documented as 1799 seconds, sometimes sent as a string
    final seconds = int.tryParse('${json['expires_in'] ?? ''}') ?? 1799;
    _token = value;
    _expiresAt = now().add(Duration(seconds: seconds)).subtract(tokenMargin);
    return value;
  }

  Future<Map<String, dynamic>> _get(InvestecCredentials credentials, String path, [Map<String, String>? query]) async {
    final uri = baseUrl.replace(path: path, queryParameters: query == null || query.isEmpty ? null : query);
    http.Response? response;
    // A token revoked before its expiry is requested once again
    for (var attempt = 0; attempt < 2; attempt++) {
      final token = await _authorize(credentials);
      response = await _client.get(uri, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      }).timeout(timeout);
      if (response.statusCode != 401) {
        break;
      }
      _token = null;
    }
    final json = _decode(response!);
    if (response.statusCode != 200) {
      _fail(response, json);
    }
    if (json is! Map<String, dynamic> || json['data'] is! Map<String, dynamic>) {
      throw InvestecException(AppLocale.labels.integrationUnexpectedResponse);
    }
    return json['data'] as Map<String, dynamic>;
  }

  Future<List<InvestecAccount>> getAccounts(InvestecCredentials credentials) async {
    final data = await _get(credentials, '/za/pb/v1/accounts');
    return (data['accounts'] as List? ?? []).whereType<Map<String, dynamic>>().map(InvestecAccount.fromJson).toList();
  }

  Future<InvestecBalance> getBalance(InvestecCredentials credentials, String accountId) async =>
      InvestecBalance.fromJson(await _get(credentials, '/za/pb/v1/accounts/$accountId/balance'));

  // Filtered by the posting date; pending transactions are included to be reported
  Future<List<InvestecTransaction>> getTransactions(
    InvestecCredentials credentials,
    String accountId, {
    required DateTime from,
    DateTime? to,
  }) async {
    final data = await _get(credentials, '/za/pb/v1/accounts/$accountId/transactions', {
      'fromDate': _date(from),
      'toDate': _date(to ?? now()),
      'includePending': 'true',
    });
    return (data['transactions'] as List? ?? [])
        .whereType<Map<String, dynamic>>()
        .map(InvestecTransaction.fromJson)
        .toList();
  }
}
