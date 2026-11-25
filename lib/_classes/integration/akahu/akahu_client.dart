// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:http/http.dart' as http;

// Akahu API with a personal app (https://developers.akahu.nz/docs/personal-apps)
class AkahuException implements Exception {
  final String message;
  final int? statusCode;

  const AkahuException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

typedef AkahuTokens = ({String appToken, String userToken});

class AkahuAccount {
  final String id;
  final String name;
  final String institution;
  final String? number;
  final String currency;
  final double? balance;
  final bool isActive;
  final bool hasTransactions;

  const AkahuAccount({
    required this.id,
    required this.name,
    this.institution = '',
    this.number,
    this.currency = 'NZD',
    this.balance,
    this.isActive = true,
    this.hasTransactions = true,
  });

  String get title => [
        institution,
        [name, number ?? ''].where((e) => e.isNotEmpty).join(' ')
      ].where((e) => e.isNotEmpty).join(' — ');

  factory AkahuAccount.fromJson(Map<String, dynamic> json) {
    final connection = json['connection'] is Map ? json['connection'] as Map : const {};
    final balance = json['balance'] is Map ? json['balance'] as Map : const {};
    final attributes = (json['attributes'] as List? ?? const []).map((e) => '$e');
    final current = balance['current'];
    return AkahuAccount(
      id: json['_id'].toString(),
      name: (json['name'] ?? '').toString().trim(),
      institution: (connection['name'] ?? '').toString().trim(),
      number: json['formatted_account']?.toString(),
      currency: (balance['currency'] ?? 'NZD').toString(),
      balance: current is num ? current.toDouble() : double.tryParse('${current ?? ''}'),
      // Akahu keeps serving its cached copy of an inactive account
      isActive: json['status'] != 'INACTIVE',
      hasTransactions: attributes.isEmpty || attributes.contains('TRANSACTIONS'),
    );
  }
}

class AkahuTransaction {
  final String id;
  final DateTime date;
  final double amount;
  final String description;
  // Enriched data: the NZ Financial Category Codes (NZFCC) name and its personal finance group
  final List<String> categories;

  const AkahuTransaction({
    required this.id,
    required this.date,
    required this.amount,
    required this.description,
    this.categories = const [],
  });

  factory AkahuTransaction.fromJson(Map<String, dynamic> json) {
    final merchant = json['merchant'] is Map ? json['merchant'] as Map : const {};
    final category = json['category'] is Map ? json['category'] as Map : const {};
    final groups = category['groups'] is Map ? category['groups'] as Map : const {};
    final group = groups['personal_finance'] is Map ? groups['personal_finance'] as Map : const {};
    final name = (merchant['name'] ?? '').toString().trim();
    return AkahuTransaction(
      id: json['_id'].toString(),
      date: DateTime.parse(json['date'].toString()).toLocal(),
      amount: AkahuClient.parseAmount(json['amount']),
      description: name.isNotEmpty ? name : (json['description'] ?? '').toString().trim(),
      categories: [category['name'], group['name']].whereType<String>().where((e) => e.isNotEmpty).toList(),
    );
  }
}

class AkahuClient {
  static final baseUrl = Uri.parse('https://api.akahu.io');
  static const timeout = Duration(seconds: 90);

  final http.Client _client;

  AkahuClient({http.Client? client}) : _client = client ?? http.Client();

  void close() => _client.close();

  static double parseAmount(dynamic value) {
    final result = value is num ? value.toDouble() : double.tryParse('${value ?? ''}');
    if (result == null) {
      throw AkahuException(AppLocale.labels.integrationInvalidAmount('$value'));
    }
    return result;
  }

  Future<Map<String, dynamic>> _request(String method, AkahuTokens tokens, String path,
      [Map<String, String>? query]) async {
    final uri = baseUrl.replace(path: path, queryParameters: query == null || query.isEmpty ? null : query);
    final request = http.Request(method, uri)
      ..headers.addAll({
        'Authorization': 'Bearer ${tokens.userToken}',
        'X-Akahu-Id': tokens.appToken,
        'Accept': 'application/json',
      });
    final response = await http.Response.fromStream(await _client.send(request).timeout(timeout));
    dynamic json;
    try {
      json = jsonDecode(utf8.decode(response.bodyBytes));
    } on FormatException {
      json = null;
    }
    if (response.statusCode == 200 && json is Map<String, dynamic> && json['success'] != false) {
      return json;
    }
    final message = json is Map ? json['message']?.toString() : null;
    if (response.statusCode == 401 || response.statusCode == 403) {
      throw AkahuException(AppLocale.labels.integrationAccessDenied, response.statusCode);
    }
    throw AkahuException(
      message != null && message.isNotEmpty
          ? AppLocale.labels.integrationServiceError(message)
          : (response.statusCode == 200
              ? AppLocale.labels.integrationUnexpectedResponse
              : AppLocale.labels.integrationHttpError('${response.statusCode}')),
      response.statusCode,
    );
  }

  static List<Map<String, dynamic>> _items(Map<String, dynamic> json) =>
      (json['items'] as List? ?? const []).whereType<Map<String, dynamic>>().toList();

  Future<List<AkahuAccount>> getAccounts(AkahuTokens tokens) async =>
      _items(await _request('GET', tokens, '/v1/accounts')).map(AkahuAccount.fromJson).toList();

  // Settled transactions dated from [from] on, page by page (the start of the range is exclusive)
  Future<List<AkahuTransaction>> getTransactions(AkahuTokens tokens, String accountId, {required DateTime from}) async {
    final start = from.toUtc().subtract(const Duration(milliseconds: 1)).toIso8601String();
    final result = <AkahuTransaction>[];
    String? cursor;
    do {
      final json = await _request('GET', tokens, '/v1/accounts/$accountId/transactions', {
        'start': start,
        if (cursor != null) 'cursor': cursor,
      });
      result.addAll(_items(json).map(AkahuTransaction.fromJson));
      final next = json['cursor'] is Map ? (json['cursor'] as Map)['next'] : null;
      cursor = next is String && next.isNotEmpty && next != cursor ? next : null;
    } while (cursor != null);
    return result;
  }

  // Pending transactions have no identifier and may change completely: they are only counted
  Future<int> countPending(AkahuTokens tokens, String accountId) async =>
      _items(await _request('GET', tokens, '/v1/accounts/$accountId/transactions/pending')).length;

  // Akahu may ignore it within the rest period (an hour for personal apps)
  Future<void> refresh(AkahuTokens tokens) => _request('POST', tokens, '/v1/refresh');
}
