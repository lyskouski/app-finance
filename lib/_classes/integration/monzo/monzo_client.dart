// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/enablebanking/enablebanking_client.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:http/http.dart' as http;

// Monzo Developer API (https://docs.monzo.com): OAuth 2.0 with the user's own (confidential) client,
// each sign-in is approved in the Monzo app before any data is available
class MonzoException implements Exception {
  final String message;
  final int? statusCode;
  final String? code;

  const MonzoException(this.message, [this.statusCode, this.code]);

  @override
  String toString() => message;
}

class MonzoTokens {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  const MonzoTokens({required this.accessToken, required this.refreshToken, required this.expiresAt});

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'expiresAt': expiresAt.toIso8601String(),
      };

  factory MonzoTokens.fromJson(Map<String, dynamic> json) => MonzoTokens(
        accessToken: (json['accessToken'] ?? '').toString(),
        refreshToken: (json['refreshToken'] ?? '').toString(),
        expiresAt: DateTime.tryParse((json['expiresAt'] ?? '').toString()) ?? DateTime.fromMillisecondsSinceEpoch(0),
      );
}

class MonzoAccount {
  final String id;
  final String description;
  final String type;
  final String currency;
  final String? accountNumber;
  final bool isClosed;

  const MonzoAccount({
    required this.id,
    required this.description,
    this.type = '',
    this.currency = 'GBP',
    this.accountNumber,
    this.isClosed = false,
  });

  String get title {
    final number = accountNumber ?? '';
    final masked = number.length > 4 ? '…${number.substring(number.length - 4)}' : number;
    return [description, masked].where((e) => e.isNotEmpty).join(' ');
  }

  factory MonzoAccount.fromJson(Map<String, dynamic> json) {
    final owners = (json['owners'] as List? ?? []).whereType<Map>().map((e) => e['preferred_name']).whereType<String>();
    final description = (json['description'] ?? '').toString().trim();
    return MonzoAccount(
      id: json['id'].toString(),
      // Descriptions of newer accounts are technical ids (e.g. "user_000…"): the owner's name is shown instead
      description: description.isEmpty || description.startsWith('user_') ? owners.join(', ') : description,
      type: (json['type'] ?? '').toString(),
      currency: (json['currency'] ?? 'GBP').toString(),
      accountNumber: json['account_number']?.toString(),
      isClosed: json['closed'] == true,
    );
  }
}

class MonzoBalance {
  final double balance;
  final String currency;

  const MonzoBalance({required this.balance, required this.currency});
}

class MonzoTransaction {
  final String id;
  final DateTime created;
  final double amount;
  final String currency;
  final String description;
  final bool pending;
  final bool declined;

  const MonzoTransaction({
    required this.id,
    required this.created,
    required this.amount,
    required this.currency,
    required this.description,
    this.pending = false,
    this.declined = false,
  });

  factory MonzoTransaction.fromJson(Map<String, dynamic> json) {
    final currency = (json['currency'] ?? 'GBP').toString();
    final merchant = json['merchant'];
    final merchantName = merchant is Map ? merchant['name']?.toString().trim() : null;
    final settled = (json['settled'] ?? '').toString();
    return MonzoTransaction(
      id: json['id'].toString(),
      created: DateTime.parse(json['created'].toString()).toLocal(),
      amount: MonzoClient.fromMinor(json['amount'], currency),
      currency: currency,
      description: merchantName != null && merchantName.isNotEmpty
          ? merchantName
          : (json['description'] ?? '').toString().trim(),
      // Authorised, but not "complete" yet: the amount may change
      pending: settled.isEmpty,
      declined: (json['decline_reason'] ?? '').toString().isNotEmpty,
    );
  }
}

class MonzoClient {
  static final authUrl = Uri.parse('https://auth.monzo.com/');
  static final baseUrl = Uri.parse('https://api.monzo.com');
  static const timeout = Duration(seconds: 90);
  static const pageSize = 100;
  // The full history is readable only shortly after the approval in the app, later only these days
  static const fullHistoryWindow = Duration(minutes: 5);
  static const historyLimit = Duration(days: 89);

  final http.Client _client;
  final String clientId;
  final String clientSecret;
  final DateTime Function() now;
  MonzoTokens? tokens;
  // Refreshed tokens are to be stored: a refresh token can be used only once
  final Future<void> Function(MonzoTokens tokens)? onTokens;

  MonzoClient({
    required this.clientId,
    required this.clientSecret,
    this.tokens,
    this.onTokens,
    http.Client? client,
    DateTime Function()? now,
  })  : _client = client ?? http.Client(),
        now = now ?? DateTime.now;

  void close() => _client.close();

  static double fromMinor(dynamic value, String currency) {
    final minor = value is num ? value : num.tryParse('${value ?? ''}');
    if (minor == null) {
      throw MonzoException(AppLocale.labels.integrationInvalidAmount('$value'));
    }
    final digits = CurrencyProvider.find(currency)?.decimalDigits ?? 2;
    var divider = 1;
    for (var i = 0; i < digits; i++) {
      divider *= 10;
    }
    return minor / divider;
  }

  static String _time(DateTime value) => '${value.toUtc().toIso8601String().split('.').first}Z';

  Uri authorizationUrl({required String redirectUrl, required String state}) => authUrl.replace(queryParameters: {
        'client_id': clientId,
        'redirect_uri': redirectUrl,
        'response_type': 'code',
        'state': state,
      });

  // [input] is the redirect address (deep link or a copy of the browser's address) or the bare code
  static String extractCode(String input, {String? state, bool requireState = false}) {
    try {
      return EnableBankingClient.extractCode(input, state: state, requireState: requireState);
    } on EnableBankingException catch (e) {
      throw MonzoException(e.message);
    }
  }

  static dynamic _decode(http.Response response) {
    final text = utf8.decode(response.bodyBytes);
    try {
      return text.isEmpty ? null : jsonDecode(text);
    } on FormatException {
      return null;
    }
  }

  Never _fail(http.Response response, dynamic json) {
    final status = response.statusCode;
    final code = json is Map ? json['code']?.toString() : null;
    final message = json is Map ? (json['message'] ?? json['error_description'] ?? json['error'])?.toString() : null;
    if (status == 403 && (code ?? '').contains('insufficient_permissions')) {
      throw MonzoException(AppLocale.labels.monzoApprove, status, code);
    }
    if (status == 403 && (code ?? '').contains('verification_required')) {
      throw MonzoException(
          AppLocale.labels.monzoHistoryLimited(_time(now().subtract(historyLimit)).substring(0, 10)), status, code);
    }
    if (status == 401) {
      throw MonzoException(AppLocale.labels.monzoExpired, status, code);
    }
    if (status == 403) {
      throw MonzoException(AppLocale.labels.integrationAccessDenied, status, code);
    }
    throw MonzoException(
      message != null && message.isNotEmpty
          ? AppLocale.labels.integrationServiceError(message)
          : AppLocale.labels.integrationHttpError('$status'),
      status,
      code,
    );
  }

  Future<MonzoTokens> _token(Map<String, String> fields) async {
    final response = await _client.post(
      baseUrl.replace(path: '/oauth2/token'),
      headers: {'Accept': 'application/json'},
      body: {'client_id': clientId, 'client_secret': clientSecret, ...fields},
    ).timeout(timeout);
    final json = _decode(response);
    if (response.statusCode != 200) {
      if (fields['grant_type'] == 'refresh_token' && response.statusCode < 500) {
        throw MonzoException(AppLocale.labels.monzoExpired, 401);
      }
      // A wrong client secret, redirect URL, or an already used code
      if (response.statusCode == 400 || response.statusCode == 401) {
        throw MonzoException(AppLocale.labels.integrationAccessDenied, response.statusCode);
      }
      _fail(response, json);
    }
    final access = json is Map ? json['access_token']?.toString() : null;
    if (access == null || access.isEmpty) {
      throw MonzoException(AppLocale.labels.integrationUnexpectedResponse);
    }
    final seconds = int.tryParse('${json['expires_in'] ?? ''}') ?? 21600;
    final result = MonzoTokens(
      accessToken: access,
      // Non-confidential clients get no refresh token: the sign-in is repeated when the access expires
      refreshToken: (json['refresh_token'] ?? '').toString(),
      expiresAt: now().add(Duration(seconds: seconds)),
    );
    tokens = result;
    await onTokens?.call(result);
    return result;
  }

  Future<MonzoTokens> exchange(String code, {required String redirectUrl}) => _token({
        'grant_type': 'authorization_code',
        'redirect_uri': redirectUrl,
        'code': code,
      });

  Future<MonzoTokens> refresh() async {
    final current = tokens;
    if (current == null || current.refreshToken.isEmpty) {
      throw MonzoException(AppLocale.labels.monzoExpired, 401);
    }
    return _token({'grant_type': 'refresh_token', 'refresh_token': current.refreshToken});
  }

  Future<Map<String, dynamic>> _get(String path, Map<String, dynamic> query) async {
    var current = tokens;
    if (current == null) {
      throw MonzoException(AppLocale.labels.monzoExpired, 401);
    }
    if (!now().isBefore(current.expiresAt) && current.refreshToken.isNotEmpty) {
      current = await refresh();
    }
    final uri = baseUrl.replace(path: path, queryParameters: query);
    var response = await _client.get(uri, headers: _headers(current)).timeout(timeout);
    // Expired (or revoked) earlier than announced
    if (response.statusCode == 401 && current.refreshToken.isNotEmpty) {
      current = await refresh();
      response = await _client.get(uri, headers: _headers(current)).timeout(timeout);
    }
    final json = _decode(response);
    if (response.statusCode != 200) {
      _fail(response, json);
    }
    if (json is! Map<String, dynamic>) {
      throw MonzoException(AppLocale.labels.integrationUnexpectedResponse);
    }
    return json;
  }

  static Map<String, String> _headers(MonzoTokens tokens) => {
        'Authorization': 'Bearer ${tokens.accessToken}',
        'Accept': 'application/json',
      };

  Future<List<MonzoAccount>> getAccounts() async {
    final json = await _get('/accounts', {});
    return (json['accounts'] as List? ?? []).whereType<Map<String, dynamic>>().map(MonzoAccount.fromJson).toList();
  }

  Future<MonzoBalance> getBalance(String accountId) async {
    final json = await _get('/balance', {'account_id': accountId});
    final currency = (json['currency'] ?? 'GBP').toString();
    return MonzoBalance(balance: fromMinor(json['balance'], currency), currency: currency);
  }

  // Oldest first; the following pages continue after the id of the last transaction
  Future<List<MonzoTransaction>> getTransactions(String accountId, {required DateTime since}) async {
    final result = <MonzoTransaction>[];
    final before = _time(now());
    String cursor = _time(since);
    while (true) {
      final json = await _get('/transactions', {
        'account_id': accountId,
        'since': cursor,
        'before': before,
        'limit': '$pageSize',
        'expand[]': 'merchant',
      });
      final page = (json['transactions'] as List? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(MonzoTransaction.fromJson)
          .toList();
      result.addAll(page);
      if (page.length < pageSize || page.last.id == cursor) {
        break;
      }
      cursor = page.last.id;
    }
    return result;
  }

  Future<void> logout() async {
    final current = tokens;
    if (current == null) {
      return;
    }
    await _client.post(baseUrl.replace(path: '/oauth2/logout'), headers: _headers(current)).timeout(timeout);
  }
}
