// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:typed_data';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/fints/fints_importer.dart';
import 'package:fints/fints.dart';
import 'package:uuid/uuid.dart';

// Bank statement files (MT940 / MT942 and ISO 20022 camt.052 / camt.053 / camt.054)
class StatementParser {
  static const mt940Format = 'mt940';
  static const camtFormat = 'camt.053';
  static const formats = [mt940Format, camtFormat];

  static const extensions = {
    mt940Format: ['mt940', 'sta', '940', 'txt'],
    camtFormat: ['xml'],
  };

  static const dateFormat = 'yyyy-MM-dd';

  static List<String> get header => [
        AppLocale.labels.uuid,
        AppLocale.labels.expense,
        AppLocale.labels.description,
        AppLocale.labels.balanceDate,
        AppLocale.labels.flowTypeTooltip,
        AppLocale.labels.currency,
        AppLocale.labels.account,
      ];

  static bool isStatement(String format) => formats.contains(format);

  static ({List<List<dynamic>> rows, int pending}) parse(String format, Uint8List bytes) {
    final text = decode(bytes);
    final statements = switch (format) {
      mt940Format =>
        Mt940.parse(normalizeMt940(text)).map((e) => (account: e.accountId, transactions: e.transactions)).toList(),
      camtFormat => Camt.parse(text).map((e) => (account: e.accountId, transactions: e.transactions)).toList(),
      _ => throw ArgumentError.value(format, 'format'),
    };
    final result = <List<dynamic>>[header];
    final occurrences = <String, int>{};
    var pending = 0;
    for (final statement in statements) {
      final account = statement.account?.replaceAll(RegExp(r'^/'), '').trim() ?? '';
      for (final transaction in statement.transactions) {
        if (transaction.isPending) {
          pending++;
          continue;
        }
        final fingerprint = _fingerprint(account, transaction);
        final index = occurrences.update(fingerprint, (value) => value + 1, ifAbsent: () => 0);
        final date = transaction.bookingDate ?? transaction.valueDate;
        result.add([
          const Uuid().v5(Namespace.url.value, 'statement:$fingerprint#$index'),
          transaction.amount.value.abs().toString(),
          FinTsImporter.getTitle(transaction),
          date.toIso8601String().substring(0, 10),
          transaction.amount.isNegative ? AppLocale.labels.bill : AppLocale.labels.flowTypeInvoice,
          transaction.amount.currency,
          account,
        ]);
      }
    }
    return (rows: result, pending: pending);
  }

  static String _fingerprint(String account, Transaction transaction) {
    final reference = transaction.endToEndId ?? transaction.bankReference ?? transaction.customerReference ?? '';
    return [
      account,
      transaction.valueDate.toIso8601String().substring(0, 10),
      transaction.amount.minorUnits,
      transaction.amount.scale,
      transaction.amount.currency,
      reference == 'NOTPROVIDED' || reference == 'NONREF' ? '' : reference,
      transaction.purpose ?? '',
    ].join('|');
  }

  // Polish (ZBP) and other banks structure `:86:` like the German format, with `~` (or `^`) instead of `?`
  static String normalizeMt940(String text) {
    final field =
        RegExp(r'^:86:(\d{3})([~^])(\d{2})(.*?)(?=^:\d{2}[A-Z]?:|^-\s*$|(?![\s\S]))', multiLine: true, dotAll: true);
    return text.replaceAllMapped(field, (m) {
      final separator = RegExp('\\${m.group(2)}(?=\\d{2})');
      return ':86:${m.group(1)}?${m.group(3)}${m.group(4)!.replaceAll(separator, '?')}';
    });
  }

  static const _polishLetters = 'ąćęłńóśźżĄĆĘŁŃÓŚŹŻ';

  static String decode(Uint8List bytes) {
    final start = bytes.length >= 3 && bytes[0] == 0xEF && bytes[1] == 0xBB && bytes[2] == 0xBF ? 3 : 0;
    final content = Uint8List.sublistView(bytes, start);
    try {
      return utf8.decode(content);
    } on FormatException {
      // Single-byte encoding
    }
    final head = latin1.decode(content.length > 200 ? content.sublist(0, 200) : content);
    final declared = RegExp('encoding\\s*=\\s*["\']([^"\']+)["\']', caseSensitive: false).firstMatch(head)?.group(1);
    switch (declared?.toLowerCase()) {
      case 'windows-1250' || 'cp1250':
        return _decodeTable(content, _windows1250);
      case 'iso-8859-2' || 'iso8859-2' || 'latin2':
        return _decodeTable(content, _iso88592);
      case 'iso-8859-1' || 'latin1':
        return latin1.decode(content);
    }
    final windows = _decodeTable(content, _windows1250);
    final iso = _decodeTable(content, _iso88592);
    int score(String text) => text.runes.where(_polishLetters.runes.contains).length;
    return score(iso) > score(windows) ? iso : windows;
  }

  static String _decodeTable(List<int> bytes, List<int> high) =>
      String.fromCharCodes([for (final b in bytes) b < 0x80 ? b : high[b - 0x80]]);

  // Code points of the bytes 0x80..0xFF (generated from the Python codecs `cp1250` and `iso8859_2`)
  static const _windows1250 = [
    0x20AC,
    0xFFFD,
    0x201A,
    0xFFFD,
    0x201E,
    0x2026,
    0x2020,
    0x2021,
    0xFFFD,
    0x2030,
    0x0160,
    0x2039,
    0x015A,
    0x0164,
    0x017D,
    0x0179,
    0xFFFD,
    0x2018,
    0x2019,
    0x201C,
    0x201D,
    0x2022,
    0x2013,
    0x2014,
    0xFFFD,
    0x2122,
    0x0161,
    0x203A,
    0x015B,
    0x0165,
    0x017E,
    0x017A,
    0x00A0,
    0x02C7,
    0x02D8,
    0x0141,
    0x00A4,
    0x0104,
    0x00A6,
    0x00A7,
    0x00A8,
    0x00A9,
    0x015E,
    0x00AB,
    0x00AC,
    0x00AD,
    0x00AE,
    0x017B,
    0x00B0,
    0x00B1,
    0x02DB,
    0x0142,
    0x00B4,
    0x00B5,
    0x00B6,
    0x00B7,
    0x00B8,
    0x0105,
    0x015F,
    0x00BB,
    0x013D,
    0x02DD,
    0x013E,
    0x017C,
    0x0154,
    0x00C1,
    0x00C2,
    0x0102,
    0x00C4,
    0x0139,
    0x0106,
    0x00C7,
    0x010C,
    0x00C9,
    0x0118,
    0x00CB,
    0x011A,
    0x00CD,
    0x00CE,
    0x010E,
    0x0110,
    0x0143,
    0x0147,
    0x00D3,
    0x00D4,
    0x0150,
    0x00D6,
    0x00D7,
    0x0158,
    0x016E,
    0x00DA,
    0x0170,
    0x00DC,
    0x00DD,
    0x0162,
    0x00DF,
    0x0155,
    0x00E1,
    0x00E2,
    0x0103,
    0x00E4,
    0x013A,
    0x0107,
    0x00E7,
    0x010D,
    0x00E9,
    0x0119,
    0x00EB,
    0x011B,
    0x00ED,
    0x00EE,
    0x010F,
    0x0111,
    0x0144,
    0x0148,
    0x00F3,
    0x00F4,
    0x0151,
    0x00F6,
    0x00F7,
    0x0159,
    0x016F,
    0x00FA,
    0x0171,
    0x00FC,
    0x00FD,
    0x0163,
    0x02D9,
  ];

  static const _iso88592 = [
    0x0080,
    0x0081,
    0x0082,
    0x0083,
    0x0084,
    0x0085,
    0x0086,
    0x0087,
    0x0088,
    0x0089,
    0x008A,
    0x008B,
    0x008C,
    0x008D,
    0x008E,
    0x008F,
    0x0090,
    0x0091,
    0x0092,
    0x0093,
    0x0094,
    0x0095,
    0x0096,
    0x0097,
    0x0098,
    0x0099,
    0x009A,
    0x009B,
    0x009C,
    0x009D,
    0x009E,
    0x009F,
    0x00A0,
    0x0104,
    0x02D8,
    0x0141,
    0x00A4,
    0x013D,
    0x015A,
    0x00A7,
    0x00A8,
    0x0160,
    0x015E,
    0x0164,
    0x0179,
    0x00AD,
    0x017D,
    0x017B,
    0x00B0,
    0x0105,
    0x02DB,
    0x0142,
    0x00B4,
    0x013E,
    0x015B,
    0x02C7,
    0x00B8,
    0x0161,
    0x015F,
    0x0165,
    0x017A,
    0x02DD,
    0x017E,
    0x017C,
    0x0154,
    0x00C1,
    0x00C2,
    0x0102,
    0x00C4,
    0x0139,
    0x0106,
    0x00C7,
    0x010C,
    0x00C9,
    0x0118,
    0x00CB,
    0x011A,
    0x00CD,
    0x00CE,
    0x010E,
    0x0110,
    0x0143,
    0x0147,
    0x00D3,
    0x00D4,
    0x0150,
    0x00D6,
    0x00D7,
    0x0158,
    0x016E,
    0x00DA,
    0x0170,
    0x00DC,
    0x00DD,
    0x0162,
    0x00DF,
    0x0155,
    0x00E1,
    0x00E2,
    0x0103,
    0x00E4,
    0x013A,
    0x0107,
    0x00E7,
    0x010D,
    0x00E9,
    0x0119,
    0x00EB,
    0x011B,
    0x00ED,
    0x00EE,
    0x010F,
    0x0111,
    0x0144,
    0x0148,
    0x00F3,
    0x00F4,
    0x0151,
    0x00F6,
    0x00F7,
    0x0159,
    0x016F,
    0x00FA,
    0x0171,
    0x00FC,
    0x00FD,
    0x0163,
    0x02D9,
  ];
}
