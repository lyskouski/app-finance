// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/enablebanking/enablebanking_client.dart';
import 'package:app_finance/_classes/integration/enablebanking/enablebanking_importer.dart';
import 'package:app_finance/_classes/integration/enablebanking/enablebanking_settings.dart';
import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enablebanking_test_keys.dart';

final now = DateTime.utc(2026, 11, 14, 12);

Map<String, dynamic> jwtPart(String token, int index) =>
    jsonDecode(utf8.decode(base64Url.decode(base64.normalize(token.split('.')[index]))));

final transactionsPage1 = {
  'transactions': [
    {
      'entry_reference': 'E1',
      'transaction_amount': {'currency': 'EUR', 'amount': '12.50'},
      'credit_debit_indicator': 'DBIT',
      'status': 'BOOK',
      'booking_date': '2026-11-02',
      'creditor': {'name': 'Bakery'},
      'remittance_information': ['Bread'],
    },
    {
      'entry_reference': 'E2',
      'transaction_amount': {'currency': 'EUR', 'amount': '2500.00'},
      'credit_debit_indicator': 'CRDT',
      'status': 'BOOK',
      'booking_date': '2026-11-03',
      'debtor': {'name': 'Employer'},
      'remittance_information': ['Salary'],
    },
  ],
  'continuation_key': 'next',
};

final transactionsPage2 = {
  'transactions': [
    {
      'transaction_amount': {'currency': 'EUR', 'amount': '5.00'},
      'credit_debit_indicator': 'DBIT',
      'status': 'PDNG',
      'value_date': '2026-11-04',
    },
    {
      'transaction_amount': {'currency': 'EUR', 'amount': '3.20'},
      'credit_debit_indicator': 'DBIT',
      'status': 'BOOK',
      'booking_date': '2026-11-05',
      'remittance_information': ['Coffee'],
    },
  ],
  'continuation_key': null,
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppPreferences.pref = await SharedPreferences.getInstance();
  });

  group('EnableBankingClient', () {
    test('reads PKCS#8 and PKCS#1 keys, also without line breaks', () {
      expect(EnableBankingClient.parsePrivateKey(testPrivateKeyPkcs8), isA<RSAPrivateKey>());
      expect(EnableBankingClient.parsePrivateKey(testPrivateKeyPkcs1), isA<RSAPrivateKey>());
      expect(EnableBankingClient.parsePrivateKey(testPrivateKeyPkcs8.replaceAll('\n', ' ')), isA<RSAPrivateKey>());
    });

    test('restores line breaks of a key pasted in one line', () {
      final pasted = testPrivateKeyPkcs8.replaceAll('\n', ' ');

      expect(EnableBankingClient.normalizePrivateKey(pasted), testPrivateKeyPkcs8.trim());
    });

    test('refuses a public key', () {
      expect(
        () => EnableBankingClient.parsePrivateKey(testPublicKey),
        throwsA(isA<EnableBankingException>()
            .having((e) => e.message, 'message', AppLocale.labels.enableBankingKeyInvalid)),
      );
    });

    test('signs a JWT (RS256) for the application', () {
      final client = EnableBankingClient(applicationId: 'app-id', privateKey: testPrivateKeyPkcs8, now: () => now);
      final token = client.token();

      expect(jwtPart(token, 0), {'typ': 'JWT', 'alg': 'RS256', 'kid': 'app-id'});
      final iat = now.millisecondsSinceEpoch ~/ 1000;
      expect(jwtPart(token, 1), {
        'iss': 'enablebanking.com',
        'aud': 'api.enablebanking.com',
        'iat': iat,
        'exp': iat + 3600,
      });
      final parts = token.split('.');
      final publicKey = RSAKeyParser().parse(testPublicKey) as RSAPublicKey;
      final verifier = Signer(RSASigner(RSASignDigest.SHA256, publicKey: publicKey));
      expect(
        verifier.verify('${parts[0]}.${parts[1]}', Encrypted(base64Url.decode(base64.normalize(parts[2])))),
        isTrue,
      );
    });

    test('requires the pending state of links opening the application', () {
      String link(String query) => EnableBankingClient.extractCode('fingrom://integration/enablebanking?$query',
          state: 's1', requireState: true);
      final refused = throwsA(
        isA<EnableBankingException>().having((e) => e.message, 'message', AppLocale.labels.enableBankingStateMismatch),
      );

      expect(link('state=s1&code=abc'), 'abc');
      expect(() => link('code=abc'), refused);
      expect(() => link('state=&code=abc'), refused);
      expect(() => link('state=other&code=abc'), refused);
      expect(
        () => EnableBankingClient.extractCode('fingrom://integration/enablebanking?state=s1&code=abc',
            state: null, requireState: true),
        refused,
      );
      expect(
        () => link('error=access_denied'),
        throwsA(isA<EnableBankingException>()
            .having((e) => e.message, 'message', AppLocale.labels.integrationServiceError('access_denied'))),
      );
      // Entered manually: a code as is, or an address without state
      expect(EnableBankingClient.extractCode('abc', state: 's1'), 'abc');
      expect(EnableBankingClient.extractCode('https://example.com/cb?code=abc', state: 's1'), 'abc');
    });

    test('extracts the authorization code from the redirected address', () {
      expect(EnableBankingClient.extractCode('https://example.com/cb?state=s1&code=abc', state: 's1'), 'abc');
      expect(EnableBankingClient.extractCode(' abc '), 'abc');
      expect(
        () => EnableBankingClient.extractCode('https://example.com/cb?state=other&code=abc', state: 's1'),
        throwsA(isA<EnableBankingException>()
            .having((e) => e.message, 'message', AppLocale.labels.enableBankingStateMismatch)),
      );
      expect(
        () => EnableBankingClient.extractCode('https://example.com/cb?error=access_denied'),
        throwsA(isA<EnableBankingException>()
            .having((e) => e.message, 'message', AppLocale.labels.integrationServiceError('access_denied'))),
      );
      expect(() => EnableBankingClient.extractCode('https://example.com/cb'), throwsA(isA<EnableBankingException>()));
    });

    test('authorizes, opens a session and reads all pages of transactions', () async {
      final requests = <http.Request>[];
      final client = EnableBankingClient(
        applicationId: 'app-id',
        privateKey: testPrivateKeyPkcs8,
        now: () => now,
        client: MockClient((request) async {
          requests.add(request);
          final body = switch ((request.method, request.url.path)) {
            ('GET', '/aspsps') => {
                'aspsps': [
                  {'name': 'Nordea', 'country': 'FI', 'maximum_consent_validity': 15552000},
                ],
              },
            ('POST', '/auth') => {'url': 'https://bank.example.com/authorize?id=1', 'authorization_id': 'A1'},
            ('POST', '/sessions') => {
                'session_id': 'S1',
                'access': {'valid_until': '2027-02-12T12:00:00Z'},
                'accounts': [
                  {
                    'uid': 'U1',
                    'account_id': {'iban': 'FI2112345600000785'},
                    'name': 'Current',
                    'currency': 'EUR',
                  },
                ],
              },
            ('GET', '/accounts/U1/transactions') =>
              request.url.queryParameters['continuation_key'] == 'next' ? transactionsPage2 : transactionsPage1,
            _ => throw StateError('Unexpected ${request.method} ${request.url}'),
          };
          return http.Response(jsonEncode(body), 200);
        }),
      );

      final aspsp = (await client.getAspsps('fi')).single;
      expect(aspsp.maximumConsentValidity, const Duration(days: 180));
      expect(requests.last.url.queryParameters, {'country': 'FI', 'psu_type': 'personal'});
      expect(requests.last.headers['Authorization'], startsWith('Bearer '));

      final url = await client.startAuthorization(aspsp: aspsp, redirectUrl: 'https://example.com/cb', state: 's1');
      expect(url.host, 'bank.example.com');
      expect(jsonDecode(requests.last.body), {
        'access': {'valid_until': now.add(const Duration(days: 90)).toIso8601String()},
        'aspsp': {'name': 'Nordea', 'country': 'FI'},
        'state': 's1',
        'redirect_url': 'https://example.com/cb',
        'psu_type': 'personal',
      });

      final session = await client.createSession('abc');
      expect(jsonDecode(requests.last.body), {'code': 'abc'});
      expect(session.id, 'S1');
      expect(session.accounts.single.key, 'FI2112345600000785');

      final transactions = await client.getTransactions('U1', from: DateTime(2026, 11, 1));
      expect(requests.last.url.queryParameters, {'date_from': '2026-11-01', 'continuation_key': 'next'});
      expect(transactions.map((e) => e.amount), [-12.5, 2500.0, -5.0, -3.2]);
      expect(transactions.first.title, 'Bakery — Bread');
      expect(transactions[1].title, 'Employer — Salary');
      expect(transactions.map((e) => e.isBooked), [true, true, false, true]);
    });

    test('reports the error message of the API', () async {
      final client = EnableBankingClient(
        applicationId: 'app-id',
        privateKey: testPrivateKeyPkcs8,
        client: MockClient((_) async => http.Response(jsonEncode({'message': 'Invalid JWT'}), 401)),
      );

      expect(
        () => client.getAspsps('FI'),
        throwsA(isA<EnableBankingException>().having((e) => e.message, 'message', contains('Invalid JWT'))),
      );
    });
  });

  group('EnableBankingImporter', () {
    test('imports booked transactions once, leaving the rest out', () {
      final store = <String, InterfaceAppData>{};
      final importer = EnableBankingImporter(exists: store.containsKey, add: (item, uuid) => store[uuid] = item);
      final transactions = [
        ...(transactionsPage1['transactions'] as List).cast<Map<String, dynamic>>(),
        ...(transactionsPage2['transactions'] as List).cast<Map<String, dynamic>>(),
      ].map(EnableBankingTransaction.fromJson).toList();

      IntegrationImportResult run() => importer.run(
            accountKey: 'FI2112345600000785',
            transactions: transactions,
            account: 'acc',
            category: 'bud',
          );

      expect(run(), (added: 3, skipped: 0, pending: 1));
      expect(run(), (added: 0, skipped: 3, pending: 1));
      expect(store.values.whereType<BillAppData>().map((e) => e.details), [12.5, 3.2]);
      expect(store.values.whereType<InvoiceAppData>().single.title, 'Employer — Salary');
    });
  });

  group('EnableBankingSettings', () {
    test('takes the callback page next to the web build, else the deep link of the application', () {
      for (final (base, expected) in [
        ('https://tercad.com/app/finance/', 'https://tercad.com/app/finance/callback.html'),
        (
          'https://tercad.com/app/finance/index.html#/app/finance/integration',
          'https://tercad.com/app/finance/callback.html'
        ),
        ('https://lyskouski.github.io/app-finance/?lang=pl#/', 'https://lyskouski.github.io/app-finance/callback.html'),
        ('http://localhost:8080/', 'http://localhost:8080/callback.html'),
      ]) {
        expect(EnableBankingSettings.redirectUrlFor(Uri.parse(base)), expected, reason: base);
      }
      expect(EnableBankingSettings.redirectUrlFor(null), 'fingrom://integration/enablebanking');
      expect(EnableBankingSettings.redirectUrlFor(Uri.parse('file:///app/')), 'fingrom://integration/enablebanking');
    });

    test('keeps the private key and the session encrypted', () async {
      await EnableBankingSettings.saveKey(testPrivateKeyPkcs8);
      final session = EnableBankingSession(
        id: 'S1',
        validUntil: DateTime.now().add(const Duration(days: 1)),
        accounts: const [EnableBankingAccount(uid: 'U1', name: 'Current', iban: 'FI21')],
      );
      await EnableBankingSettings.saveSession(session);

      expect(AppPreferences.get(AppPreferences.prefEnableBankingKey), isNot(contains('PRIVATE KEY')));
      expect(AppPreferences.get(AppPreferences.prefEnableBankingSession), isNot(contains('S1')));
      expect(EnableBankingSettings.loadKey(), testPrivateKeyPkcs8.trim());
      expect(EnableBankingSettings.loadSession()?.accounts.single.key, 'FI21');
    });

    test('ignores an expired session', () async {
      await EnableBankingSettings.saveSession(
        EnableBankingSession(
            id: 'S1', validUntil: DateTime.now().subtract(const Duration(days: 1)), accounts: const []),
      );

      expect(EnableBankingSettings.loadSession(), isNull);
    });

    test('saves application details, links and import dates', () async {
      await EnableBankingSettings(
        applicationId: 'app-id',
        redirectUrl: 'https://example.com/cb',
        country: 'FI',
        aspsp: 'Nordea',
        links: {'FI21': 'acc'},
        imported: {'FI21': DateTime(2026, 11, 14)},
      ).save();

      final loaded = EnableBankingSettings.load();
      expect([loaded.applicationId, loaded.redirectUrl, loaded.country, loaded.aspsp],
          ['app-id', 'https://example.com/cb', 'FI', 'Nordea']);
      expect(loaded.links, {'FI21': 'acc'});
      expect(loaded.imported, {'FI21': DateTime(2026, 11, 14)});
    });
  });
}
