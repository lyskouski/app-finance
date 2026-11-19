// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter_currency_picker/flutter_currency_picker.dart';

typedef NotificationParsed = ({double amount, String? currency, String title});

class NotificationParser {
  static const _number = r"\d{1,3}(?:[   '.,]\d{3})+(?:[.,]\d{1,2})?(?![\d]|[.,]\d)|\d+(?:[.,]\d{1,2})?(?![\d]|[.,]\d)";

  static const aliases = {
    'US\$': 'USD',
    'C\$': 'CAD',
    'A\$': 'AUD',
    'lei': 'RON',
    'руб': 'RUB',
    'грн': 'UAH',
    'тг': 'KZT',
    'сўм': 'UZS',
    "so'm": 'UZS',
  };

  static bool _isIgnored(Currency currency) {
    final symbol = currency.symbol.trim();
    return symbol.isEmpty ||
        symbol == currency.code ||
        RegExp(r'^[A-Za-z]$').hasMatch(symbol) ||
        RegExp(r'^[a-z]{3,}$').hasMatch(symbol);
  }

  static final Map<String, List<String>> symbols = () {
    final result = <String, List<String>>{};
    for (final currency in CurrencyProvider.getAll()) {
      if (!_isIgnored(currency)) {
        result.putIfAbsent(currency.symbol.trim(), () => []).add(currency.code);
      }
    }
    aliases.forEach((symbol, code) => result.putIfAbsent(symbol, () => [code]));
    return result;
  }();

  // Symbols of letters only (`kr`, `Ft`, `Le`) might be a part of a sentence
  static bool _isWeak(String symbol) =>
      RegExp(r"^[A-Za-z.' ]+$").hasMatch(symbol) && !RegExp(r'^[A-Z]{3}$').hasMatch(symbol);

  // Defaults of user-defined keywords: words preceding an amount to be skipped
  static const balanceKeywords = [
    'balance',
    'bal.',
    'bal:',
    'avail',
    'limit',
    'остаток',
    'ост.',
    'ост:',
    'доступно',
    'баланс',
    'рэшта',
    'астатак',
    'даступна',
    'залишок',
    'saldo',
    'kontostand',
    'guthaben',
    'verfügbar',
    'solde',
    'disponible',
    'dostępn',
    'disponibil',
    'zůstatek',
    'bakiye',
    'kullanılabilir',
    'beschikbaar',
    'qoldiq',
    'qalıq',
    'ნაშთი',
    'موجودی',
    'الرصيد',
    'शेष',
    'बैलेंस',
    '残高',
    '余额',
    '餘額',
    '잔액',
    'sisa',
  ];

  // Defaults of user-defined keywords: words marking a notification as income
  static const incomeKeywords = [
    'received',
    'credited',
    'deposit',
    'incoming',
    'refund',
    'salary',
    'top-up',
    'top up',
    'topped up',
    'cashback',
    'transfer from',
    'зачисл',
    'поступлен',
    'пополнен',
    'возврат',
    'перевод от',
    'залічэн',
    'паступлен',
    'папаўнен',
    'вяртан',
    'зарахован',
    'надходжен',
    'поповнен',
    'повернен',
    'gutschrift',
    'eingang',
    'erhalten',
    'erstattung',
    'wpływ',
    'uznanie',
    'otrzyma',
    'zwrot',
    'recibid',
    'abono',
    'ingreso',
    'reembolso',
    'reçu',
    'crédité',
    'remboursement',
    'ricevut',
    'accredit',
    'rimborso',
    'recebid',
    'creditad',
    'ontvangen',
    'bijgeschreven',
    'terugbetaling',
    'přijat',
    'připsán',
    'vrácen',
    'primit',
    'încasat',
    'rambursare',
    'gelen',
    'yatırıldı',
    'iade',
    'tushum',
    'daxil olub',
    'diterima',
    'masuk',
    'ჩაირიცხა',
    'واریز',
    'إيداع',
    'استرداد',
    'जमा',
    '入金',
    '入账',
    '收到',
    '退款',
    '入帳',
    '입금',
    '환불',
  ];

  static final _merchant = RegExp(r'(?:^|\s)(?:at|bei|chez|в|у|@)\s+([^\n,;]+?)(?=\s*(?:[,;\n]|\.\s|\.$|$))');

  static final RegExp _money = () {
    // A currency should not be a part of a word
    const letter = r'A-Za-zÀ-ÿЀ-ӿ';
    // Longer symbols first: `R$` before `$`
    final scope = symbols.keys.toList()..sort((a, b) => b.length.compareTo(a.length));
    final currency = '(?<![$letter])(?:${[r'[A-Z]{3}', ...scope.map(RegExp.escape)].join('|')})(?![$letter])';
    return RegExp(
      '(?<s0>[+\\-−–])?\\s?(?:(?<c1>$currency)\\s?(?<s1>[+\\-−–])?\\s?(?<n1>$_number)|(?<n2>$_number)\\s?(?<c2>$currency))',
    );
  }();

  static double? toAmount(String value) {
    var number = value.replaceAll(RegExp(r"[   ']"), '');
    final decimal = RegExp(r'[.,](\d{1,2})$').firstMatch(number);
    var fraction = '';
    if (decimal != null) {
      fraction = '.${decimal.group(1)}';
      number = number.substring(0, decimal.start);
    }
    return double.tryParse(number.replaceAll(RegExp(r'[.,]'), '') + fraction);
  }

  static String? toCurrency(String? value, {Currency? fallback}) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final codes = symbols[value];
    if (codes == null) {
      return CurrencyProvider.find(value)?.code;
    }
    final preferred = [
      fallback?.code,
      CurrencyDefaults.defaultCurrency?.code,
      ...?CurrencyProvider.getTop(),
    ];
    return preferred.firstWhere((code) => code != null && codes.contains(code), orElse: () => codes.first);
  }

  static List<String> toKeywords(Iterable<String> value) =>
      value.map((e) => e.trim().toLowerCase()).where((e) => e.isNotEmpty).toSet().toList();

  static bool isIncome(String text, {List<String> income = incomeKeywords}) {
    final value = text.toLowerCase();
    return income.any(value.contains);
  }

  static bool isBalance(String text, {List<String> balance = balanceKeywords}) {
    final value = text.toLowerCase();
    return balance.any(value.contains);
  }

  static String toLine(String value) {
    final line = value.replaceAll(RegExp(r'\s+'), ' ').trim();
    return line.length > 100 ? '${line.substring(0, 99)}…' : line;
  }

  static String getTitle(String text, String fallback) {
    final merchant = _merchant.firstMatch(text)?.group(1)?.trim();
    return toLine(merchant != null && merchant.isNotEmpty && !_money.hasMatch(merchant) ? merchant : fallback);
  }

  static int? _sign(String? value) => switch (value) {
        null || '' => null,
        '+' => 1,
        _ => -1,
      };

  static NotificationParsed? parse(
    String title,
    String text, {
    String? pattern,
    Currency? fallback,
    List<String> income = incomeKeywords,
    List<String> balance = balanceKeywords,
  }) {
    final content = [title, text].where((e) => e.isNotEmpty).join('\n');
    if (pattern != null && pattern.trim().isNotEmpty) {
      return parseByPattern(content, text, pattern, fallback: fallback, income: income);
    }
    var from = 0;
    NotificationParsed? weak;
    for (final match in _money.allMatches(content)) {
      final before = content.substring(from, match.start).toLowerCase();
      from = match.end;
      final symbol = match.namedGroup('c1') ?? match.namedGroup('c2');
      final currency = toCurrency(symbol, fallback: fallback);
      final amount = toAmount(match.namedGroup('n1') ?? match.namedGroup('n2') ?? '');
      if (currency == null || amount == null || amount == 0 || isBalance(before, balance: balance)) {
        continue;
      }
      final sign = _sign(match.namedGroup('s0')) ??
          _sign(match.namedGroup('s1')) ??
          (isIncome(content, income: income) ? 1 : -1);
      final result = (amount: sign * amount, currency: currency, title: getTitle(content, text));
      if (!_isWeak(symbol!)) {
        return result;
      }
      weak ??= result;
    }
    return weak;
  }

  static NotificationParsed? parseByPattern(
    String content,
    String text,
    String pattern, {
    Currency? fallback,
    List<String> income = incomeKeywords,
  }) {
    final RegExpMatch? match;
    try {
      match = RegExp(pattern, caseSensitive: false, multiLine: true, unicode: true).firstMatch(content);
    } on FormatException {
      return null;
    }
    if (match == null) {
      return null;
    }
    String? group(String name) => match!.groupNames.contains(name) ? match.namedGroup(name)?.trim() : null;
    final raw = group('amount') ?? (match.groupCount > 0 ? match.group(1) : match.group(0)) ?? '';
    final sign = RegExp(r'^\s*([+\-−–])').firstMatch(raw)?.group(1);
    final amount = toAmount(raw.replaceAll(RegExp(r'[^\d.,\s  ' "'" r']'), '').trim());
    if (amount == null || amount == 0) {
      return null;
    }
    final title = group('title');
    return (
      amount: (_sign(sign) ?? (isIncome(content, income: income) ? 1 : -1)) * amount,
      currency: toCurrency(group('currency'), fallback: fallback),
      title: title != null && title.isNotEmpty ? toLine(title) : getTitle(content, text),
    );
  }
}
