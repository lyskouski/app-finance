// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/deep_link/deep_link_handler.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/integration/monzo/monzo_client.dart';
import 'package:app_finance/_classes/integration/monzo/monzo_importer.dart';
import 'package:app_finance/_classes/integration/monzo/monzo_settings.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

final start = DateTime.utc(2026, 11, 25, 10);

Map<String, dynamic> transaction(String id, int amount,
        {String settled = '2026-11-21T10:00:00Z', String? declined, dynamic merchant}) =>
    {
      'id': id,
      'created': '2026-11-20T12:20:18Z',
      'amount': amount,
      'currency': 'GBP',
      'description': 'THE DE BEAUVOIR DELI C LONDON        GBR',
      'merchant': merchant ?? 'merch_1',
      'notes': '',
      'is_load': false,
      'settled': settled,
      'category': 'eating_out',
      if (declined != null) 'decline_reason': declined,
    };

http.Response json(Object value, [int status = 200]) => http.Response(jsonEncode(value), status);

MonzoClient createClient(MockClientHandler handler, {MonzoTokens? tokens, List<MonzoTokens>? stored}) => MonzoClient(
      clientId: 'oauth2client_1',
      clientSecret: 'mnzconf.secret',
      tokens: tokens,
      onTokens: (value) async => stored?.add(value),
      now: () => start,
      client: MockClient(handler),
    );

final validTokens = MonzoTokens(accessToken: 'A1', refreshToken: 'R1', expiresAt: start.add(const Duration(hours: 6)));

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppPreferences.pref = await SharedPreferences.getInstance();
  });

  group('MonzoClient', () {
    test('builds the sign-in address and exchanges the code', () async {
      final requests = <http.Request>[];
      final stored = <MonzoTokens>[];
      final client = createClient((request) async {
        requests.add(request);
        return json({
          'access_token': 'A1',
          'client_id': 'oauth2client_1',
          'expires_in': 21600,
          'refresh_token': 'R1',
          'token_type': 'Bearer',
          'user_id': 'user_1',
        });
      }, stored: stored);

      final url = client.authorizationUrl(redirectUrl: MonzoSettings.callbackUrl, state: 'monzo.S');
      expect(url.toString(),
          'https://auth.monzo.com/?client_id=oauth2client_1&redirect_uri=fingrom%3A%2F%2Fintegration%2Fmonzo&response_type=code&state=monzo.S');

      final tokens = await client.exchange('CODE', redirectUrl: MonzoSettings.callbackUrl);
      expect(requests.single.url.toString(), 'https://api.monzo.com/oauth2/token');
      expect(requests.single.bodyFields, {
        'client_id': 'oauth2client_1',
        'client_secret': 'mnzconf.secret',
        'grant_type': 'authorization_code',
        'redirect_uri': 'fingrom://integration/monzo',
        'code': 'CODE',
      });
      expect(tokens.accessToken, 'A1');
      expect(tokens.refreshToken, 'R1');
      expect(tokens.expiresAt, start.add(const Duration(seconds: 21600)));
      expect(stored.single.accessToken, 'A1');
    });

    test('reads the code from the redirect and checks the state', () {
      final link = '${MonzoSettings.callbackUrl}?code=C1&state=monzo.S';
      expect(DeepLinkHandler.isMonzoCallback(Uri.parse(link)), isTrue);
      expect(MonzoClient.extractCode(link, state: 'monzo.S', requireState: true), 'C1');
      expect(() => MonzoClient.extractCode(link, state: 'monzo.X', requireState: true), throwsA(isA<MonzoException>()));
      expect(MonzoClient.extractCode(' C2 '), 'C2');
    });

    test('refreshes an expired token before the request and stores it', () async {
      final requests = <http.Request>[];
      final stored = <MonzoTokens>[];
      final client = createClient(
        (request) async {
          requests.add(request);
          if (request.url.path == '/oauth2/token') {
            return json({'access_token': 'A2', 'refresh_token': 'R2', 'expires_in': 21600});
          }
          return json({
            'accounts': [
              {
                'id': 'acc_1',
                'description': 'user_0000',
                'type': 'uk_retail',
                'currency': 'GBP',
                'account_number': '12345678',
                'closed': false,
                'owners': [
                  {'preferred_name': 'Peter Pan'}
                ],
              },
            ],
          });
        },
        tokens: MonzoTokens(accessToken: 'A1', refreshToken: 'R1', expiresAt: start),
        stored: stored,
      );
      final accounts = await client.getAccounts();
      expect(requests.first.bodyFields['grant_type'], 'refresh_token');
      expect(requests.first.bodyFields['refresh_token'], 'R1');
      expect(requests.last.headers['Authorization'], 'Bearer A2');
      expect(stored.single.refreshToken, 'R2');
      expect(accounts.single.title, 'Peter Pan …5678');
    });

    test('refreshes once when the token is rejected', () async {
      var rejected = false;
      final client = createClient((request) async {
        if (request.url.path == '/oauth2/token') {
          return json({'access_token': 'A2', 'refresh_token': 'R2', 'expires_in': 21600});
        }
        if (!rejected) {
          rejected = true;
          return json({'code': 'unauthorized.bad_access_token', 'error': 'invalid_token'}, 401);
        }
        expect(request.headers['Authorization'], 'Bearer A2');
        return json({'balance': 5000, 'total_balance': 6000, 'currency': 'GBP', 'spend_today': 0});
      }, tokens: validTokens);
      final balance = await client.getBalance('acc_1');
      expect(balance.balance, 50.0);
      expect(balance.currency, 'GBP');
    });

    test('reports a missing approval, an expired access and the history limit', () async {
      var response = json({'code': 'forbidden.insufficient_permissions', 'message': 'Insufficient permissions'}, 403);
      final client = createClient((request) async {
        if (request.url.path == '/oauth2/token') {
          return json({'error': 'invalid_grant'}, 400);
        }
        return response;
      }, tokens: validTokens);
      await expectLater(
          client.getAccounts(),
          throwsA(isA<MonzoException>()
              .having((e) => e.message, 'message', AppLocale.labels.monzoApprove)
              .having((e) => e.code, 'code', 'forbidden.insufficient_permissions')));

      response = json({'code': 'forbidden.verification_required', 'message': 'Verification required'}, 403);
      await expectLater(client.getTransactions('acc_1', since: DateTime(2025)),
          throwsA(isA<MonzoException>().having((e) => e.message, 'message', contains('90'))));

      response = json({'error': 'invalid_token'}, 401);
      await expectLater(
          client.getAccounts(),
          throwsA(isA<MonzoException>()
              .having((e) => e.message, 'message', AppLocale.labels.monzoExpired)
              .having((e) => e.statusCode, 'statusCode', 401)));
    });

    test('pages transactions after the last id', () async {
      final requests = <Uri>[];
      final client = createClient((request) async {
        requests.add(request.url);
        final since = request.url.queryParameters['since']!;
        final page = since.startsWith('tx_')
            ? [transaction('tx_last', 2500)]
            : List.generate(MonzoClient.pageSize, (i) => transaction('tx_$i', -510));
        return json({'transactions': page});
      }, tokens: validTokens);
      final result = await client.getTransactions('acc_1', since: DateTime.utc(2026, 11, 1));
      expect(result.length, MonzoClient.pageSize + 1);
      expect(requests.first.path, '/transactions');
      expect(requests.first.queryParameters, {
        'account_id': 'acc_1',
        'since': '2026-11-01T00:00:00Z',
        'before': '2026-11-25T10:00:00Z',
        'limit': '${MonzoClient.pageSize}',
        'expand[]': 'merchant',
      });
      expect(requests.last.queryParameters['since'], 'tx_${MonzoClient.pageSize - 1}');
      expect(result.first.amount, -5.1);
      expect(result.last.amount, 25.0);
    });

    test('parses transactions in minor units', () {
      final settled =
          MonzoTransaction.fromJson(transaction('tx_1', -510, merchant: {'name': 'The De Beauvoir Deli Co.'}));
      expect(settled.amount, -5.1);
      expect(settled.description, 'The De Beauvoir Deli Co.');
      expect(settled.created, DateTime.utc(2026, 11, 20, 12, 20, 18).toLocal());
      expect(settled.pending, isFalse);
      expect(MonzoTransaction.fromJson(transaction('tx_2', -100, settled: '')).pending, isTrue);
      expect(MonzoTransaction.fromJson(transaction('tx_3', -100, declined: 'INSUFFICIENT_FUNDS')).declined, isTrue);
      expect(MonzoClient.fromMinor(1234, 'JPY'), 1234);
    });
  });

  group('MonzoImporter', () {
    test('imports settled transactions once and leaves out declined ones', () {
      final added = <String, InterfaceAppData>{};
      final importer = MonzoImporter(exists: added.containsKey, add: (item, uuid) => added[uuid] = item);
      final transactions = [
        transaction('tx_1', -510),
        transaction('tx_2', 250000),
        transaction('tx_3', -100, settled: ''),
        transaction('tx_4', -999, declined: 'CARD_BLOCKED'),
      ].map(MonzoTransaction.fromJson).toList();
      IntegrationImportResult runImport() =>
          importer.run(accountId: 'acc_1', transactions: transactions, account: 'A', category: 'C');

      expect(runImport(), (added: 2, skipped: 0, pending: 1));
      final bill = added[MonzoImporter.uuidOf('acc_1', 'tx_1')] as BillAppData;
      expect(bill.details, 5.1);
      expect(bill.currency?.code, 'GBP');
      expect(added[MonzoImporter.uuidOf('acc_1', 'tx_2')], isA<InvoiceAppData>());
      expect(runImport(), (added: 0, skipped: 2, pending: 1));
    });
  });

  group('MonzoSettings', () {
    test('stores the configuration and the encrypted secret and tokens', () async {
      final settings = MonzoSettings(clientId: 'oauth2client_1', approvedAt: start)..links['acc_1'] = 'uuid';
      await settings.save();
      final loaded = MonzoSettings.load();
      expect(loaded.clientId, 'oauth2client_1');
      expect(loaded.links, {'acc_1': 'uuid'});
      expect(loaded.fullHistoryUntil, start.add(MonzoClient.fullHistoryWindow));

      await MonzoSettings.saveSecret('mnzconf.secret');
      await MonzoSettings.saveTokens(validTokens);
      expect(AppPreferences.get(AppPreferences.prefMonzoSecret), isNot(contains('mnzconf')));
      expect(AppPreferences.get(AppPreferences.prefMonzoTokens), isNot(contains('R1')));
      expect(MonzoSettings.loadSecret(), 'mnzconf.secret');
      expect(MonzoSettings.loadTokens()!.toJson(), validTokens.toJson());
      await MonzoSettings.clearTokens();
      expect(MonzoSettings.loadTokens(), isNull);
    });

    test('redirects to the application or to the web page shared with Enable Banking', () {
      expect(MonzoSettings.redirectUrlFor(null), 'fingrom://integration/monzo');
      expect(MonzoSettings.redirectUrlFor(Uri.parse('https://example.com/app/index.html')),
          'https://example.com/app/callback.html');
      expect(MonzoSettings.newState(), startsWith(MonzoSettings.statePrefix));
    });
  });
}
