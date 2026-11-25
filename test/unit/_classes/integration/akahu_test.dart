// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/akahu/akahu_client.dart';
import 'package:app_finance/_classes/integration/akahu/akahu_importer.dart';
import 'package:app_finance/_classes/integration/akahu/akahu_settings.dart';
import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

const AkahuTokens tokens = (appToken: 'app_token_1', userToken: 'user_token_1');

final accountJson = {
  '_id': 'acc_1',
  '_authorisation': 'auth_1',
  'connection': {'_id': 'conn_1', 'name': 'ANZ', 'logo': 'https://example.com/logo.png'},
  'name': 'Everyday',
  'status': 'ACTIVE',
  'formatted_account': '01-0000-0000000-00',
  'type': 'CHECKING',
  'attributes': ['TRANSACTIONS', 'PAYMENT_TO'],
  'balance': {'currency': 'NZD', 'current': 1234.56, 'available': 1200.0},
};

Map<String, dynamic> transaction(String id, num amount,
        {Map<String, dynamic>? merchant, Map<String, dynamic>? category}) =>
    {
      '_id': id,
      '_account': 'acc_1',
      '_connection': 'conn_1',
      'created_at': '2026-11-20T01:00:00.000Z',
      'updated_at': '2026-11-20T01:00:00.000Z',
      'date': '2026-11-19T11:00:00.000Z',
      'description': 'RAW DESCRIPTION',
      'amount': amount,
      'balance': 100,
      'type': 'EFTPOS',
      if (merchant != null) 'merchant': merchant,
      if (category != null) 'category': category,
    };

http.Response ok(Map<String, dynamic> body) => http.Response(jsonEncode({'success': true, ...body}), 200);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppPreferences.pref = await SharedPreferences.getInstance();
  });

  group('AkahuClient', () {
    test('lists accounts with both tokens', () async {
      final requests = <http.BaseRequest>[];
      final client = AkahuClient(
        client: MockClient((request) async {
          requests.add(request);
          return ok({
            'items': [
              accountJson,
              {
                ...accountJson,
                '_id': 'acc_2',
                'name': 'KiwiSaver',
                'status': 'INACTIVE',
                'formatted_account': null,
                'attributes': <String>[],
              },
            ],
          });
        }),
      );
      final accounts = await client.getAccounts(tokens);
      expect(requests.single.url.toString(), 'https://api.akahu.io/v1/accounts');
      expect(requests.single.headers['Authorization'], 'Bearer user_token_1');
      expect(requests.single.headers['X-Akahu-Id'], 'app_token_1');
      expect(accounts.first.title, 'ANZ — Everyday 01-0000-0000000-00');
      expect(accounts.first.balance, 1234.56);
      expect(accounts.first.currency, 'NZD');
      expect(accounts.first.isActive, isTrue);
      expect(accounts.last.isActive, isFalse);
      expect(accounts.last.title, 'ANZ — KiwiSaver');
    });

    test('follows the cursor with the same exclusive start', () async {
      final requests = <Uri>[];
      final client = AkahuClient(
        client: MockClient((request) async {
          requests.add(request.url);
          final cursor = request.url.queryParameters['cursor'];
          return cursor == null
              ? ok({
                  'items': [transaction('trans_1', -5.5)],
                  'cursor': {'next': 'page2'},
                })
              : ok({
                  'items': [transaction('trans_2', 2500)],
                  'cursor': {'next': null},
                });
        }),
      );
      final result = await client.getTransactions(tokens, 'acc_1', from: DateTime.utc(2026, 11, 1));
      expect(result.map((e) => e.id), ['trans_1', 'trans_2']);
      expect(requests.length, 2);
      expect(requests.first.path, '/v1/accounts/acc_1/transactions');
      expect(requests.first.queryParameters, {'start': '2026-10-31T23:59:59.999Z'});
      expect(requests.last.queryParameters, {'start': '2026-10-31T23:59:59.999Z', 'cursor': 'page2'});
      expect(result.first.amount, -5.5);
      expect(result.first.date, DateTime.utc(2026, 11, 19, 11).toLocal());
    });

    test('uses the merchant and the categories of the enriched data', () {
      final item = AkahuTransaction.fromJson(transaction(
        'trans_1',
        -42,
        merchant: {'_id': 'merchant_1', 'name': 'Countdown'},
        category: {
          '_id': 'nzfcc_1',
          'name': 'Supermarkets and grocery stores',
          'groups': {
            'personal_finance': {'_id': 'group_1', 'name': 'Food'},
          },
        },
      ));
      expect(item.description, 'Countdown');
      expect(item.categories, ['Supermarkets and grocery stores', 'Food']);
      expect(AkahuTransaction.fromJson(transaction('trans_2', -1)).description, 'RAW DESCRIPTION');
    });

    test('counts pending transactions and requests a refresh', () async {
      final requests = <http.BaseRequest>[];
      final client = AkahuClient(
        client: MockClient((request) async {
          requests.add(request);
          if (request.method == 'POST') {
            return ok({});
          }
          return ok({
            'items': [
              {'_account': 'acc_1', 'date': '2026-11-24T00:00:00.000Z', 'description': 'HOLD', 'amount': -3},
            ],
          });
        }),
      );
      expect(await client.countPending(tokens, 'acc_1'), 1);
      expect(requests.single.url.path, '/v1/accounts/acc_1/transactions/pending');
      await client.refresh(tokens);
      expect(requests.last.method, 'POST');
      expect(requests.last.url.path, '/v1/refresh');
    });

    test('reports rejected tokens and service errors', () async {
      var response = http.Response(jsonEncode({'success': false, 'message': 'Unauthorized'}), 401);
      final client = AkahuClient(client: MockClient((_) async => response));
      await expectLater(client.getAccounts(tokens),
          throwsA(isA<AkahuException>().having((e) => e.message, 'message', AppLocale.labels.integrationAccessDenied)));
      response = http.Response(jsonEncode({'success': false, 'message': 'Too many requests'}), 429);
      await expectLater(
          client.getAccounts(tokens),
          throwsA(isA<AkahuException>()
              .having((e) => e.message, 'message', AppLocale.labels.integrationServiceError('Too many requests'))));
      response = http.Response(jsonEncode({'success': false}), 200);
      await expectLater(
          client.getAccounts(tokens),
          throwsA(isA<AkahuException>()
              .having((e) => e.message, 'message', AppLocale.labels.integrationUnexpectedResponse)));
    });
  });

  group('AkahuImporter', () {
    test('imports transactions once, matching budget categories by the names of Akahu', () {
      final added = <String, InterfaceAppData>{};
      final importer = AkahuImporter(
        exists: added.containsKey,
        add: (item, uuid) => added[uuid] = item,
        budgetOf: (name) => name == 'Food' ? 'budget-food' : null,
      );
      final account = AkahuAccount.fromJson(accountJson);
      final transactions = [
        transaction('trans_1', -42, category: {
          'name': 'Supermarkets and grocery stores',
          'groups': {
            'personal_finance': {'name': 'Food'}
          },
        }),
        transaction('trans_2', -5.5),
        transaction('trans_3', 2500),
      ].map(AkahuTransaction.fromJson).toList();
      IntegrationImportResult runImport() => importer.run(
            source: account,
            transactions: transactions,
            account: 'A',
            category: 'default',
            pending: 2,
          );

      expect(runImport(), (added: 3, skipped: 0, pending: 2));
      final food = added[AkahuImporter.uuidOf('acc_1', 'trans_1')] as BillAppData;
      expect(food.category, 'budget-food');
      expect(food.details, 42);
      expect(food.currency?.code, 'NZD');
      expect((added[AkahuImporter.uuidOf('acc_1', 'trans_2')] as BillAppData).category, 'default');
      expect(added[AkahuImporter.uuidOf('acc_1', 'trans_3')], isA<InvoiceAppData>());
      expect(runImport(), (added: 0, skipped: 3, pending: 2));
    });
  });

  group('AkahuSettings', () {
    test('stores the links and the encrypted tokens', () async {
      final settings = AkahuSettings()..links['acc_1'] = 'uuid';
      await settings.save();
      expect(AkahuSettings.load().links, {'acc_1': 'uuid'});

      expect(AkahuSettings.loadTokens(), isNull);
      await AkahuSettings.saveTokens(tokens);
      expect(AppPreferences.get(AppPreferences.prefAkahuTokens), isNot(contains('user_token')));
      expect(AkahuSettings.loadTokens(), tokens);
      await AkahuSettings.clearTokens();
      expect(AkahuSettings.loadTokens(), isNull);
    });
  });
}
