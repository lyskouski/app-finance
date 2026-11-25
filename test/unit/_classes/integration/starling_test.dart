// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/integration/starling/starling_client.dart';
import 'package:app_finance/_classes/integration/starling/starling_importer.dart';
import 'package:app_finance/_classes/integration/starling/starling_settings.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

const account = StarlingAccount(id: 'acc-1', defaultCategory: 'cat-1', currency: 'GBP', name: 'Personal');

Map<String, dynamic> feedItem(String id, int minor,
        {String direction = 'OUT', String status = 'SETTLED', String time = '2026-11-20T12:20:18.000Z'}) =>
    {
      'feedItemUid': id,
      'categoryUid': 'cat-1',
      'amount': {'currency': 'GBP', 'minorUnits': minor},
      'sourceAmount': {'currency': 'GBP', 'minorUnits': minor},
      'direction': direction,
      'updatedAt': time,
      'transactionTime': time,
      'source': 'MASTER_CARD',
      'status': status,
      'counterPartyName': 'Coffee Shop',
      'reference': 'REF',
      'spendingCategory': 'EATING_OUT',
    };

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppPreferences.pref = await SharedPreferences.getInstance();
  });

  group('StarlingClient', () {
    test('lists accounts and balances with the bearer token', () async {
      final requests = <http.Request>[];
      final client = StarlingClient(
        client: MockClient((request) async {
          requests.add(request);
          if (request.url.path.endsWith('/balance')) {
            return http.Response(
              jsonEncode({
                'clearedBalance': {'currency': 'GBP', 'minorUnits': 100000},
                'effectiveBalance': {'currency': 'GBP', 'minorUnits': 98550},
                'pendingTransactions': {'currency': 'GBP', 'minorUnits': 1450},
              }),
              200,
            );
          }
          return http.Response(
            jsonEncode({
              'accounts': [
                {
                  'accountUid': 'acc-1',
                  'accountType': 'PRIMARY',
                  'defaultCategory': 'cat-1',
                  'currency': 'GBP',
                  'createdAt': '2020-01-01T00:00:00.000Z',
                  'name': 'Personal',
                },
              ],
            }),
            200,
          );
        }),
      );
      final accounts = await client.getAccounts('T');
      expect(requests.single.url.toString(), 'https://api.starlingbank.com/api/v2/accounts');
      expect(requests.single.headers['Authorization'], 'Bearer T');
      expect(accounts.single.id, 'acc-1');
      expect(accounts.single.defaultCategory, 'cat-1');
      expect(accounts.single.title, 'Personal — GBP');

      final balance = await client.getBalance('T', 'acc-1');
      expect(requests.last.url.path, '/api/v2/accounts/acc-1/balance');
      expect(balance, (value: 985.5, currency: 'GBP'));
    });

    test('reads the feed of the main category since a date', () async {
      final requests = <Uri>[];
      final client = StarlingClient(
        client: MockClient((request) async {
          requests.add(request.url);
          return http.Response(
            jsonEncode({
              'feedItems': [
                feedItem('f-1', 510),
                feedItem('f-2', 250000, direction: 'IN'),
                // Changed lately, but made before the period
                feedItem('f-3', 100, time: '2026-10-01T09:00:00.000Z'),
              ],
            }),
            200,
          );
        }),
      );
      final items = await client.getFeed('T', account, from: DateTime.utc(2026, 11, 1));
      expect(requests.single.path, '/api/v2/feed/account/acc-1/category/cat-1');
      expect(requests.single.queryParameters, {'changesSince': '2026-11-01T00:00:00.000Z'});
      expect(items.map((e) => e.id), ['f-1', 'f-2']);
      expect(items.first.amount, -5.1);
      expect(items.first.title, 'Coffee Shop');
      expect(items.first.date, DateTime.utc(2026, 11, 20, 12, 20, 18).toLocal());
      expect(items.last.amount, 2500);
    });

    test('reports a missing scope and a rejected token', () async {
      var response = http.Response(jsonEncode({'error': 'insufficient_scope', 'error_description': 'Scope'}), 403);
      final client = StarlingClient(client: MockClient((_) async => response));
      await expectLater(client.getAccounts('T'),
          throwsA(isA<StarlingException>().having((e) => e.message, 'message', AppLocale.labels.starlingScopes)));
      response = http.Response(jsonEncode({'error': 'invalid_token'}), 401);
      await expectLater(
          client.getAccounts('T'),
          throwsA(
              isA<StarlingException>().having((e) => e.message, 'message', AppLocale.labels.integrationAccessDenied)));
      response = http.Response(
          jsonEncode({
            'errors': [
              {'message': 'Too many requests'}
            ],
            'success': false
          }),
          429);
      await expectLater(
          client.getAccounts('T'),
          throwsA(isA<StarlingException>()
              .having((e) => e.message, 'message', AppLocale.labels.integrationServiceError('Too many requests'))));
    });

    test('maps the statuses of the feed', () {
      expect(StarlingStatus.parse('SETTLED'), StarlingStatus.booked);
      expect(StarlingStatus.parse('REFUNDED'), StarlingStatus.booked);
      expect(StarlingStatus.parse('PENDING'), StarlingStatus.pending);
      expect(StarlingStatus.parse('UPCOMING'), StarlingStatus.pending);
      expect(StarlingStatus.parse('DECLINED'), StarlingStatus.ignored);
      expect(StarlingStatus.parse('REVERSED'), StarlingStatus.ignored);
      expect(StarlingClient.parseAmount({'currency': 'JPY', 'minorUnits': 1200}), (value: 1200.0, currency: 'JPY'));
      expect(() => StarlingClient.parseAmount({'currency': 'GBP'}), throwsA(isA<StarlingException>()));
    });
  });

  group('StarlingImporter', () {
    test('imports booked items once and leaves out declined ones', () {
      final added = <String, InterfaceAppData>{};
      final importer = StarlingImporter(exists: added.containsKey, add: (item, uuid) => added[uuid] = item);
      final items = [
        feedItem('f-1', 510),
        feedItem('f-2', 250000, direction: 'IN'),
        feedItem('f-3', 100, status: 'PENDING'),
        feedItem('f-4', 999, status: 'DECLINED'),
      ].map(StarlingFeedItem.fromJson).toList();
      IntegrationImportResult runImport() =>
          importer.run(accountId: 'acc-1', items: items, account: 'A', category: 'C');

      expect(runImport(), (added: 2, skipped: 0, pending: 1));
      final bill = added[StarlingImporter.uuidOf('acc-1', 'f-1')] as BillAppData;
      expect(bill.details, 5.1);
      expect(bill.title, 'Coffee Shop');
      expect(bill.currency?.code, 'GBP');
      expect(added[StarlingImporter.uuidOf('acc-1', 'f-2')], isA<InvoiceAppData>());
      expect(runImport(), (added: 0, skipped: 2, pending: 1));
    });
  });

  group('StarlingSettings', () {
    test('stores the links and the encrypted token', () async {
      final settings = StarlingSettings()
        ..links['acc-1'] = 'uuid'
        ..imported['acc-1'] = DateTime(2026, 11, 20);
      await settings.save();
      final loaded = StarlingSettings.load();
      expect(loaded.links, {'acc-1': 'uuid'});
      expect(loaded.imported, {'acc-1': DateTime(2026, 11, 20)});

      await StarlingSettings.saveToken('eyJ.secret');
      expect(AppPreferences.get(AppPreferences.prefStarlingToken), isNot(contains('secret')));
      expect(StarlingSettings.loadToken(), 'eyJ.secret');
      await StarlingSettings.clearToken();
      expect(StarlingSettings.loadToken(), isNull);
    });
  });
}
