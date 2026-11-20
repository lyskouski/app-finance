// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/monobank/monobank_client.dart';
import 'package:app_finance/_classes/integration/monobank/monobank_importer.dart';
import 'package:app_finance/_classes/integration/monobank/monobank_settings.dart';
import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

const clientInfo = {
  'clientId': '3MSaMMtczs',
  'name': 'Мазепа Іван',
  'webHookUrl': '',
  'permissions': 'psfj',
  'accounts': [
    {
      'id': 'kKGVoZuHWzqVoZuH',
      'sendId': 'uHWzqVoZuH',
      'balance': 1250075,
      'creditLimit': 1000000,
      'type': 'black',
      'currencyCode': 980,
      'cashbackType': 'UAH',
      'maskedPan': ['537541******1234'],
      'iban': 'UA733220010000026201234567890',
    },
    {
      'id': 'usdAccount',
      'balance': 5000,
      'creditLimit': 0,
      'type': 'white',
      'currencyCode': 840,
      'maskedPan': [],
      'iban': 'UA733220010000026201234567891',
    },
  ],
  'jars': [
    {
      'id': 'jarId',
      'sendId': 'jar',
      'title': 'На авто',
      'description': '',
      'currencyCode': 980,
      'balance': 1000000,
      'goal': 10000000,
    },
  ],
};

Map<String, dynamic> statement(String id, int amount, DateTime time,
        {bool hold = false, int mcc = 5411, String description = 'Сільпо'}) =>
    {
      'id': id,
      'time': time.millisecondsSinceEpoch ~/ 1000,
      'description': description,
      'mcc': mcc,
      'originalMcc': mcc,
      'hold': hold,
      'amount': amount,
      'operationAmount': amount,
      'currencyCode': 980,
      'commissionRate': 0,
      'cashbackAmount': 0,
      'balance': 1000000,
      'comment': '',
    };

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppPreferences.pref = await SharedPreferences.getInstance();
    CurrencyProvider.init();
  });

  group('MonobankClient', () {
    test('parses accounts and jars of the client', () async {
      final sent = <http.Request>[];
      final client = MonobankClient(
        client: MockClient((request) async {
          sent.add(request);
          return http.Response.bytes(utf8.encode(jsonEncode(clientInfo)), 200);
        }),
      );

      final info = await client.getClientInfo(' token ');
      expect(sent.single.url.toString(), 'https://api.monobank.ua/personal/client-info');
      expect(sent.single.headers['X-Token'], 'token');
      expect(info.name, 'Мазепа Іван');
      expect(info.accounts.map((e) => e.id), ['kKGVoZuHWzqVoZuH', 'usdAccount', 'jarId']);

      final card = info.accounts.first;
      expect(card.currency, 'UAH');
      expect(card.amount, 2500.75);
      expect(card.limit, 10000.0);
      expect(card.maskedPan, ['537541******1234']);
      expect(info.accounts[1].currency, 'USD');
      expect(info.accounts[1].amount, 50.0);
      expect(info.accounts.last.isJar, isTrue);
      expect(info.accounts.last.title, 'На авто');
      expect(info.accounts.last.amount, 10000.0);
    });

    test('converts numeric currency codes', () {
      expect(MonobankClient.currencyCode(980), 'UAH');
      expect(MonobankClient.currencyCode('978'), 'EUR');
      expect(MonobankClient.currencyCode(985), 'PLN');
      expect(MonobankClient.currencyCode(1), '1');
    });

    test('splits long periods into windows of 31 days', () {
      final from = DateTime(2026, 1, 1);
      final windows = MonobankClient.split(from, DateTime(2026, 3, 15));

      expect(windows.length, 3);
      expect(windows.first, (from: from, to: from.add(const Duration(days: 31))));
      expect(windows[1].from, windows.first.to);
      expect(windows.last.to, DateTime(2026, 3, 15));
      expect(MonobankClient.split(from, from), isEmpty);
      expect(MonobankClient.split(from, DateTime(2026, 1, 2)).single, (from: from, to: DateTime(2026, 1, 2)));
    });

    test('waits for the rate limit between statements', () async {
      final sent = <Uri>[];
      final waits = <Duration>[];
      final progress = <(int, int, Duration?)>[];
      var now = DateTime(2026, 11, 20, 12);
      final client = MonobankClient(
        now: () => now,
        wait: (duration) async {
          waits.add(duration);
          now = now.add(duration);
        },
        client: MockClient((request) async {
          sent.add(request.url);
          final items = sent.length == 1 ? [statement('1', -12050, DateTime(2026, 9, 10))] : [];
          return http.Response.bytes(utf8.encode(jsonEncode(items)), 200);
        }),
      );

      final windows = <MonobankWindow>[];
      final result = await client.getTransactions(
        'token',
        'acc',
        from: DateTime(2026, 9, 1),
        to: DateTime(2026, 11, 1),
        onProgress: (done, total, wait) => progress.add((done, total, wait)),
        onWindow: (window, _) => windows.add(window),
      );

      expect(sent.length, 2);
      expect(
          sent.first.path,
          '/personal/statement/acc/${DateTime(2026, 9, 1).millisecondsSinceEpoch ~/ 1000}/'
          '${DateTime(2026, 10, 2).millisecondsSinceEpoch ~/ 1000}');
      expect(waits, [MonobankClient.interval]);
      expect(progress, contains((1, 2, MonobankClient.interval)));
      expect(progress.last, (2, 2, null));
      expect(windows.length, 2);
      expect(result.single.amount, -12050);
      expect(result.single.title, 'Сільпо');
      expect(result.single.mcc, 5411);
    });

    test('requests the rest of a full statement with an earlier end', () async {
      final sent = <Uri>[];
      final base = DateTime(2026, 11, 10);
      final client = MonobankClient(
        wait: (_) async {},
        client: MockClient((request) async {
          sent.add(request.url);
          final items = sent.length == 1
              ? List.generate(MonobankClient.limit, (i) => statement('a$i', -100, base.subtract(Duration(minutes: i))))
              : [
                  statement('a499', -100, base.subtract(const Duration(minutes: 499))),
                  statement('b', -1, DateTime(2026, 11, 2))
                ];
          return http.Response.bytes(utf8.encode(jsonEncode(items)), 200);
        }),
      );

      final result =
          await client.getTransactions('token', 'acc', from: DateTime(2026, 11, 1), to: DateTime(2026, 11, 11));

      expect(sent.length, 2);
      final oldest = base.subtract(const Duration(minutes: 499)).millisecondsSinceEpoch ~/ 1000;
      expect(sent.last.pathSegments.last, '$oldest');
      expect(result.length, MonobankClient.limit + 1);
    });

    test('retries after "Too many requests"', () async {
      var calls = 0;
      final waits = <Duration>[];
      final client = MonobankClient(
        wait: (duration) async => waits.add(duration),
        client: MockClient((_) async {
          calls++;
          return calls == 1
              ? http.Response(jsonEncode({'errorDescription': 'Too many requests'}), 429)
              : http.Response.bytes(utf8.encode(jsonEncode(clientInfo)), 200);
        }),
      );

      final info = await client.getClientInfo('token');
      expect(calls, 2);
      expect(waits.length, 1);
      expect(info.accounts, isNotEmpty);

      final limited = MonobankClient(
        wait: (_) async {},
        client: MockClient((_) async => http.Response(jsonEncode({'errorDescription': 'Too many requests'}), 429)),
      );
      expect(
        () => limited.getClientInfo('token'),
        throwsA(isA<MonobankException>()
            .having((e) => e.message, 'message', AppLocale.labels.integrationServiceError('Too many requests'))),
      );
    });

    test('reports denied access and stops on a cancellation', () async {
      final denied = MonobankClient(
        client: MockClient((_) async => http.Response(jsonEncode({'errorDescription': "Unknown 'X-Token'"}), 403)),
      );
      expect(
        () => denied.getClientInfo('token'),
        throwsA(isA<MonobankException>().having((e) => e.message, 'message', AppLocale.labels.integrationAccessDenied)),
      );

      final cancel = MonobankCancelToken();
      var calls = 0;
      final client = MonobankClient(
        wait: (_) async => cancel.cancel(),
        client: MockClient((_) async {
          calls++;
          return http.Response('[]', 200);
        }),
      );
      final windows = <MonobankWindow>[];
      await expectLater(
        client.getTransactions('token', 'acc',
            from: DateTime(2026, 9, 1), to: DateTime(2026, 11, 1), cancel: cancel, onWindow: (w, _) => windows.add(w)),
        throwsA(isA<MonobankCanceledException>()),
      );
      expect(calls, 1);
      expect(windows.length, 1);
    });
  });

  group('MonobankImporter', () {
    final transactions = [
      statement('1', -12050, DateTime(2026, 11, 2, 10)),
      statement('2', 100000, DateTime(2026, 11, 3), description: 'Зарплата', mcc: 4829),
      statement('3', -1000, DateTime(2026, 11, 4), hold: true),
      statement('4', -500, DateTime(2026, 11, 5), hold: true),
    ].map(MonobankTransaction.fromJson).toList();

    test('imports settled transactions once by their identifier', () {
      final store = <String, InterfaceAppData>{};
      final importer = MonobankImporter(exists: store.containsKey, add: (item, uuid) => store[uuid] = item);

      run() => importer.run(id: 'acc', transactions: transactions, account: 'a', category: 'b', currency: 'UAH');
      expect(run(), (added: 2, skipped: 0, pending: 2));
      expect(run(), (added: 0, skipped: 2, pending: 2));
      expect(importer.pendingSince, DateTime(2026, 11, 4));

      final bill = store[MonobankImporter.recordUuid('acc', '1')] as BillAppData;
      expect(bill.details, 120.5);
      expect(bill.currency?.code, 'UAH');
      expect(bill.title, 'Сільпо');
      expect(bill.createdAt, DateTime(2026, 11, 2, 10));
      expect(store.values.whereType<InvoiceAppData>().single.details, 1000.0);
    });

    test('seeds the budget category by the merchant category code', () {
      final store = <String, InterfaceAppData>{};
      final prediction = BudgetPrediction()
        ..add(BillAppData(account: 'x', category: 'other', title: 'Market', details: 1.0, hidden: false));
      // Bills of 5411 were categorized as "food" (one of them corrected by a user)
      final categories = MonobankImporter.learn(
        {'b1': 5411, 'b2': 5411, 'b3': 5411, 'b4': 4829, 'deleted': 5812},
        (uuid) => {'b1': 'food', 'b2': 'food', 'b3': 'other', 'b4': 'transfers'}[uuid],
      );
      expect(categories, {5411: 'food', 4829: 'transfers'});

      final importer =
          MonobankImporter(exists: store.containsKey, add: (item, uuid) => store[uuid] = item, categories: categories);
      importer.run(
        id: 'acc',
        transactions: [
          statement('1', -100, DateTime(2026, 11, 2), description: 'Market'),
          statement('2', -100, DateTime(2026, 11, 3), description: 'Market', mcc: 5812),
        ].map(MonobankTransaction.fromJson).toList(),
        account: 'a',
        category: 'b',
        currency: 'UAH',
        prediction: prediction,
      );

      final uuid1 = MonobankImporter.recordUuid('acc', '1');
      final uuid2 = MonobankImporter.recordUuid('acc', '2');
      expect((store[uuid1] as BillAppData).category, 'food');
      expect((store[uuid2] as BillAppData).category, 'other');
      expect(importer.records, {uuid1: 5411, uuid2: 5812});
    });
  });

  group('MonobankSettings', () {
    test('keeps the token encrypted', () async {
      await MonobankSettings.saveToken('secret-token');

      expect(AppPreferences.get(AppPreferences.prefMonobankToken), isNot(contains('secret-token')));
      expect(MonobankSettings.loadToken(), 'secret-token');

      await MonobankSettings.clearToken();
      expect(MonobankSettings.loadToken(), isNull);
    });

    test('saves links, import dates and the latest records', () async {
      final settings = MonobankSettings(links: {'acc': 'uuid'}, imported: {'acc': DateTime(2026, 11, 14)});
      settings.addRecords({for (var i = 0; i < MonobankSettings.recordsLimit; i++) 'r$i': 5411});
      settings.addRecords({'r0': 5411, 'new': 4829});
      await settings.save();

      final loaded = MonobankSettings.load();
      expect(loaded.links, {'acc': 'uuid'});
      expect(loaded.imported, {'acc': DateTime(2026, 11, 14)});
      expect(loaded.records.length, MonobankSettings.recordsLimit);
      expect(loaded.records.containsKey('r1'), isFalse);
      expect(loaded.records.keys.toList().sublist(MonobankSettings.recordsLimit - 2), ['r0', 'new']);
    });
  });
}
