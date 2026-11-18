// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:http/http.dart' as http;

// Wise Platform API with a Personal API Token (https://docs.wise.com/api-docs/api-reference)
class WiseException implements Exception {
  final String message;
  final int? statusCode;

  const WiseException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

// Strong Customer Authentication is required (UK/EEA)
class WiseScaException extends WiseException {
  WiseScaException() : super(AppLocale.labels.wiseScaRequired, 403);
}

typedef WiseAmount = ({double value, String currency});

class WiseProfile {
  final int id;
  final String type;
  final String name;

  const WiseProfile({required this.id, required this.type, required this.name});

  factory WiseProfile.fromJson(Map<String, dynamic> json) {
    final details = json['details'] is Map ? json['details'] as Map : const {};
    final person = [json['firstName'] ?? details['firstName'], json['lastName'] ?? details['lastName']]
        .where((e) => e != null && e.toString().isNotEmpty)
        .join(' ');
    return WiseProfile(
      id: (json['id'] as num).toInt(),
      type: (json['type'] ?? '').toString().toUpperCase(),
      name: (json['fullName'] ?? json['businessName'] ?? details['name'] ?? person).toString().trim(),
    );
  }

  String get title => [name, type].where((e) => e.isNotEmpty).join(' — ');
}

class WiseBalance {
  final int id;
  final String currency;
  final double amount;
  final String? name;

  const WiseBalance({required this.id, required this.currency, required this.amount, this.name});

  factory WiseBalance.fromJson(Map<String, dynamic> json) {
    final amount = WiseClient.parseAmount(json['amount']);
    return WiseBalance(
      id: (json['id'] as num).toInt(),
      currency: (json['currency'] ?? amount?.currency ?? '').toString(),
      amount: amount?.value ?? 0.0,
      name: json['name']?.toString(),
    );
  }
}

class WiseTransaction {
  final String type;
  final DateTime date;
  final WiseAmount amount;
  final String description;
  final String referenceNumber;
  final String? detailsType;
  final WiseAmount? sourceAmount;
  final WiseAmount? targetAmount;

  const WiseTransaction({
    required this.type,
    required this.date,
    required this.amount,
    required this.description,
    required this.referenceNumber,
    this.detailsType,
    this.sourceAmount,
    this.targetAmount,
  });

  bool get isConversion => detailsType == 'CONVERSION' && sourceAmount != null && targetAmount != null;

  factory WiseTransaction.fromJson(Map<String, dynamic> json) {
    final details = json['details'] is Map<String, dynamic> ? json['details'] as Map<String, dynamic> : const {};
    final merchant = details['merchant'] is Map ? details['merchant']['name'] : null;
    final amount = WiseClient.parseAmount(json['amount']);
    final date = DateTime.tryParse(json['date']?.toString() ?? '');
    if (amount == null || date == null) {
      throw WiseException(AppLocale.labels.integrationInvalidAmount('${json['amount']}'));
    }
    return WiseTransaction(
      type: (json['type'] ?? '').toString(),
      date: date.toLocal(),
      amount: amount,
      description: (merchant ?? details['description'] ?? '').toString().trim(),
      referenceNumber: (json['referenceNumber'] ?? '').toString(),
      detailsType: details['type']?.toString(),
      sourceAmount: WiseClient.parseAmount(details['sourceAmount']),
      targetAmount: WiseClient.parseAmount(details['targetAmount']),
    );
  }
}

class WiseClient {
  static const timeout = Duration(seconds: 90);
  static final api = Uri.parse('https://api.wise.com');
  static const maxInterval = Duration(days: 469);

  final http.Client _client;
  final Uri baseUrl;

  WiseClient({http.Client? client, Uri? baseUrl})
      : _client = client ?? http.Client(),
        baseUrl = baseUrl ?? api;

  void close() => _client.close();

  static WiseAmount? parseAmount(dynamic value) {
    if (value is! Map) {
      return null;
    }
    final amount = value['value'];
    final result = amount is num ? amount.toDouble() : double.tryParse(amount?.toString() ?? '');
    if (result == null) {
      throw WiseException(AppLocale.labels.integrationInvalidAmount('$amount'));
    }
    return (value: result, currency: (value['currency'] ?? '').toString());
  }

  static String _time(DateTime value) => value.toUtc().toIso8601String();

  Future<dynamic> _get(String token, String path, [Map<String, String>? query]) async {
    final uri = baseUrl.replace(path: path, queryParameters: query);
    final response = await _client.get(uri, headers: {
      'Authorization': 'Bearer ${token.trim()}',
      'Accept': 'application/json',
    }).timeout(timeout);
    final headers = response.headers;
    final requiresSca = response.statusCode == 403 &&
        headers.containsKey('x-2fa-approval') &&
        headers['x-2fa-approval-result']?.toUpperCase() == 'REJECTED';
    if (requiresSca) {
      throw WiseScaException();
    }
    if (response.statusCode == 401 || response.statusCode == 403) {
      throw WiseException(AppLocale.labels.integrationAccessDenied, response.statusCode);
    }
    if (response.statusCode != 200) {
      throw WiseException(AppLocale.labels.integrationHttpError('${response.statusCode}'), response.statusCode);
    }
    try {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } on FormatException {
      throw WiseException(AppLocale.labels.integrationUnexpectedResponse);
    }
  }

  static List<Map<String, dynamic>> _list(dynamic json) {
    if (json is! List) {
      throw WiseException(AppLocale.labels.integrationUnexpectedResponse);
    }
    return json.whereType<Map<String, dynamic>>().toList();
  }

  Future<List<WiseProfile>> getProfiles(String token) async =>
      _list(await _get(token, '/v2/profiles')).map(WiseProfile.fromJson).toList();

  Future<List<WiseBalance>> getBalances(String token, int profileId) async =>
      _list(await _get(token, '/v4/profiles/$profileId/balances', {'types': 'STANDARD'}))
          .map(WiseBalance.fromJson)
          .toList();

  Future<List<WiseTransaction>> getStatement(
    String token, {
    required int profileId,
    required WiseBalance balance,
    required DateTime start,
    DateTime? end,
  }) async {
    final result = <WiseTransaction>[];
    final till = end ?? DateTime.now();
    var from = start;
    while (from.isBefore(till)) {
      final to = from.add(maxInterval).isBefore(till) ? from.add(maxInterval) : till;
      final json = await _get(token, '/v1/profiles/$profileId/balance-statements/${balance.id}/statement.json', {
        'currency': balance.currency,
        'intervalStart': _time(from),
        'intervalEnd': _time(to),
        'type': 'COMPACT',
      });
      if (json is! Map<String, dynamic>) {
        throw WiseException(AppLocale.labels.integrationUnexpectedResponse);
      }
      result.addAll(_list(json['transactions'] ?? []).map(WiseTransaction.fromJson));
      from = to;
    }
    return result;
  }
}
