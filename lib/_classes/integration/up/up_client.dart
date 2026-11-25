// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:http/http.dart' as http;

// Up Banking API (https://developer.up.com.au): JSON:API with a Personal Access Token
class UpException implements Exception {
  final String message;
  final int? statusCode;

  const UpException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

typedef UpAmount = ({double value, String currency});

class UpAccount {
  final String id;
  final String name;
  final String type;
  final UpAmount balance;

  const UpAccount({required this.id, required this.name, required this.balance, this.type = ''});

  factory UpAccount.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'] is Map ? json['attributes'] as Map : const {};
    return UpAccount(
      id: json['id'].toString(),
      name: (attributes['displayName'] ?? '').toString().trim(),
      type: (attributes['accountType'] ?? '').toString(),
      balance: UpClient.parseAmount(attributes['balance']),
    );
  }
}

class UpTransaction {
  final String id;
  final DateTime date;
  final UpAmount amount;
  final String description;
  final bool held;
  // The other Up account of a transfer (incl. Round Ups and Savers)
  final String? transferAccount;

  const UpTransaction({
    required this.id,
    required this.date,
    required this.amount,
    required this.description,
    this.held = false,
    this.transferAccount,
  });

  factory UpTransaction.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'] is Map ? json['attributes'] as Map : const {};
    final relationships = json['relationships'] is Map ? json['relationships'] as Map : const {};
    final transfer = relationships['transferAccount'] is Map ? relationships['transferAccount'] as Map : const {};
    final data = transfer['data'] is Map ? transfer['data'] as Map : null;
    return UpTransaction(
      id: json['id'].toString(),
      date: DateTime.parse(attributes['createdAt'].toString()).toLocal(),
      // Always in Australian dollars, foreign purchases are converted
      amount: UpClient.parseAmount(attributes['amount']),
      description: (attributes['description'] ?? attributes['rawText'] ?? '').toString().trim(),
      held: attributes['status'] != 'SETTLED',
      transferAccount: data?['id']?.toString(),
    );
  }
}

class UpClient {
  static final baseUrl = Uri.parse('https://api.up.com.au');
  static const timeout = Duration(seconds: 90);
  static const pageSize = 100;

  final http.Client _client;

  UpClient({http.Client? client}) : _client = client ?? http.Client();

  void close() => _client.close();

  static UpAmount parseAmount(dynamic json) {
    final value = json is Map ? double.tryParse('${json['value'] ?? ''}') : null;
    if (value == null) {
      throw UpException(AppLocale.labels.integrationInvalidAmount('$json'));
    }
    return (value: value, currency: (json['currencyCode'] ?? 'AUD').toString());
  }

  Future<Map<String, dynamic>> _get(String token, Uri uri) async {
    // Pages are followed by the absolute links of Up: only its own host receives the token
    if (uri.scheme != 'https' || uri.host != baseUrl.host) {
      throw UpException(AppLocale.labels.integrationUnexpectedResponse);
    }
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
    if (response.statusCode == 200 && json is Map<String, dynamic>) {
      return json;
    }
    if (response.statusCode == 401 || response.statusCode == 403) {
      throw UpException(AppLocale.labels.integrationAccessDenied, response.statusCode);
    }
    final errors = json is Map && json['errors'] is List ? json['errors'] as List : const [];
    final error = errors.whereType<Map>().firstOrNull;
    final message = error?['detail'] ?? error?['title'];
    throw UpException(
      message != null
          ? AppLocale.labels.integrationServiceError('$message')
          : AppLocale.labels.integrationHttpError('${response.statusCode}'),
      response.statusCode,
    );
  }

  // JSON:API pagination: "links.next" until it is null
  Future<List<Map<String, dynamic>>> _list(String token, Uri first) async {
    final result = <Map<String, dynamic>>[];
    Uri? next = first;
    final visited = <Uri>{};
    while (next != null && visited.add(next)) {
      final json = await _get(token, next);
      result.addAll((json['data'] as List? ?? const []).whereType<Map<String, dynamic>>());
      final links = json['links'] is Map ? json['links'] as Map : const {};
      next = links['next'] is String ? Uri.tryParse(links['next']) : null;
    }
    return result;
  }

  Future<void> ping(String token) => _get(token, baseUrl.replace(path: '/api/v1/util/ping'));

  Future<List<UpAccount>> getAccounts(String token) async => (await _list(
        token,
        baseUrl.replace(path: '/api/v1/accounts', queryParameters: {'page[size]': '$pageSize'}),
      ))
          .map(UpAccount.fromJson)
          .toList();

  Future<List<UpTransaction>> getTransactions(String token, String accountId, {required DateTime since}) async =>
      (await _list(
        token,
        baseUrl.replace(path: '/api/v1/accounts/$accountId/transactions', queryParameters: {
          'page[size]': '$pageSize',
          'filter[since]': since.toUtc().toIso8601String(),
        }),
      ))
          .map(UpTransaction.fromJson)
          .toList();
}
