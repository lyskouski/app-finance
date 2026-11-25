// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/integration/up/up_client.dart';
import 'package:app_finance/_classes/integration/up/up_importer.dart';
import 'package:app_finance/_classes/integration/up/up_settings.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> account(String id, String name, String value, {String type = 'TRANSACTIONAL'}) => {
      'type': 'accounts',
      'id': id,
      'attributes': {
        'displayName': name,
        'accountType': type,
        'ownershipType': 'INDIVIDUAL',
        'balance': {'currencyCode': 'AUD', 'value': value, 'valueInBaseUnits': (double.parse(value) * 100).round()},
        'createdAt': '2020-01-01T00:00:00+10:00',
      },
    };

Map<String, dynamic> transaction(String id, String value,
        {String status = 'SETTLED', String? transferAccount, String description = 'Coffee Shop'}) =>
    {
      'type': 'transactions',
      'id': id,
      'attributes': {
        'status': status,
        'rawText': 'COFFEE SHOP SYDNEY',
        'description': description,
        'amount': {'currencyCode': 'AUD', 'value': value, 'valueInBaseUnits': (double.parse(value) * 100).round()},
        'foreignAmount': null,
        'settledAt': status == 'SETTLED' ? '2026-11-21T10:00:00+11:00' : null,
        'createdAt': '2026-11-20T09:30:00+11:00',
      },
      'relationships': {
        'account': {
          'data': {'type': 'accounts', 'id': 'spending'}
        },
        'transferAccount': {
          'data': transferAccount != null ? {'type': 'accounts', 'id': transferAccount} : null,
        },
      },
    };

http.Response page(List<Map<String, dynamic>> data, {String? next}) => http.Response(
      jsonEncode({
        'data': data,
        'links': {'prev': null, 'next': next},
      }),
      200,
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppPreferences.pref = await SharedPreferences.getInstance();
  });

  group('UpClient', () {
    test('checks the token and lists accounts with their balances', () async {
      final requests = <http.Request>[];
      final client = UpClient(
        client: MockClient((request) async {
          requests.add(request);
          if (request.url.path == '/api/v1/util/ping') {
            return http.Response.bytes(
                utf8.encode(jsonEncode({
                  'meta': {'id': 'x', 'statusEmoji': '⚡️'}
                })),
                200);
          }
          return page(
              [account('spending', 'Spending', '123.45'), account('saver', 'Rainy Day', '1000.00', type: 'SAVER')]);
        }),
      );
      await client.ping('up:yeah:T');
      final accounts = await client.getAccounts('up:yeah:T');
      expect(requests.first.headers['Authorization'], 'Bearer up:yeah:T');
      expect(requests.last.url.path, '/api/v1/accounts');
      expect(requests.last.url.queryParameters, {'page[size]': '100'});
      expect(accounts.first.name, 'Spending');
      expect(accounts.first.balance, (value: 123.45, currency: 'AUD'));
      expect(accounts.last.type, 'SAVER');
    });

    test('follows the next links of the pages', () async {
      final requests = <Uri>[];
      final client = UpClient(
        client: MockClient((request) async {
          requests.add(request.url);
          return request.url.queryParameters.containsKey('page[after]')
              ? page([transaction('t2', '2500.00', description: 'Salary')])
              : page(
                  [transaction('t1', '-4.50')],
                  next: 'https://api.up.com.au/api/v1/accounts/spending/transactions?page[size]=100&page[after]=abc',
                );
        }),
      );
      final result = await client.getTransactions('T', 'spending', since: DateTime.utc(2026, 11, 1));
      expect(requests.length, 2);
      expect(requests.first.path, '/api/v1/accounts/spending/transactions');
      expect(requests.first.queryParameters, {'page[size]': '100', 'filter[since]': '2026-11-01T00:00:00.000Z'});
      expect(result.map((e) => e.id), ['t1', 't2']);
      expect(result.first.amount, (value: -4.5, currency: 'AUD'));
      expect(result.first.date, DateTime.parse('2026-11-20T09:30:00+11:00').toLocal());
      expect(result.first.held, isFalse);
      expect(result.first.transferAccount, isNull);
    });

    test('does not send the token to another host', () async {
      final requests = <Uri>[];
      final client = UpClient(
        client: MockClient((request) async {
          requests.add(request.url);
          return page([transaction('t1', '-4.50')], next: 'https://evil.example.com/steal');
        }),
      );
      await expectLater(client.getTransactions('T', 'spending', since: DateTime(2026)), throwsA(isA<UpException>()));
      expect(requests.map((e) => e.host).toSet(), {'api.up.com.au'});
    });

    test('reports a rejected token and service errors', () async {
      var response = http.Response(
          jsonEncode({
            'errors': [
              {'status': '401', 'title': 'Not Authorized', 'detail': 'The request was not authenticated'}
            ]
          }),
          401);
      final client = UpClient(client: MockClient((_) async => response));
      await expectLater(client.ping('T'),
          throwsA(isA<UpException>().having((e) => e.message, 'message', AppLocale.labels.integrationAccessDenied)));
      response = http.Response(
          jsonEncode({
            'errors': [
              {'status': '429', 'title': 'Too Many Requests', 'detail': 'Slow down'}
            ]
          }),
          429);
      await expectLater(
          client.ping('T'),
          throwsA(isA<UpException>()
              .having((e) => e.message, 'message', AppLocale.labels.integrationServiceError('Slow down'))));
    });
  });

  group('UpImporter', () {
    final spending = UpAccount.fromJson(account('spending', 'Spending', '100.00'));
    final saver = UpAccount.fromJson(account('saver', 'Saver', '100.00', type: 'SAVER'));

    test('imports settled transactions once and counts held ones', () {
      final added = <String, InterfaceAppData>{};
      final importer = UpImporter(exists: added.containsKey, add: (item, uuid) => added[uuid] = item);
      final transactions = [
        transaction('t1', '-4.50'),
        transaction('t2', '2500.00', description: 'Salary'),
        transaction('t3', '-1.00', status: 'HELD'),
      ].map(UpTransaction.fromJson).toList();
      IntegrationImportResult runImport() =>
          importer.run(source: spending, transactions: transactions, account: 'A', category: 'C');

      expect(runImport(), (added: 2, skipped: 0, pending: 1));
      final bill = added[UpImporter.uuidOf('t1')] as BillAppData;
      expect(bill.details, 4.5);
      expect(bill.title, 'Coffee Shop');
      expect(bill.currency?.code, 'AUD');
      expect(added[UpImporter.uuidOf('t2')], isA<InvoiceAppData>());
      expect(runImport(), (added: 0, skipped: 2, pending: 1));
    });

    test('records a transfer between linked accounts once, by the receiving account', () {
      final added = <String, InterfaceAppData>{};
      final importer = UpImporter(exists: added.containsKey, add: (item, uuid) => added[uuid] = item);
      const links = {'spending': 'app-spending', 'saver': 'app-saver'};

      // The sending side is left out
      final sent = importer.run(
        source: spending,
        transactions: [UpTransaction.fromJson(transaction('t-out', '-50.00', transferAccount: 'saver'))],
        account: 'app-spending',
        category: 'C',
        links: links,
      );
      expect(sent, (added: 0, skipped: 0, pending: 0));

      // The receiving side (incl. a Round Up, listed only in the saver) becomes a transfer
      final received = importer.run(
        source: saver,
        transactions: [
          UpTransaction.fromJson(transaction('t-in', '50.00', transferAccount: 'spending', description: 'Transfer')),
          UpTransaction.fromJson(transaction('t-round', '0.50', transferAccount: 'spending', description: 'Round Up')),
        ],
        account: 'app-saver',
        category: 'C',
        links: links,
      );
      expect(received, (added: 2, skipped: 0, pending: 0));
      final transfer = added[UpImporter.uuidOf('t-in')] as InvoiceAppData;
      expect(transfer.account, 'app-saver');
      expect(transfer.accountFrom, 'app-spending');
      expect(transfer.details, 50);
      expect((added[UpImporter.uuidOf('t-round')] as InvoiceAppData).details, 0.5);
    });

    test('imports a transfer as a bill or an invoice while the other account is not linked', () {
      final added = <String, InterfaceAppData>{};
      final importer = UpImporter(exists: added.containsKey, add: (item, uuid) => added[uuid] = item);
      importer.run(
        source: spending,
        transactions: [UpTransaction.fromJson(transaction('t-out', '-50.00', transferAccount: 'saver'))],
        account: 'app-spending',
        category: 'C',
        links: const {'spending': 'app-spending'},
      );
      expect(added[UpImporter.uuidOf('t-out')], isA<BillAppData>());
    });
  });

  group('UpSettings', () {
    test('stores the links and the encrypted token', () async {
      final settings = UpSettings()..links['spending'] = 'uuid';
      await settings.save();
      expect(UpSettings.load().links, {'spending': 'uuid'});
      await UpSettings.saveToken('up:yeah:secret');
      expect(AppPreferences.get(AppPreferences.prefUpToken), isNot(contains('secret')));
      expect(UpSettings.loadToken(), 'up:yeah:secret');
      await UpSettings.clearToken();
      expect(UpSettings.loadToken(), isNull);
    });
  });
}
