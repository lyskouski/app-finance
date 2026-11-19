// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/notification/notification_channel.dart';
import 'package:app_finance/_classes/integration/notification/notification_importer.dart';
import 'package:app_finance/_classes/integration/notification/notification_parser.dart';
import 'package:app_finance/_classes/integration/notification/notification_settings.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

NotificationRecord record(String text, {String title = '', String id = '1', DateTime? time}) => NotificationRecord(
      id: id,
      package: 'com.bank',
      title: title,
      text: text,
      time: time ?? DateTime(2026, 11, 10, 12),
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  group('NotificationParser.toAmount', () {
    final cases = {
      '12.50': 12.5,
      '12,5': 12.5,
      '1,234.56': 1234.56,
      '1.234,56': 1234.56,
      '1 234,56': 1234.56,
      '1 234': 1234.0,
      "1'234.50": 1234.5,
      '1,234': 1234.0,
      '15': 15.0,
    };
    for (final entry in cases.entries) {
      test('parses "${entry.key}"', () => expect(NotificationParser.toAmount(entry.key), entry.value));
    }
  });

  group('NotificationParser.parse', () {
    final cases = <String, (String, String, double, String?)>{
      'card purchase with a merchant': ('Revolut', 'Paid €12.50 at Starbucks', -12.5, 'EUR'),
      'code after the amount': ('', 'Purchase 1 234,56 RUB at ПЯТЕРОЧКА. Balance: 10 000 RUB', -1234.56, 'RUB'),
      'balance before the transaction': ('', 'Balance 100.00 USD, purchase 7.20 USD', -7.2, 'USD'),
      'explicit sign': ('mBank', '+250,00 PLN Wpływ od Jan', 250.0, 'PLN'),
      'income keyword': ('', 'You received 40 GBP from John', 40.0, 'GBP'),
      'cyrillic income': ('', 'Зачисление 1500 BYN. Доступно: 2000 BYN', 1500.0, 'BYN'),
      'local symbol': ('Monobank', '−95.40₴ Сільпо', -95.4, 'UAH'),
      'amount in the title': ('-8,90 €', 'REWE Markt GmbH', -8.9, 'EUR'),
    };
    for (final entry in cases.entries) {
      test(entry.key, () {
        final (title, text, amount, currency) = entry.value;
        final result = NotificationParser.parse(title, text);
        expect(result, isNotNull);
        expect(result!.amount, amount);
        expect(result.currency, currency);
      });
    }

    test('extracts the merchant as a title', () {
      expect(NotificationParser.parse('Revolut', 'Paid €12.50 at Starbucks')!.title, 'Starbucks');
      expect(NotificationParser.parse('', 'Покупка 5 BYN в Евроопт, карта *1234')!.title, 'Евроопт');
    });

    test('uses the text as a title without a merchant', () {
      expect(NotificationParser.parse('Bank', 'Card payment 9.99 EUR')!.title, 'Card payment 9.99 EUR');
    });

    test('ignores numbers without a currency', () {
      expect(NotificationParser.parse('', 'Your code is 123456, card *4411'), isNull);
      expect(NotificationParser.parse('', 'Meeting at 10.30 in room 12'), isNull);
    });

    test('ignores unknown codes and parts of words', () {
      expect(NotificationParser.parse('', 'PIN 1234 changed'), isNull);
      expect(NotificationParser.parse('', 'Abr 5 Brand 7'), isNull);
    });

    test('prefers the currency of the account for an ambiguous symbol', () {
      final cad = CurrencyProvider.find('CAD');
      final result = NotificationParser.parse('', 'Spent \$4.00', fallback: cad);
      expect(result!.currency, cad!.symbol == '\$' ? 'CAD' : 'USD');
      expect(NotificationParser.parse('', 'Spent \$4.00')!.currency, 'USD');
    });

    test('takes symbols from the currency list', () {
      expect(NotificationParser.parse('', 'Betalt 250,00 kr hos ICA')!.currency, 'SEK');
      expect(NotificationParser.parse('', 'Fizetés 4 500 Ft')!.currency, 'HUF');
      expect(NotificationParser.parse('', 'Compra R\$ 50,00')!.currency, 'BRL');
      expect(NotificationParser.parse('', 'Paid US\$ 7.00')!.currency, 'USD');
    });

    test('resolves an ambiguous symbol by the account, the default and the pinned currencies', () {
      final initial = CurrencyDefaults.defaultCurrency;
      addTearDown(() => CurrencyDefaults.defaultCurrency = initial);
      CurrencyDefaults.defaultCurrency = CurrencyProvider.find('NOK');
      expect(NotificationParser.parse('', 'Betalt 250 kr')!.currency, 'NOK');
      expect(NotificationParser.parse('', 'Betalt 250 kr', fallback: CurrencyProvider.find('DKK'))!.currency, 'DKK');
      CurrencyDefaults.defaultCurrency = CurrencyProvider.find('EUR');
      expect(NotificationParser.parse('', 'Betalt 250 kr')!.currency, 'SEK');
    });

    test('ignores symbols that are letters or words', () {
      expect(NotificationParser.symbols.keys, isNot(contains('L')));
      expect(NotificationParser.symbols.keys, isNot(contains('sum')));
      expect(NotificationParser.parse('', 'Filled 40 L at the station'), isNull);
      expect(NotificationParser.parse('', 'The sum 100 is due'), isNull);
    });

    test('prefers a code or a sign over a symbol of letters', () {
      final result = NotificationParser.parse('', 'Le 12/11, paiement de 25,00 EUR chez Carrefour');
      expect((result!.amount, result.currency, result.title), (-25.0, 'EUR', 'Carrefour'));
      // A symbol of letters is still used when there is nothing else
      expect(NotificationParser.parse('', 'Le 50 paid')!.currency, 'SLE');
    });

    test('takes amounts without a currency in the default one', () {
      final sek = CurrencyProvider.find('SEK');
      expect(NotificationParser.parse('', 'Debit 20.00'), isNull);
      expect(NotificationParser.parse('', 'Debit 20.00', fallback: sek), isNull);
      final result = NotificationParser.parse('Bank', 'Debit 1.234,50 at Migros', fallback: sek, isBare: true);
      expect((result!.amount, result.currency, result.title), (-1234.5, 'SEK', 'Migros'));
      expect(NotificationParser.parse('', 'Received +30,00', fallback: sek, isBare: true)!.amount, 30.0);
      // A currency of the notification is preferred
      expect(NotificationParser.parse('', 'Card 12.00, paid 5.00 EUR', fallback: sek, isBare: true)!.currency, 'EUR');
    });

    test('skips numbers without a fraction and balances as amounts without a currency', () {
      final sek = CurrencyProvider.find('SEK');
      for (final text in ['Your code is 4455', 'Courier arrives in 15 min', 'Card *4421 blocked', 'On 19.11.2026']) {
        expect(NotificationParser.parse('', text, fallback: sek, isBare: true), isNull, reason: text);
      }
      final result = NotificationParser.parse('', 'Balance 500.00, debit 7.50', fallback: sek, isBare: true);
      expect(result!.amount, -7.5);
    });

    test('normalizes user keywords', () {
      expect(NotificationParser.toKeywords([' Payout', 'Dividend', '  ', 'payout']), ['payout', 'dividend']);
      expect(NotificationParser.toKeywords([]), isEmpty);
    });

    test('applies user income keywords', () {
      expect(NotificationParser.parse('', 'Payout 40 EUR')!.amount, -40.0);
      expect(NotificationParser.parse('', 'Payout 40 EUR', income: ['payout'])!.amount, 40.0);
      // User keywords replace the default ones
      expect(NotificationParser.parse('', 'Refund 40 EUR', income: ['payout'])!.amount, -40.0);
    });

    test('recognizes the account by its keywords', () {
      const accounts = {
        'card': ['4421', 'visa'],
        'wallet': ['revolut'],
        'empty': <String>[],
      };
      expect(NotificationParser.toAccount('Revolut: Paid 5 EUR', accounts), 'wallet');
      expect(NotificationParser.toAccount('Card *4421 charged, see Revolut', accounts), 'card');
      expect(NotificationParser.toAccount('VISA payment', accounts), 'card');
      expect(NotificationParser.toAccount('Paid 5 EUR', accounts), isNull);
      expect(NotificationParser.toAccount('Paid 5 EUR', {}), isNull);
      // The longer keyword wins at the same position
      expect(
          NotificationParser.toAccount('visa gold', {
            'a': ['visa'],
            'b': ['visa gold']
          }),
          'b');
    });

    test('applies user balance keywords', () {
      const text = 'Paid 10 EUR at Shop. Remaining 500 EUR';
      expect(NotificationParser.parse('', 'Remaining 500 EUR')!.amount, -500.0);
      expect(NotificationParser.parse('', 'Remaining 500 EUR', balance: ['remaining']), isNull);
      expect(NotificationParser.parse('', text, balance: ['remaining'])!.amount, -10.0);
      expect(NotificationParser.parse('', 'Balance 500 EUR', balance: [])!.amount, -500.0);
    });
  });

  group('NotificationImporter', () {
    test('imports recognized notifications and keeps the rest pending', () {
      final added = <String, InterfaceAppData>{};
      final importer = NotificationImporter(
        exists: added.containsKey,
        add: (item, uuid) => added[uuid] = item,
      );
      final records = [
        record('Paid 12.50 EUR at Cafe', id: 'a'),
        record('Refund 3 EUR from Shop', id: 'b'),
        record('Your OTP is 4455', id: 'c'),
        record('Paid 1 EUR at Old', id: 'd', time: DateTime(2026, 1, 1)),
      ];

      final first = importer.run(records: records, account: 'acc', category: 'cat', from: DateTime(2026, 11));
      expect((first.added, first.skipped, first.pending), (2, 0, 1));
      expect(first.processed, ['a', 'b']);
      final bill = added.values.whereType<BillAppData>().single;
      expect(bill.title, 'Cafe');
      expect(bill.details, 12.5);
      expect(bill.account, 'acc');
      expect(bill.category, 'cat');
      expect(bill.createdAt, DateTime(2026, 11, 10, 12));
      expect(added.values.whereType<InvoiceAppData>().single.details, 3.0);

      final second = importer.run(records: records, account: 'acc', category: 'cat', from: DateTime(2026, 11));
      expect((second.added, second.skipped, second.pending), (0, 2, 1));
      expect(second.processed, ['a', 'b']);
    });

    test('takes amounts without a currency in the default currency of the app', () {
      final added = <InterfaceAppData>[];
      final importer = NotificationImporter(exists: (_) => false, add: (item, _) => added.add(item));
      final skipped = importer.run(
        records: [record('Debit 20.00')],
        account: 'acc',
        category: 'cat',
        from: DateTime(2026),
        currency: CurrencyProvider.find('SEK'),
      );
      expect((skipped.added, skipped.pending), (0, 1));
      importer.run(
        records: [record('Debit 20.00'), record('Paid 5 \$', id: 'b')],
        account: 'acc',
        category: 'cat',
        from: DateTime(2026),
        currency: CurrencyProvider.find('SEK'),
        appCurrency: CurrencyProvider.find('CAD'),
      );
      expect(added.map((e) => e.currency?.code), ['CAD', 'CAD']);
    });

    test('assigns notifications to the recognized account', () {
      final added = <InterfaceAppData>[];
      final importer = NotificationImporter(exists: (_) => false, add: (item, _) => added.add(item));
      importer.run(
        records: [record('Card *4421: Debit 20.00'), record('Debit 7.00', id: 'b')],
        account: 'default',
        category: 'cat',
        from: DateTime(2026),
        currency: CurrencyProvider.find('DKK'),
        appCurrency: CurrencyProvider.find('SEK'),
        accounts: {
          'card': ['4421'],
        },
        currencyOf: (uuid) => uuid == 'card' ? CurrencyProvider.find('NOK') : null,
      );
      expect(added.map((e) => (e as BillAppData).account), ['card', 'default']);
      expect(added.map((e) => e.currency?.code), ['NOK', 'SEK']);
    });

    test('passes user keywords to the parser', () {
      final added = <InterfaceAppData>[];
      final importer = NotificationImporter(exists: (_) => false, add: (item, _) => added.add(item));
      final summary = importer.run(
        records: [record('Remaining 900 EUR'), record('Payout 15 EUR', id: 'b')],
        account: 'acc',
        category: 'cat',
        from: DateTime(2026),
        income: ['payout'],
        balance: ['remaining'],
      );
      expect((summary.added, summary.pending), (1, 1));
      expect(added.single, isA<InvoiceAppData>());
    });
  });

  group('NotificationSettings', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      AppPreferences.pref = await SharedPreferences.getInstance();
    });

    test('keeps links of applications', () async {
      final settings = NotificationSettings.load();
      settings.get('com.bank')
        ..account = 'acc'
        ..category = 'cat'
        ..currency = 'CHF';
      await settings.save();

      final restored = NotificationSettings.load().get('com.bank');
      expect((restored.account, restored.category, restored.currency), ('acc', 'cat', 'CHF'));

      expect(restored.isLinked, isTrue);
      expect(NotificationSettings.load().get('com.other').isLinked, isFalse);
    });

    test('keeps keywords shared by all applications', () async {
      final settings = NotificationSettings.load();
      expect(settings.income, NotificationParser.incomeKeywords);
      expect(settings.balance, NotificationParser.balanceKeywords);

      settings
        ..income = ['payout']
        ..balance = []
        ..accounts = {
          'acc': ['4421'],
          'other': [],
        };
      await settings.save();
      final restored = NotificationSettings.load();
      expect(restored.income, ['payout']);
      expect(restored.balance, isEmpty);
      expect(restored.accounts, {
        'acc': ['4421'],
      });
    });

    test('recovers from a broken state', () async {
      await AppPreferences.set(AppPreferences.prefNotification, '{"apps": []}');
      expect(NotificationSettings.load().apps, isEmpty);
    });
  });
}
