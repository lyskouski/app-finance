// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/integration/simplefin/simplefin_client.dart';
import 'package:app_finance/_classes/integration/simplefin/simplefin_importer.dart';
import 'package:app_finance/_classes/integration/simplefin/simplefin_settings.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

const claimUrl = 'https://bridge.example.com/simplefin/claim/demo';
final token = base64.encode(utf8.encode(claimUrl));
final access = Uri.parse('https://user:p%40ss@bridge.example.com/simplefin');

// Protocol v2 answer: accounts refer to connections
final v2 = {
  'errlist': [
    {'code': 'con.auth', 'msg': 'Reconnect My Bank', 'conn_id': 'CON-1'},
  ],
  'connections': [
    {'conn_id': 'CON-1', 'name': 'My Bank', 'org_id': 'ORG-1', 'sfin_url': 'https://bridge.example.com/simplefin'},
  ],
  'accounts': [
    {
      'id': 'ACT-1',
      'name': 'Checking',
      'conn_id': 'CON-1',
      'currency': 'USD',
      'balance': '1234.56',
      'available-balance': '1200.00',
      'balance-date': 1763078400,
      'transactions': [
        {'id': 'TRN-1', 'posted': 1762905600, 'amount': '-12.50', 'description': 'Coffee Shop'},
        {'id': 'TRN-2', 'posted': 1762992000, 'amount': '2500.00', 'description': 'Payroll'},
        {'id': 'TRN-3', 'posted': 0, 'amount': '-5.00', 'description': 'Pending', 'pending': true},
      ],
    },
  ],
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppPreferences.pref = await SharedPreferences.getInstance();
  });

  group('SimpleFinClient', () {
    test('decodes a Setup Token into its claim URL', () {
      expect(SimpleFinClient.decodeToken(' $token\n'), Uri.parse(claimUrl));
    });

    test('refuses tokens that are not Base64 HTTPS URLs', () {
      expect(() => SimpleFinClient.decodeToken('not a token!'), throwsA(isA<SimpleFinException>()));
      final insecure = base64.encode(utf8.encode('http://bridge.example.com/claim/demo'));
      expect(() => SimpleFinClient.decodeToken(insecure), throwsA(isA<SimpleFinException>()));
    });

    test('claims the Access URL with a POST', () async {
      late http.Request sent;
      final client = SimpleFinClient(
        client: MockClient((request) async {
          sent = request;
          return http.Response(access.toString(), 200);
        }),
      );

      expect(await client.claim(token), access);
      expect(sent.method, 'POST');
      expect(sent.url, Uri.parse(claimUrl));
    });

    test('reports a used Setup Token', () async {
      final client = SimpleFinClient(client: MockClient((_) async => http.Response('', 403)));

      expect(
        () => client.claim(token),
        throwsA(isA<SimpleFinException>().having((e) => e.statusCode, 'statusCode', 403)),
      );
    });

    test('requests accounts with Basic Auth, keeping credentials out of the URL', () async {
      late http.Request sent;
      final client = SimpleFinClient(
        client: MockClient((request) async {
          sent = request;
          return http.Response(jsonEncode(v2), 200);
        }),
      );

      final result = await client.getAccounts(
        access,
        start: DateTime.fromMillisecondsSinceEpoch(1762905600 * 1000),
        accountIds: ['ACT-1'],
      );

      expect(sent.url.userInfo, isEmpty);
      expect(sent.url.path, '/simplefin/accounts');
      expect(sent.url.queryParameters, {'start-date': '1762905600', 'account': 'ACT-1'});
      expect(sent.headers['Authorization'], 'Basic ${base64.encode(utf8.encode('user:p@ss'))}');
      final account = result.accounts.single;
      expect(account.institution, 'My Bank');
      expect(account.balance, 1234.56);
      expect(account.availableBalance, 1200.0);
      expect(account.transactions.map((e) => e.pending), [false, false, true]);
      expect(result.errors, ['Reconnect My Bank']);
    });

    test('reads protocol v1 answers', () {
      final result = SimpleFinAccountSet.fromJson({
        'errors': ['Bank unavailable'],
        'accounts': [
          {
            'org': {'domain': 'bank.example.com', 'name': 'Old Bank'},
            'id': 'A',
            'name': 'Savings',
            'currency': 'USD',
            'balance': '10.00',
            'balance-date': 1,
          },
        ],
      });

      expect(result.accounts.single.institution, 'Old Bank');
      expect(result.errors, ['Bank unavailable']);
    });

    test('reports revoked access', () async {
      final client = SimpleFinClient(client: MockClient((_) async => http.Response('', 403)));

      expect(() => client.getAccounts(access), throwsA(isA<SimpleFinException>()));
    });
  });

  group('SimpleFinImporter', () {
    test('imports booked transactions once, leaving pending ones out', () {
      final store = <String, InterfaceAppData>{};
      final importer = SimpleFinImporter(exists: store.containsKey, add: (item, uuid) => store[uuid] = item);
      final source = SimpleFinAccountSet.fromJson(v2).accounts.single;

      expect(importer.run(source: source, account: 'acc', category: 'bud'), (added: 2, skipped: 0, pending: 1));
      expect(importer.run(source: source, account: 'acc', category: 'bud'), (added: 0, skipped: 2, pending: 1));

      final bill = store.values.whereType<BillAppData>().single;
      expect(bill.details, 12.5);
      expect(bill.title, 'Coffee Shop');
      expect(bill.currency?.code, 'USD');
      expect(store.values.whereType<InvoiceAppData>().single.details, 2500.0);
    });
  });

  group('SimpleFinSettings', () {
    test('keeps the Access URL encrypted', () async {
      await SimpleFinSettings.saveAccess(access);

      expect(AppPreferences.get(AppPreferences.prefSimpleFinAccess), isNot(contains('p%40ss')));
      expect(SimpleFinSettings.loadAccess(), access);

      await SimpleFinSettings.clearAccess();
      expect(SimpleFinSettings.loadAccess(), isNull);
    });

    test('saves account links and import dates', () async {
      await SimpleFinSettings(links: {'ACT-1': 'acc'}, imported: {'ACT-1': DateTime(2026, 11, 14)}).save();

      final loaded = SimpleFinSettings.load();
      expect(loaded.links, {'ACT-1': 'acc'});
      expect(loaded.imported, {'ACT-1': DateTime(2026, 11, 14)});
    });
  });
}
