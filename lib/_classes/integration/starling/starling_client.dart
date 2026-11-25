// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:http/http.dart' as http;

// Starling Bank Public API v2 with a Personal Access Token (https://developer.starlingbank.com)
class StarlingException implements Exception {
  final String message;
  final int? statusCode;

  const StarlingException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

typedef StarlingAmount = ({double value, String currency});

class StarlingAccount {
  final String id;
  final String defaultCategory;
  final String currency;
  final String name;
  final String type;

  const StarlingAccount({
    required this.id,
    required this.defaultCategory,
    required this.currency,
    this.name = '',
    this.type = '',
  });

  String get title => [name, currency].where((e) => e.isNotEmpty).join(' — ');

  factory StarlingAccount.fromJson(Map<String, dynamic> json) => StarlingAccount(
        id: json['accountUid'].toString(),
        defaultCategory: (json['defaultCategory'] ?? '').toString(),
        currency: (json['currency'] ?? 'GBP').toString(),
        name: (json['name'] ?? '').toString().trim(),
        type: (json['accountType'] ?? '').toString(),
      );
}

enum StarlingStatus {
  // Imported: money has moved (a refunded transaction is followed by its refund)
  booked,
  // Counted as pending: may still change
  pending,
  // Left out: no money has moved
  ignored;

  static StarlingStatus parse(String? value) => switch ((value ?? '').toUpperCase()) {
        'SETTLED' || 'REFUNDED' => booked,
        'PENDING' || 'UPCOMING' || 'RETRYING' => pending,
        _ => ignored,
      };
}

class StarlingFeedItem {
  final String id;
  final DateTime date;
  final double amount;
  final String currency;
  final String title;
  final StarlingStatus status;

  const StarlingFeedItem({
    required this.id,
    required this.date,
    required this.amount,
    required this.currency,
    required this.title,
    required this.status,
  });

  factory StarlingFeedItem.fromJson(Map<String, dynamic> json) {
    final amount = StarlingClient.parseAmount(json['amount']);
    final counterparty = (json['counterPartyName'] ?? '').toString().trim();
    final reference = (json['reference'] ?? '').toString().trim();
    return StarlingFeedItem(
      id: json['feedItemUid'].toString(),
      date: DateTime.parse(json['transactionTime'].toString()).toLocal(),
      // Amounts are always positive: the direction tells whether money comes in or goes out
      amount: json['direction'].toString().toUpperCase() == 'OUT' ? -amount.value.abs() : amount.value.abs(),
      currency: amount.currency,
      title: counterparty.isNotEmpty ? counterparty : reference,
      status: StarlingStatus.parse(json['status']?.toString()),
    );
  }
}

class StarlingClient {
  static final baseUrl = Uri.parse('https://api.starlingbank.com');
  static const timeout = Duration(seconds: 90);

  final http.Client _client;

  StarlingClient({http.Client? client}) : _client = client ?? http.Client();

  void close() => _client.close();

  static StarlingAmount parseAmount(dynamic json) {
    final currency = json is Map ? (json['currency'] ?? 'GBP').toString() : 'GBP';
    final minor = json is Map ? json['minorUnits'] : null;
    final value = minor is num ? minor : num.tryParse('${minor ?? ''}');
    if (value == null) {
      throw StarlingException(AppLocale.labels.integrationInvalidAmount('$json'));
    }
    final digits = CurrencyProvider.find(currency)?.decimalDigits ?? 2;
    var divider = 1;
    for (var i = 0; i < digits; i++) {
      divider *= 10;
    }
    return (value: value / divider, currency: currency);
  }

  static String _time(DateTime value) => '${value.toUtc().toIso8601String().split('.').first}.000Z';

  Future<Map<String, dynamic>> _get(String token, String path, [Map<String, String>? query]) async {
    final uri = baseUrl.replace(path: path, queryParameters: query == null || query.isEmpty ? null : query);
    final response = await _client.get(uri, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    }).timeout(timeout);
    dynamic json;
    try {
      json = jsonDecode(utf8.decode(response.bodyBytes));
    } on FormatException {
      json = null;
    }
    if (response.statusCode != 200) {
      final error = json is Map ? json['error']?.toString() : null;
      final errors = json is Map && json['errors'] is List ? json['errors'] as List : const [];
      final message = json is Map
          ? (json['error_description'] ?? errors.whereType<Map>().map((e) => e['message']).firstOrNull)?.toString()
          : null;
      if (response.statusCode == 403 && (error == 'insufficient_scope' || (message ?? '').contains('scope'))) {
        throw StarlingException(AppLocale.labels.starlingScopes, 403);
      }
      if (response.statusCode == 401 || response.statusCode == 403) {
        throw StarlingException(AppLocale.labels.integrationAccessDenied, response.statusCode);
      }
      throw StarlingException(
        message != null && message.isNotEmpty
            ? AppLocale.labels.integrationServiceError(message)
            : AppLocale.labels.integrationHttpError('${response.statusCode}'),
        response.statusCode,
      );
    }
    if (json is! Map<String, dynamic>) {
      throw StarlingException(AppLocale.labels.integrationUnexpectedResponse);
    }
    return json;
  }

  Future<List<StarlingAccount>> getAccounts(String token) async {
    final json = await _get(token, '/api/v2/accounts');
    return (json['accounts'] as List? ?? []).whereType<Map<String, dynamic>>().map(StarlingAccount.fromJson).toList();
  }

  // The effective balance includes pending transactions, as shown in the Starling app
  Future<StarlingAmount> getBalance(String token, String accountId) async {
    final json = await _get(token, '/api/v2/accounts/$accountId/balance');
    return parseAmount(json['effectiveBalance'] ?? json['clearedBalance']);
  }

  // Items of the account's main category changed since [from]; older ones (e.g. settled lately) are left out
  Future<List<StarlingFeedItem>> getFeed(String token, StarlingAccount account, {required DateTime from}) async {
    final json = await _get(
      token,
      '/api/v2/feed/account/${account.id}/category/${account.defaultCategory}',
      {'changesSince': _time(from)},
    );
    return (json['feedItems'] as List? ?? [])
        .whereType<Map<String, dynamic>>()
        .map(StarlingFeedItem.fromJson)
        .where((e) => !e.date.isBefore(from))
        .toList();
  }
}
