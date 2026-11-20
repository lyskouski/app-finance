// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:http/http.dart' as http;

// Monobank Personal API (https://api.monobank.ua/docs/)
class MonobankException implements Exception {
  final String message;
  final int? statusCode;

  const MonobankException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class MonobankCanceledException extends MonobankException {
  const MonobankCanceledException() : super('');
}

// Stops long-running requests (statements are limited to one call per minute)
class MonobankCancelToken {
  final _completer = Completer<void>();

  bool get isCanceled => _completer.isCompleted;

  Future<void> get future => _completer.future;

  void cancel() {
    if (!_completer.isCompleted) {
      _completer.complete();
    }
  }
}

// [done] of [total] statement windows are received; [wait] is a pause before the next request
typedef MonobankProgress = void Function(int done, int total, Duration? wait);

typedef MonobankWindow = ({DateTime from, DateTime to});

class MonobankAccount {
  final String id;
  final String? iban;
  final String currency;
  final int balance;
  final int creditLimit;
  // "black", "white", "platinum", "iron", "fop", "yellow", "eAid", "madeInUkraine"
  final String type;
  final List<String> maskedPan;
  final bool isJar;
  final String? title;

  const MonobankAccount({
    required this.id,
    required this.currency,
    required this.balance,
    this.iban,
    this.creditLimit = 0,
    this.type = '',
    this.maskedPan = const [],
    this.isJar = false,
    this.title,
  });

  double get amount => MonobankClient.fromMinor(balance - creditLimit, currency);

  double get limit => MonobankClient.fromMinor(creditLimit, currency);

  factory MonobankAccount.fromJson(Map<String, dynamic> json) => MonobankAccount(
        id: (json['id'] ?? '').toString(),
        iban: json['iban']?.toString(),
        currency: MonobankClient.currencyCode(json['currencyCode']),
        balance: MonobankClient.parseInt(json['balance']),
        creditLimit: MonobankClient.parseInt(json['creditLimit'] ?? 0),
        type: (json['type'] ?? '').toString(),
        maskedPan: (json['maskedPan'] as List<dynamic>? ?? []).map((e) => e.toString()).toList(),
      );

  factory MonobankAccount.fromJarJson(Map<String, dynamic> json) => MonobankAccount(
        id: (json['id'] ?? '').toString(),
        currency: MonobankClient.currencyCode(json['currencyCode']),
        balance: MonobankClient.parseInt(json['balance']),
        isJar: true,
        title: json['title']?.toString(),
      );
}

class MonobankClientInfo {
  final String name;
  final List<MonobankAccount> accounts;

  const MonobankClientInfo({required this.name, required this.accounts});

  factory MonobankClientInfo.fromJson(Map<String, dynamic> json) => MonobankClientInfo(
        name: (json['name'] ?? '').toString(),
        accounts: [
          ...MonobankClient._list(json['accounts'] ?? []).map(MonobankAccount.fromJson),
          ...MonobankClient._list(json['jars'] ?? []).map(MonobankAccount.fromJarJson),
        ],
      );
}

class MonobankTransaction {
  final String id;
  final DateTime date;
  final int amount;
  final String title;
  final int? mcc;
  final bool isHold;

  const MonobankTransaction({
    required this.id,
    required this.date,
    required this.amount,
    required this.title,
    this.mcc,
    this.isHold = false,
  });

  factory MonobankTransaction.fromJson(Map<String, dynamic> json) {
    final time = json['time'];
    if (json['id'] == null || time is! num) {
      throw MonobankException(AppLocale.labels.integrationUnexpectedResponse);
    }
    final title = [json['description'], json['counterName'], json['comment']]
        .map((e) => (e ?? '').toString().trim())
        .firstWhere((e) => e.isNotEmpty, orElse: () => '');
    final mcc = json['mcc'];
    return MonobankTransaction(
      id: json['id'].toString(),
      date: DateTime.fromMillisecondsSinceEpoch(time.toInt() * 1000),
      amount: MonobankClient.parseInt(json['amount']),
      title: title,
      mcc: mcc is num && mcc > 0 ? mcc.toInt() : null,
      isHold: json['hold'] == true,
    );
  }
}

class MonobankClient {
  static const timeout = Duration(seconds: 60);
  static final api = Uri.parse('https://api.monobank.ua');
  static const userAgent = 'Fingrom';
  static const interval = Duration(seconds: 61);
  static const window = Duration(days: 31);
  static const limit = 500;
  static const retries = 2;

  final http.Client _client;
  final Uri baseUrl;
  final Future<void> Function(Duration duration) _wait;
  final DateTime Function() _now;
  final _lastCall = <String, DateTime>{};

  MonobankClient({
    http.Client? client,
    Uri? baseUrl,
    Future<void> Function(Duration duration)? wait,
    DateTime Function()? now,
  })  : _client = client ?? http.Client(),
        baseUrl = baseUrl ?? api,
        _wait = wait ?? Future<void>.delayed,
        _now = now ?? DateTime.now;

  void close() => _client.close();

  static int parseInt(dynamic value) {
    final result = value is num ? value.toInt() : int.tryParse('${value ?? ''}'.trim());
    if (result == null) {
      throw MonobankException(AppLocale.labels.integrationInvalidAmount('$value'));
    }
    return result;
  }

  static int _digits(String currency) => CurrencyProvider.find(currency)?.decimalDigits ?? 2;

  static double fromMinor(int value, String currency) {
    final digits = _digits(currency);
    var divider = 1;
    for (var i = 0; i < digits; i++) {
      divider *= 10;
    }
    return value / divider;
  }

  // ISO 4217 numeric code to the alphabetic one
  static String currencyCode(dynamic value) {
    final code = int.tryParse('${value ?? ''}');
    return _iso4217[code] ?? '${value ?? ''}';
  }

  static List<MonobankWindow> split(DateTime from, DateTime to) {
    final result = <MonobankWindow>[];
    var start = from;
    while (start.isBefore(to)) {
      final end = start.add(window);
      result.add((from: start, to: end.isBefore(to) ? end : to));
      start = end;
    }
    return result;
  }

  static int _seconds(DateTime value) => value.millisecondsSinceEpoch ~/ 1000;

  static List<Map<String, dynamic>> _list(dynamic json) {
    if (json is! List) {
      throw MonobankException(AppLocale.labels.integrationUnexpectedResponse);
    }
    return json.whereType<Map<String, dynamic>>().toList();
  }

  Future<void> _pause(Duration duration, MonobankCancelToken? cancel) async {
    if (duration <= Duration.zero) {
      return;
    }
    await Future.any([_wait(duration), if (cancel != null) cancel.future]);
    if (cancel?.isCanceled ?? false) {
      throw const MonobankCanceledException();
    }
  }

  Future<void> _throttle(String endpoint, MonobankCancelToken? cancel, void Function(Duration wait)? onWait) async {
    final last = _lastCall[endpoint];
    if (last != null) {
      final left = interval - _now().difference(last);
      if (left > Duration.zero) {
        onWait?.call(left);
        await _pause(left, cancel);
      }
    }
  }

  Future<dynamic> _get(
    String token,
    String endpoint,
    String path, {
    MonobankCancelToken? cancel,
    void Function(Duration wait)? onWait,
  }) async {
    for (var attempt = 0;; attempt++) {
      if (cancel?.isCanceled ?? false) {
        throw const MonobankCanceledException();
      }
      await _throttle(endpoint, cancel, onWait);
      _lastCall[endpoint] = _now();
      final response = await _client.get(baseUrl.replace(path: path), headers: {
        // Browsers forbid to change the agent, and the preflight of CORS allows only "X-Token"
        if (!kIsWeb) 'User-Agent': userAgent,
        'X-Token': token.trim(),
        'Accept': 'application/json',
      }).timeout(timeout);
      if (response.statusCode == 429 && attempt < retries) {
        continue;
      }
      if (response.statusCode == 401 || response.statusCode == 403) {
        throw MonobankException(AppLocale.labels.integrationAccessDenied, response.statusCode);
      }
      dynamic json;
      try {
        json = jsonDecode(utf8.decode(response.bodyBytes, allowMalformed: true));
      } on FormatException {
        json = null;
      }
      if (response.statusCode != 200) {
        final message = json is Map ? json['errorDescription']?.toString() : null;
        throw MonobankException(
          message != null
              ? AppLocale.labels.integrationServiceError(message)
              : AppLocale.labels.integrationHttpError('${response.statusCode}'),
          response.statusCode,
        );
      }
      return json;
    }
  }

  Future<MonobankClientInfo> getClientInfo(String token, {MonobankCancelToken? cancel}) async {
    final json = await _get(token, 'client-info', '/personal/client-info', cancel: cancel);
    if (json is! Map<String, dynamic>) {
      throw MonobankException(AppLocale.labels.integrationUnexpectedResponse);
    }
    return MonobankClientInfo.fromJson(json);
  }

  Future<List<MonobankTransaction>> getStatement(
    String token,
    String account,
    DateTime from,
    DateTime to, {
    MonobankCancelToken? cancel,
    void Function(Duration wait)? onWait,
  }) async {
    final json = await _get(
      token,
      'statement',
      '/personal/statement/$account/${_seconds(from)}/${_seconds(to)}',
      cancel: cancel,
      onWait: onWait,
    );
    return _list(json).map(MonobankTransaction.fromJson).toList();
  }

  Future<List<MonobankTransaction>> getTransactions(
    String token,
    String account, {
    required DateTime from,
    DateTime? to,
    MonobankCancelToken? cancel,
    MonobankProgress? onProgress,
    void Function(MonobankWindow window, List<MonobankTransaction> items)? onWindow,
  }) async {
    final windows = split(from, to ?? _now());
    final result = <String, MonobankTransaction>{};
    for (var i = 0; i < windows.length; i++) {
      final items = <String, MonobankTransaction>{};
      var end = windows[i].to;
      while (true) {
        onProgress?.call(i, windows.length, null);
        final page = await getStatement(
          token,
          account,
          windows[i].from,
          end,
          cancel: cancel,
          onWait: (wait) => onProgress?.call(i, windows.length, wait),
        );
        for (final item in page) {
          items[item.id] = item;
        }
        if (page.length < limit) {
          break;
        }
        final oldest = page.map((e) => e.date).reduce((a, b) => a.isBefore(b) ? a : b);
        if (!oldest.isAfter(windows[i].from) || !oldest.isBefore(end)) {
          break;
        }
        end = oldest;
      }
      result.addAll(items);
      onWindow?.call(windows[i], items.values.toList());
    }
    onProgress?.call(windows.length, windows.length, null);
    return result.values.toList();
  }

  static const _iso4217 = <int, String>{
    8: 'ALL',
    12: 'DZD',
    32: 'ARS',
    36: 'AUD',
    44: 'BSD',
    48: 'BHD',
    50: 'BDT',
    51: 'AMD',
    52: 'BBD',
    60: 'BMD',
    64: 'BTN',
    68: 'BOB',
    72: 'BWP',
    84: 'BZD',
    90: 'SBD',
    96: 'BND',
    104: 'MMK',
    108: 'BIF',
    116: 'KHR',
    124: 'CAD',
    132: 'CVE',
    136: 'KYD',
    144: 'LKR',
    152: 'CLP',
    156: 'CNY',
    170: 'COP',
    174: 'KMF',
    188: 'CRC',
    191: 'HRK',
    192: 'CUP',
    203: 'CZK',
    208: 'DKK',
    214: 'DOP',
    222: 'SVC',
    230: 'ETB',
    232: 'ERN',
    238: 'FKP',
    242: 'FJD',
    262: 'DJF',
    270: 'GMD',
    292: 'GIP',
    320: 'GTQ',
    324: 'GNF',
    328: 'GYD',
    332: 'HTG',
    340: 'HNL',
    344: 'HKD',
    348: 'HUF',
    352: 'ISK',
    356: 'INR',
    360: 'IDR',
    364: 'IRR',
    368: 'IQD',
    376: 'ILS',
    388: 'JMD',
    392: 'JPY',
    398: 'KZT',
    400: 'JOD',
    404: 'KES',
    408: 'KPW',
    410: 'KRW',
    414: 'KWD',
    417: 'KGS',
    418: 'LAK',
    422: 'LBP',
    426: 'LSL',
    430: 'LRD',
    434: 'LYD',
    446: 'MOP',
    454: 'MWK',
    458: 'MYR',
    462: 'MVR',
    480: 'MUR',
    484: 'MXN',
    496: 'MNT',
    498: 'MDL',
    504: 'MAD',
    512: 'OMR',
    516: 'NAD',
    524: 'NPR',
    532: 'ANG',
    533: 'AWG',
    548: 'VUV',
    554: 'NZD',
    558: 'NIO',
    566: 'NGN',
    578: 'NOK',
    586: 'PKR',
    590: 'PAB',
    598: 'PGK',
    600: 'PYG',
    604: 'PEN',
    608: 'PHP',
    634: 'QAR',
    643: 'RUB',
    646: 'RWF',
    654: 'SHP',
    682: 'SAR',
    690: 'SCR',
    694: 'SLL',
    702: 'SGD',
    704: 'VND',
    706: 'SOS',
    710: 'ZAR',
    728: 'SSP',
    748: 'SZL',
    752: 'SEK',
    756: 'CHF',
    760: 'SYP',
    764: 'THB',
    776: 'TOP',
    780: 'TTD',
    784: 'AED',
    788: 'TND',
    800: 'UGX',
    807: 'MKD',
    818: 'EGP',
    826: 'GBP',
    834: 'TZS',
    840: 'USD',
    858: 'UYU',
    860: 'UZS',
    882: 'WST',
    886: 'YER',
    901: 'TWD',
    925: 'SLE',
    926: 'VED',
    928: 'VES',
    929: 'MRU',
    930: 'STN',
    933: 'BYN',
    934: 'TMT',
    936: 'GHS',
    937: 'VEF',
    938: 'SDG',
    941: 'RSD',
    943: 'MZN',
    944: 'AZN',
    946: 'RON',
    949: 'TRY',
    950: 'XAF',
    951: 'XCD',
    952: 'XOF',
    953: 'XPF',
    960: 'XDR',
    967: 'ZMW',
    968: 'SRD',
    969: 'MGA',
    971: 'AFN',
    972: 'TJS',
    973: 'AOA',
    975: 'BGN',
    976: 'CDF',
    977: 'BAM',
    978: 'EUR',
    980: 'UAH',
    981: 'GEL',
    985: 'PLN',
    986: 'BRL',
  };
}
