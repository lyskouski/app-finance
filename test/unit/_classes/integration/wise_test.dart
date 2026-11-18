// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/wise/wise_client.dart';
import 'package:app_finance/_classes/integration/wise/wise_importer.dart';
import 'package:app_finance/_classes/integration/wise/wise_settings.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/currency_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

const eur = WiseBalance(id: 100, currency: 'EUR', amount: 16.01);
const gbp = WiseBalance(id: 200, currency: 'GBP', amount: 5.0);

final statement = {
  'transactions': [
    {
      'type': 'DEBIT',
      'date': '2026-11-02T08:47:05.832Z',
      'amount': {'value': -7.76, 'currency': 'EUR'},
      'totalFees': {'value': 0.04, 'currency': 'EUR'},
      'details': {
        'type': 'CARD',
        'description': 'Card transaction of 6.80 GBP issued by Tfl.gov.uk/cp LONDON',
        'merchant': {'name': 'Tfl.gov.uk/cp'},
      },
      'referenceNumber': 'CARD-1',
    },
    {
      'type': 'CREDIT',
      'date': '2026-11-03T10:00:00Z',
      'amount': {'value': 2500, 'currency': 'EUR'},
      'details': {'type': 'DEPOSIT', 'description': 'Received money from Employer'},
      'referenceNumber': 'TRANSFER-2',
    },
    {
      'type': 'DEBIT',
      'date': '2026-11-04T10:00:00Z',
      'amount': {'value': -115, 'currency': 'EUR'},
      'details': {
        'type': 'CONVERSION',
        'description': 'Converted 115.00 EUR to 100.00 GBP',
        'sourceAmount': {'value': 115, 'currency': 'EUR'},
        'targetAmount': {'value': 100, 'currency': 'GBP'},
      },
      'referenceNumber': 'BALANCE-3',
    },
  ],
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppPreferences.pref = await SharedPreferences.getInstance();
  });

  group('WiseClient', () {
    test('lists profiles and balances with the Bearer token', () async {
      final sent = <http.Request>[];
      final client = WiseClient(
        client: MockClient((request) async {
          sent.add(request);
          return http.Response(
            jsonEncode(request.url.path == '/v2/profiles'
                ? [
                    {'id': 1, 'type': 'PERSONAL', 'fullName': 'Jane Doe'},
                    {'id': 2, 'type': 'business', 'businessName': 'Doe Ltd'},
                  ]
                : [
                    {
                      'id': 100,
                      'currency': 'EUR',
                      'type': 'STANDARD',
                      'amount': {'value': 16.01, 'currency': 'EUR'},
                    },
                  ]),
            200,
          );
        }),
      );

      final profiles = await client.getProfiles(' token ');
      final balances = await client.getBalances('token', 1);

      expect(profiles.map((e) => e.title), ['Jane Doe — PERSONAL', 'Doe Ltd — BUSINESS']);
      expect(sent.first.headers['Authorization'], 'Bearer token');
      expect(sent.last.url.toString(), 'https://api.wise.com/v4/profiles/1/balances?types=STANDARD');
      expect(balances.single.currency, 'EUR');
      expect(balances.single.amount, 16.01);
    });

    test('requests statements in periods of at most 469 days', () async {
      final sent = <Uri>[];
      final client = WiseClient(
        client: MockClient((request) async {
          sent.add(request.url);
          return http.Response(jsonEncode(sent.length == 1 ? statement : {'transactions': []}), 200);
        }),
      );
      final start = DateTime.utc(2024, 1, 1);
      final end = DateTime.utc(2025, 6, 1);

      final result = await client.getStatement('token', profileId: 1, balance: eur, start: start, end: end);

      expect(sent.length, 2);
      expect(sent.first.path, '/v1/profiles/1/balance-statements/100/statement.json');
      expect(sent.first.queryParameters['currency'], 'EUR');
      expect(sent.first.queryParameters['intervalStart'], '2024-01-01T00:00:00.000Z');
      expect(sent.first.queryParameters['intervalEnd'], sent.last.queryParameters['intervalStart']);
      expect(sent.last.queryParameters['intervalEnd'], '2025-06-01T00:00:00.000Z');
      expect(result.length, 3);
      expect(result.first.description, 'Tfl.gov.uk/cp');
      expect(result.last.isConversion, isTrue);
    });

    test('explains the Strong Customer Authentication challenge', () async {
      final client = WiseClient(
        client: MockClient((_) async => http.Response('', 403, headers: {'x-2fa-approval': 'ott-1'})),
      );

      expect(
        () => client.getStatement('token', profileId: 1, balance: eur, start: DateTime(2026, 11, 1)),
        throwsA(isA<WiseScaException>().having((e) => e.message, 'message', AppLocale.labels.wiseScaRequired)),
      );
    });

    test('reports a revoked token', () async {
      final client = WiseClient(client: MockClient((_) async => http.Response('', 401)));

      expect(
        () => client.getProfiles('token'),
        throwsA(isA<WiseException>().having((e) => e.message, 'message', AppLocale.labels.integrationAccessDenied)),
      );
    });
  });

  group('WiseImporter', () {
    final transactions =
        (statement['transactions'] as List).cast<Map<String, dynamic>>().map(WiseTransaction.fromJson).toList();

    test('imports transactions once by their reference number', () {
      final store = <String, InterfaceAppData>{};
      final importer = WiseImporter(
        exists: store.containsKey,
        add: (item, uuid) => store[uuid] = item,
        setRate: (_) => fail('No rate is expected without a linked balance'),
      );

      run() => importer.run(profileId: 1, balance: eur, transactions: transactions, account: 'acc', category: 'bud');
      expect(run(), (added: 3, skipped: 0, pending: 0));
      expect(run(), (added: 0, skipped: 3, pending: 0));

      final bills = store.values.whereType<BillAppData>().toList();
      expect(bills.map((e) => e.details), [7.76, 115.0]);
      expect(bills.first.title, 'Tfl.gov.uk/cp');
      expect(bills.first.currency?.code, 'EUR');
      expect(store.values.whereType<InvoiceAppData>().single.details, 2500.0);
    });

    test('imports conversions between linked balances as transfers', () {
      final store = <String, InterfaceAppData>{};
      final rates = <CurrencyAppData>[];
      final importer =
          WiseImporter(exists: store.containsKey, add: (item, uuid) => store[uuid] = item, setRate: rates.add);

      final result = importer.run(
        profileId: 1,
        balance: eur,
        transactions: transactions,
        account: 'eur-acc',
        category: 'bud',
        counterparts: {'GBP': (balanceId: '200', account: 'gbp-acc')},
      );

      expect(result, (added: 3, skipped: 0, pending: 0));
      final transfer = store[WiseImporter.conversionUuid(1, 'BALANCE-3')] as InvoiceAppData;
      expect(transfer.accountFrom, 'eur-acc');
      expect(transfer.account, 'gbp-acc');
      expect(transfer.details, 100.0);
      expect(transfer.currency?.code, 'GBP');
      expect(rates.single.uuid, 'GBP-EUR');
      expect(rates.single.details, 1.15);

      // The other side of the conversion is not imported again
      final credit = WiseTransaction.fromJson({
        'type': 'CREDIT',
        'date': '2026-11-04T10:00:00Z',
        'amount': {'value': 100, 'currency': 'GBP'},
        'details': (statement['transactions'] as List).last['details'],
        'referenceNumber': 'BALANCE-3',
      });
      expect(
        importer.run(
          profileId: 1,
          balance: gbp,
          transactions: [credit],
          account: 'gbp-acc',
          category: 'bud',
          counterparts: {'EUR': (balanceId: '100', account: 'eur-acc')},
        ),
        (added: 0, skipped: 1, pending: 0),
      );
    });
  });

  group('WiseSettings', () {
    test('keeps the token encrypted', () async {
      await WiseSettings.saveToken('secret-token');

      expect(AppPreferences.get(AppPreferences.prefWiseToken), isNot(contains('secret-token')));
      expect(WiseSettings.loadToken(), 'secret-token');

      await WiseSettings.clearToken();
      expect(WiseSettings.loadToken(), isNull);
    });

    test('saves the profile, balance links and import dates', () async {
      await WiseSettings(profile: 1, links: {'100': 'acc'}, imported: {'100': DateTime(2026, 11, 14)}).save();

      final loaded = WiseSettings.load();
      expect(loaded.profile, 1);
      expect(loaded.links, {'100': 'acc'});
      expect(loaded.imported, {'100': DateTime(2026, 11, 14)});
    });
  });
}
