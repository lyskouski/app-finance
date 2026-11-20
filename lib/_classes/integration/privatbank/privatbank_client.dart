// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:http/http.dart' as http;

// PrivatBank "Autoclient" API of Privat24 for Business (https://acp.privatbank.ua)
class PrivatBankException implements Exception {
  final String message;
  final int? statusCode;

  const PrivatBankException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

// Statements are being prepared by the bank (the phase differs from "WRK")
class PrivatBankNotReadyException extends PrivatBankException {
  final String phase;

  PrivatBankNotReadyException(this.phase) : super(AppLocale.labels.privatBankNotReady(phase));
}

class PrivatBankBalance {
  final String iban;
  final String currency;
  final double amount;
  final String? name;

  const PrivatBankBalance({required this.iban, required this.currency, required this.amount, this.name});

  factory PrivatBankBalance.fromJson(Map<String, dynamic> json) => PrivatBankBalance(
        iban: (json['acc'] ?? '').toString(),
        currency: (json['currency'] ?? '').toString(),
        amount: PrivatBankClient.parseAmount(json['balanceOut']),
        name: json['nameACC']?.toString(),
      );
}

class PrivatBankTransaction {
  final String id;
  final DateTime date;
  final double amount;
  final String currency;
  final String title;
  // "r" - booked, "p" - in progress, "t" - reversed, "n" - rejected
  final String status;
  final bool isReal;

  const PrivatBankTransaction({
    required this.id,
    required this.date,
    required this.amount,
    required this.currency,
    required this.title,
    this.status = 'r',
    this.isReal = true,
  });

  bool get isBooked => isReal && status == 'r';

  bool get isPending => status == 'p' || (!isReal && status == 'r');

  factory PrivatBankTransaction.fromJson(Map<String, dynamic> json) {
    final value = PrivatBankClient.parseAmount(json['SUM']).abs();
    final date = PrivatBankClient.parseDate(json['DATE_TIME_DAT_OD_TIM_P']) ??
        PrivatBankClient.parseDate('${json['DAT_OD'] ?? ''} ${json['TIM_P'] ?? ''}') ??
        PrivatBankClient.parseDate(json['DAT_OD']);
    if (date == null) {
      throw PrivatBankException(AppLocale.labels.integrationUnexpectedResponse);
    }
    final counterparty = (json['AUT_CNTR_NAM'] ?? '').toString().trim();
    final reference = [json['REF'], json['REFN']].where((e) => e != null && '$e'.isNotEmpty).join('.');
    return PrivatBankTransaction(
      id: (json['ID'] ?? reference).toString(),
      date: date,
      amount: json['TRANTYPE'] == 'D' ? -value : value,
      currency: (json['CCY'] ?? '').toString(),
      title: counterparty.isNotEmpty ? counterparty : (json['OSND'] ?? '').toString().trim(),
      status: (json['PR_PR'] ?? 'r').toString().toLowerCase(),
      isReal: (json['FL_REAL'] ?? 'r').toString().toLowerCase() == 'r',
    );
  }
}

class PrivatBankClient {
  static const timeout = Duration(seconds: 90);
  static final api = Uri.parse('https://acp.privatbank.ua');
  static const userAgent = 'Fingrom';
  static const phaseReady = 'WRK';
  static const limit = 500;

  final http.Client _client;
  final Uri baseUrl;

  PrivatBankClient({http.Client? client, Uri? baseUrl})
      : _client = client ?? http.Client(),
        baseUrl = baseUrl ?? api;

  void close() => _client.close();

  // Ukrainian IBAN: "UA" followed by 27 digits
  static String? normalizeIban(String value) {
    final result = value.replaceAll(RegExp(r'\s'), '').toUpperCase();
    return RegExp(r'^UA\d{27}$').hasMatch(result) ? result : null;
  }

  static double parseAmount(dynamic value) {
    final result = value is num ? value.toDouble() : double.tryParse('${value ?? ''}'.trim().replaceAll(',', '.'));
    if (result == null) {
      throw PrivatBankException(AppLocale.labels.integrationInvalidAmount('$value'));
    }
    return result;
  }

  // "dd.MM.yyyy" with an optional "HH:mm[:ss]"
  static DateTime? parseDate(dynamic value) {
    final match = RegExp(r'^(\d{2})\.(\d{2})\.(\d{4})(?:\s+(\d{1,2}):(\d{2})(?::(\d{2}))?)?$')
        .firstMatch('${value ?? ''}'.trim());
    if (match == null) {
      return null;
    }
    int part(int idx) => int.parse(match.group(idx) ?? '0');
    return DateTime(part(3), part(2), part(1), part(4), part(5), part(6));
  }

  static String formatDate(DateTime value) =>
      '${value.day.toString().padLeft(2, '0')}-${value.month.toString().padLeft(2, '0')}-${value.year}';

  Future<Map<String, dynamic>> _get(String token, String path, [Map<String, String>? query]) async {
    final uri = baseUrl.replace(path: path, queryParameters: query);
    final response = await _client.get(uri, headers: {
      'User-Agent': userAgent,
      'token': token.trim(),
      'Content-Type': 'application/json;charset=utf-8',
      'Accept': 'application/json',
    }).timeout(timeout);
    if (response.statusCode == 401 || response.statusCode == 403) {
      throw PrivatBankException(AppLocale.labels.integrationAccessDenied, response.statusCode);
    }
    dynamic json;
    try {
      json = jsonDecode(utf8.decode(response.bodyBytes, allowMalformed: true));
    } on FormatException {
      json = null;
    }
    final message = json is Map ? (json['message'] ?? json['error'])?.toString() : null;
    if (json is Map && json['status'] == 'ERROR') {
      throw PrivatBankException(
          AppLocale.labels.integrationServiceError(message ?? '${response.statusCode}'), response.statusCode);
    }
    if (response.statusCode != 200) {
      throw PrivatBankException(AppLocale.labels.integrationHttpError('${response.statusCode}'), response.statusCode);
    }
    if (json is! Map<String, dynamic>) {
      throw PrivatBankException(AppLocale.labels.integrationUnexpectedResponse);
    }
    return json;
  }

  static List<Map<String, dynamic>> _list(dynamic json) {
    if (json is! List) {
      throw PrivatBankException(AppLocale.labels.integrationUnexpectedResponse);
    }
    return json.whereType<Map<String, dynamic>>().toList();
  }

  // The phase of the statements service: "WRK" when the data is available
  Future<String> getPhase(String token) async {
    final json = await _get(token, '/api/statements/settings');
    final settings = json['settings'];
    if (settings is! Map) {
      throw PrivatBankException(AppLocale.labels.integrationUnexpectedResponse);
    }
    return (settings['phase'] ?? '').toString();
  }

  Future<void> ensureReady(String token) async {
    final phase = await getPhase(token);
    if (phase != phaseReady) {
      throw PrivatBankNotReadyException(phase);
    }
  }

  Future<List<Map<String, dynamic>>> _pages(String token, String path, String key, Map<String, String> query) async {
    final result = <Map<String, dynamic>>[];
    String? followId;
    do {
      final json = await _get(token, path, {
        ...query,
        'limit': '$limit',
        if (followId != null) 'followId': followId,
      });
      result.addAll(_list(json[key] ?? []));
      final next = json['next_page_id']?.toString();
      final hasNext = json['exist_next_page'] == true && next != null && next.isNotEmpty && next != followId;
      followId = hasNext ? next : null;
    } while (followId != null);
    return result;
  }

  Future<PrivatBankBalance?> getBalance(String token, String iban, {DateTime? date}) async {
    final day = date ?? DateTime.now();
    final balances = await _pages(token, '/api/statements/balance', 'balances', {
      'acc': iban,
      'startDate': formatDate(day.subtract(const Duration(days: 1))),
      'endDate': formatDate(day),
    });
    return balances.isEmpty ? null : PrivatBankBalance.fromJson(balances.last);
  }

  Future<List<PrivatBankTransaction>> getTransactions(
    String token, {
    required String iban,
    required DateTime start,
    DateTime? end,
  }) async {
    final transactions = await _pages(token, '/api/statements/transactions', 'transactions', {
      'acc': iban,
      'startDate': formatDate(start),
      'endDate': formatDate(end ?? DateTime.now()),
    });
    return transactions.map(PrivatBankTransaction.fromJson).toList();
  }
}
