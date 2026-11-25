// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/investec/investec_client.dart';
import 'package:app_finance/_classes/integration/investec/investec_importer.dart';
import 'package:app_finance/_classes/integration/investec/investec_settings.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

const InvestecCredentials credentials = (clientId: 'client', secret: 's3cret', apiKey: 'key');

Map<String, dynamic> transaction(
  String description,
  dynamic amount, {
  String type = 'DEBIT',
  String status = 'POSTED',
  String date = '2026-11-20',
  String? uuid,
}) =>
    {
      'accountId': 'ACC-1',
      'type': type,
      'transactionType': 'CardPurchases',
      'status': status,
      'description': description,
      'cardNumber': '402261xxxxxx0011',
      'postedOrder': 11049,
      'postingDate': date,
      'valueDate': date,
      'actionDate': date,
      'transactionDate': '2026-11-19',
      'amount': amount,
      'runningBalance': 34679.66,
      if (uuid != null) 'uuid': uuid,
    };

http.Response data(Map<String, dynamic> value) => http.Response(
      jsonEncode({
        'data': value,
        'links': {'self': 'https://openapi.investec.com'},
        'meta': {'totalPages': 1},
      }),
      200,
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppPreferences.pref = await SharedPreferences.getInstance();
  });

  group('InvestecClient', () {
    test('authorizes with the client credentials and the API key, then reuses the token', () async {
      final requests = <http.Request>[];
      var now = DateTime(2026, 11, 25, 10);
      final client = InvestecClient(
        now: () => now,
        client: MockClient((request) async {
          requests.add(request);
          if (request.url.path == '/identity/v2/oauth2/token') {
            return http.Response(
              jsonEncode({'access_token': 'T${requests.length}', 'token_type': 'Bearer', 'expires_in': '1799'}),
              200,
            );
          }
          return data({
            'accounts': [
              {
                'accountId': 'ACC-1',
                'accountNumber': '10012345678',
                'accountName': 'Mr J Doe',
                'referenceName': 'Everyday',
                'productName': 'Private Bank Account',
                'kycCompliant': true,
                'profileId': 'P1',
                'profileName': 'John Doe',
              },
            ],
          });
        }),
      );

      final accounts = await client.getAccounts(credentials);
      expect(accounts.single.id, 'ACC-1');
      expect(accounts.single.title, 'Everyday …5678');
      final token = requests.first;
      expect(token.url.toString(), 'https://openapi.investec.com/identity/v2/oauth2/token');
      expect(token.headers['Authorization'], 'Basic ${base64.encode(utf8.encode('client:s3cret'))}');
      expect(token.headers['x-api-key'], 'key');
      expect(token.bodyFields, {'grant_type': 'client_credentials'});
      expect(requests[1].url.toString(), 'https://openapi.investec.com/za/pb/v1/accounts');
      expect(requests[1].headers['Authorization'], 'Bearer T1');

      await client.getAccounts(credentials);
      expect(requests.where((e) => e.url.path.contains('oauth2')).length, 1);

      // Renewed shortly before the expiry
      now = now.add(const Duration(minutes: 29));
      await client.getAccounts(credentials);
      expect(requests.where((e) => e.url.path.contains('oauth2')).length, 2);
      expect(requests.last.headers['Authorization'], 'Bearer T4');
    });

    test('requests a new token once when the current one is rejected', () async {
      var tokens = 0;
      var rejected = false;
      final client = InvestecClient(
        sandbox: true,
        client: MockClient((request) async {
          expect(request.url.host, 'openapisandbox.investec.com');
          if (request.url.path.contains('oauth2')) {
            tokens++;
            return http.Response(jsonEncode({'access_token': 'T$tokens', 'expires_in': 1799}), 200);
          }
          if (!rejected) {
            rejected = true;
            return http.Response('', 401);
          }
          return data({'accountId': 'ACC-1', 'currentBalance': 100.5, 'availableBalance': '90', 'currency': 'ZAR'});
        }),
      );
      final balance = await client.getBalance(credentials, 'ACC-1');
      expect(tokens, 2);
      expect(balance.current, 100.5);
      expect(balance.available, 90);
      expect(balance.currency, 'ZAR');
    });

    test('reports invalid credentials and service errors', () async {
      var status = 401;
      final client = InvestecClient(
        client: MockClient((request) async => status == 401
            ? http.Response(jsonEncode({'error': 'invalid_client'}), 401)
            : http.Response(jsonEncode({'message': 'Too many requests'}), status)),
      );
      await expectLater(
          client.getAccounts(credentials),
          throwsA(
              isA<InvestecException>().having((e) => e.message, 'message', AppLocale.labels.integrationAccessDenied)));
      status = 429;
      await expectLater(
          client.getAccounts(credentials),
          throwsA(isA<InvestecException>()
              .having((e) => e.message, 'message', AppLocale.labels.integrationServiceError('Too many requests'))));
    });

    test('lists transactions of a period by the posting date', () async {
      final requests = <Uri>[];
      final client = InvestecClient(
        now: () => DateTime(2026, 11, 25),
        client: MockClient((request) async {
          if (request.url.path.contains('oauth2')) {
            return http.Response(jsonEncode({'access_token': 'T', 'expires_in': 1799}), 200);
          }
          requests.add(request.url);
          return data({
            'transactions': [
              transaction('KURUMAN FRESH PRODUCE', 53.6),
              transaction('SALARY', '25000', type: 'CREDIT'),
              transaction('PENDING CARD', 10, status: 'PENDING'),
            ],
          });
        }),
      );
      final result = await client.getTransactions(credentials, 'ACC-1', from: DateTime(2026, 11, 1));
      expect(requests.single.path, '/za/pb/v1/accounts/ACC-1/transactions');
      expect(requests.single.queryParameters,
          {'fromDate': '2026-11-01', 'toDate': '2026-11-25', 'includePending': 'true'});
      expect(result[0].signedAmount, -53.6);
      expect(result[0].date, DateTime(2026, 11, 19));
      expect(result[0].postingDate, DateTime(2026, 11, 20));
      expect(result[1].signedAmount, 25000);
      expect(result[2].pending, isTrue);
      expect(() => InvestecClient.parseAmount('n/a'), throwsA(isA<InvestecException>()));
    });
  });

  group('InvestecImporter', () {
    test('imports posted transactions once, telling equal ones apart', () {
      final added = <String, InterfaceAppData>{};
      final importer = InvestecImporter(exists: added.containsKey, add: (item, uuid) => added[uuid] = item);
      final transactions = [
        transaction('COFFEE', 30),
        transaction('COFFEE', 30),
        transaction('SALARY', 25000, type: 'CREDIT'),
        transaction('CARD', 10, uuid: 'U-1'),
        transaction('HOLD', 5, status: 'PENDING'),
      ].map(InvestecTransaction.fromJson).toList();
      runImport() => importer.run(
            accountId: 'ACC-1',
            currency: 'ZAR',
            transactions: transactions,
            account: 'A',
            category: 'C',
          );

      expect(runImport(), (added: 4, skipped: 0, pending: 1));
      final bills = added.values.whereType<BillAppData>().toList();
      expect(bills.where((e) => e.title == 'COFFEE').length, 2);
      expect(bills.first.details, 30);
      expect(bills.first.currency?.code, 'ZAR');
      expect(bills.first.createdAt, DateTime(2026, 11, 19));
      expect(added.values.whereType<InvoiceAppData>().single.details, 25000);
      expect(InvestecImporter.referenceOf(transactions[3]), 'U-1');

      expect(runImport(), (added: 0, skipped: 4, pending: 1));
    });
  });

  group('InvestecSettings', () {
    test('stores the links and the encrypted credentials', () async {
      final settings = InvestecSettings(sandbox: true)
        ..links['ACC-1'] = 'uuid'
        ..imported['ACC-1'] = DateTime(2026, 11, 20);
      await settings.save();
      final loaded = InvestecSettings.load();
      expect(loaded.sandbox, isTrue);
      expect(loaded.links, {'ACC-1': 'uuid'});
      expect(loaded.imported, {'ACC-1': DateTime(2026, 11, 20)});

      expect(InvestecSettings.loadCredentials(), isNull);
      await InvestecSettings.saveCredentials(credentials);
      expect(AppPreferences.get(AppPreferences.prefInvestecCredentials), isNot(contains('s3cret')));
      expect(InvestecSettings.loadCredentials(), credentials);
      await InvestecSettings.clearCredentials();
      expect(InvestecSettings.loadCredentials(), isNull);
    });
  });
}
