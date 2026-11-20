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

  // Defaults of user-defined keywords: labels of a field with a merchant, "Lokalizacja: ROSSMANN 42", "Merchant: Starbucks"
  static const merchantLabels = [
    'merchant',
    'payee',
    'location',
    'place',
    'store',
    'shop',
    'lokalizacja',
    'miejsce',
    'odbiorca',
    'sprzedawca',
    'händler',
    'empfänger',
    'geschäft',
    'commerçant',
    'marchand',
    'bénéficiaire',
    'lieu',
    'comercio',
    'establecimiento',
    'beneficiario',
    'esercente',
    'estabelecimento',
    'místo',
    'obchodník',
    'příjemce',
    'comerciant',
    'locație',
    'işyeri',
    'winkel',
    'begunstigde',
    'место',
    'магазин',
    'получатель',
    'торговая точка',
    'месца',
    'атрымальнік',
    'місце',
    'отримувач',
  ];

  static const _letter = r'A-Za-zÀ-ÿĀ-žЀ-ӿ';

  static final _merchant = RegExp(r'(?:^|\s)(?:at|bei|chez|в|у|@)\s+([^\n,;]+?)(?=\s*(?:[,;\n]|\.\s|\.$|$))');

  static RegExp toLabelled(List<String> merchant) => RegExp(
        '(?<![$_letter])(?:${merchant.map(RegExp.escape).join('|')})\\s*:\\s*([^\\n,;]+?)(?=\\s*(?:[,;\\n]|\\.\\s|\\.\$|\$))',
        caseSensitive: false,
      );

  static final _labelled = toLabelled(merchantLabels);

  // The latest user-defined labels are kept compiled, they are the same for all notifications of a run
  static (String, RegExp)? _custom;

  static RegExp? _toLabelled(List<String> merchant) {
    if (merchant.isEmpty) {
      return null;
    }
    if (identical(merchant, merchantLabels)) {
      return _labelled;
    }
    final key = merchant.join('\n');
    final custom = _custom;
    if (custom != null && custom.$1 == key) {
      return custom.$2;
    }
    return (_custom = (key, toLabelled(merchant))).$2;
  }

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

  // Account (key) mentioned the earliest in the text by one of its keywords, the longer keyword wins a tie
  static String? toAccount(String text, Map<String, List<String>> accounts) {
    final value = text.toLowerCase();
    String? result;
    var position = value.length;
    var length = 0;
    accounts.forEach((account, keywords) {
      for (final keyword in keywords) {
        final index = keyword.isEmpty ? -1 : value.indexOf(keyword.toLowerCase());
        if (index >= 0 && (index < position || (index == position && keyword.length > length))) {
          result = account;
          position = index;
          length = keyword.length;
        }
      }
    });
    return result;
  }

  static String toLine(String value) {
    final line = value.replaceAll(RegExp(r'\s+'), ' ').trim();
    return line.length > 100 ? '${line.substring(0, 99)}…' : line;
  }

  static String getTitle(String text, String fallback, {List<String> merchant = merchantLabels}) {
    for (final pattern in [_toLabelled(merchant), _merchant].nonNulls) {
      final value = pattern.firstMatch(text)?.group(1)?.trim();
      if (value != null && value.isNotEmpty && !_money.hasMatch(value)) {
        return toLine(value);
      }
    }
    return toLine(fallback);
  }

  static int? _sign(String? value) => switch (value) {
        null || '' => null,
        '+' => 1,
        _ => -1,
      };

  // Amount without a currency: only with a fraction, to skip codes, counters and card numbers
  static final _bare = RegExp(
    r"(?<![\w.,])(?<s>[+\-−–])?\s?(?<n>\d{1,3}(?:[   '.,]\d{3})+[.,]\d{2}|\d+[.,]\d{2})(?![\w]|[.,]\d)",
  );

  // The currency of a notification is preferred to be the fallback one,
  // amounts without a currency are taken in the fallback one when `isBare` is set
  static NotificationParsed? parse(
    String title,
    String text, {
    Currency? fallback,
    bool isBare = false,
    List<String> income = incomeKeywords,
    List<String> balance = balanceKeywords,
    List<String> merchant = merchantLabels,
  }) {
    final content = [title, text].where((e) => e.isNotEmpty).join('\n');
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
      final result = (amount: sign * amount, currency: currency, title: getTitle(content, text, merchant: merchant));
      if (!_isWeak(symbol!)) {
        return result;
      }
      weak ??= result;
    }
    if (weak != null || !isBare || fallback == null) {
      return weak;
    }
    return _parseBare(content, text, fallback, income: income, balance: balance, merchant: merchant);
  }

  static NotificationParsed? _parseBare(
    String content,
    String text,
    Currency currency, {
    required List<String> income,
    required List<String> balance,
    required List<String> merchant,
  }) {
    var from = 0;
    for (final match in _bare.allMatches(content)) {
      final before = content.substring(from, match.start).toLowerCase();
      from = match.end;
      final amount = toAmount(match.namedGroup('n')!);
      if (amount == null || amount == 0 || isBalance(before, balance: balance)) {
        continue;
      }
      final sign = _sign(match.namedGroup('s')) ?? (isIncome(content, income: income) ? 1 : -1);
      return (amount: sign * amount, currency: currency.code, title: getTitle(content, text, merchant: merchant));
    }
    return null;
  }
}
