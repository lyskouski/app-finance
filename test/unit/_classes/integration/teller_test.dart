// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/deep_link/deep_link_handler.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/teller/teller_client.dart';
import 'package:app_finance/_classes/integration/teller/teller_http.dart';
import 'package:app_finance/_classes/integration/teller/teller_importer.dart';
import 'package:app_finance/_classes/integration/teller/teller_settings.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'teller_test_keys.dart';

const token = 'test_token_ky6igyqi3qxa4';

final accountJson = {
  'id': 'acc_1',
  'enrollment_id': 'enr_1',
  'name': 'Checking',
  'institution': {'id': 'security_cu', 'name': 'Security Credit Union'},
  'last_four': '7857',
  'currency': 'USD',
  'type': 'depository',
  'subtype': 'checking',
  'status': 'open',
};

Map<String, dynamic> transaction(String id, String amount, {String date = '2026-11-20', String status = 'posted'}) => {
      'id': id,
      'account_id': 'acc_1',
      'amount': amount,
      'date': date,
      'description': 'Item $id',
      'status': status,
      'type': 'card_payment',
      'running_balance': null,
      'details': {
        'processing_status': 'complete',
        'category': 'dining',
        'counterparty': {'name': 'Coffee Shop', 'type': 'organization'},
      },
    };

http.Response error(int status, String code, String message) => http.Response(
      jsonEncode({
        'error': {'code': code, 'message': message}
      }),
      status,
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppPreferences.pref = await SharedPreferences.getInstance();
  });

  group('TellerClient', () {
    test('lists accounts and balances with the access token as Basic user', () async {
      final requests = <http.BaseRequest>[];
      final client = TellerClient(
        client: MockClient((request) async {
          requests.add(request);
          if (request.url.path.endsWith('/balances')) {
            return http.Response(jsonEncode({'account_id': 'acc_1', 'ledger': '28575.02', 'available': null}), 200);
          }
          return http.Response(jsonEncode([accountJson]), 200);
        }),
      );
      final accounts = await client.getAccounts(token);
      expect(accounts.single.id, 'acc_1');
      expect(accounts.single.enrollmentId, 'enr_1');
      expect(accounts.single.institution, 'Security Credit Union');
      expect(accounts.single.lastFour, '7857');
      expect(accounts.single.isOpen, isTrue);
      expect(requests.single.url.toString(), 'https://api.teller.io/accounts');
      expect(requests.single.headers['Authorization'], 'Basic ${base64.encode(utf8.encode('$token:'))}');

      final balance = await client.getBalances(token, 'acc_1');
      expect(balance.ledger, 28575.02);
      expect(balance.available, isNull);
      expect(balance.amount, 28575.02);
    });

    test('pages transactions backward from the start date', () async {
      final requests = <Uri>[];
      final client = TellerClient(
        client: MockClient((request) async {
          requests.add(request.url);
          final fromId = request.url.queryParameters['from_id'];
          final page = fromId == null
              ? List.generate(TellerClient.pageSize, (i) => transaction('txn_$i', '-1.00'))
              : [transaction('txn_last', '5.00', status: 'pending')];
          return http.Response(jsonEncode(page), 200);
        }),
      );
      final result = await client.getTransactions(token, 'acc_1', from: DateTime(2026, 11, 1));
      expect(result.length, TellerClient.pageSize + 1);
      expect(requests.length, 2);
      expect(requests.first.path, '/accounts/acc_1/transactions');
      expect(requests.first.queryParameters, {'count': '${TellerClient.pageSize}', 'start_date': '2026-11-01'});
      expect(requests.last.queryParameters['from_id'], 'txn_${TellerClient.pageSize - 1}');
      expect(result.first.amount, -1.0);
      expect(result.first.date, DateTime(2026, 11, 20));
      expect(result.first.pending, isFalse);
      expect(result.last.pending, isTrue);
    });

    test('uses the counterparty without a description', () {
      final json = transaction('txn_1', '-3.10')..['description'] = ' ';
      expect(TellerTransaction.fromJson(json).description, 'Coffee Shop');
    });

    test('reports a disconnected enrollment', () async {
      final client = TellerClient(
        client: MockClient(
            (_) async => error(404, 'enrollment.disconnected.user_action.mfa_required', 'User MFA is required.')),
      );
      await expectLater(
        client.getAccounts(token),
        throwsA(isA<TellerException>()
            .having((e) => e.isDisconnected, 'isDisconnected', isTrue)
            .having((e) => e.statusCode, 'statusCode', 404)
            .having((e) => e.message, 'message', AppLocale.labels.tellerDisconnected)),
      );
    });

    test('reports a missing client certificate', () async {
      final client = TellerClient(
        client: MockClient((_) async =>
            error(400, 'bad_request', 'Missing certificate: Retry request using your Teller client certificate.')),
      );
      await expectLater(
        client.getAccounts(token),
        throwsA(isA<TellerException>().having((e) => e.message, 'message', AppLocale.labels.tellerMissingCertificate)),
      );
    });

    test('reports a revoked token and other errors', () async {
      var status = 403;
      final client = TellerClient(
        client: MockClient((_) async => status == 403
            ? error(403, 'forbidden', 'Invalid token')
            : status == 502
                ? error(502, 'bad_gateway', 'Institution unavailable')
                : http.Response('', status)),
      );
      await expectLater(
          client.getAccounts(token),
          throwsA(
              isA<TellerException>().having((e) => e.message, 'message', AppLocale.labels.integrationAccessDenied)));
      status = 502;
      await expectLater(
          client.getAccounts(token),
          throwsA(isA<TellerException>().having(
              (e) => e.message, 'message', AppLocale.labels.integrationServiceError('Institution unavailable'))));
      status = 500;
      await expectLater(
          client.getAccounts(token),
          throwsA(isA<TellerException>()
              .having((e) => e.message, 'message', AppLocale.labels.integrationHttpError('500'))));
    });

    test('revokes an enrollment', () async {
      final requests = <http.BaseRequest>[];
      final client = TellerClient(client: MockClient((request) async {
        requests.add(request);
        return http.Response('', 204);
      }));
      await client.deleteEnrollment(token);
      expect(requests.single.method, 'DELETE');
      expect(requests.single.url.path, '/accounts');
    });

    test('normalizes PEM blocks pasted into a single line', () {
      final flat = tellerTestCertificate.replaceAll('\n', ' ');
      expect(TellerClient.normalizeCertificate(flat), tellerTestCertificate.trimLeft());
      expect(TellerClient.normalizePrivateKey(tellerTestKey.replaceAll('\n', '')), tellerTestKey.trimLeft());
      expect(() => TellerClient.normalizeCertificate(tellerTestKey), throwsA(isA<TellerException>()));
      expect(() => TellerClient.normalizePrivateKey(tellerTestCertificate), throwsA(isA<TellerException>()));
    });

    test('creates a mutual TLS client from the certificate and the key', () {
      expect(isTellerCertificateSupported, isTrue);
      final client = createTellerHttpClient(
        certificate: TellerClient.normalizeCertificate(tellerTestCertificate),
        privateKey: TellerClient.normalizePrivateKey(tellerTestKey),
      );
      expect(client, isA<IOClient>());
      client.close();
      expect(
        () => createTellerHttpClient(certificate: tellerTestCertificate, privateKey: tellerTestCertificate),
        throwsA(anything),
      );
    });
  });

  group('TellerImporter', () {
    test('imports posted transactions once and skips pending ones', () {
      final added = <String, InterfaceAppData>{};
      final importer = TellerImporter(exists: added.containsKey, add: (item, uuid) => added[uuid] = item);
      final account = TellerAccount.fromJson(accountJson);
      final transactions = [
        TellerTransaction.fromJson(transaction('txn_1', '-12.50')),
        TellerTransaction.fromJson(transaction('txn_2', '2500.00')),
        TellerTransaction.fromJson(transaction('txn_3', '-5.00', status: 'pending')),
      ];
      final result = importer.run(
        source: account,
        transactions: transactions,
        account: 'A',
        category: 'C',
      );
      expect(result, (added: 2, skipped: 0, pending: 1));
      final bill = added[TellerImporter.uuidOf('acc_1', 'txn_1')] as BillAppData;
      expect(bill.details, 12.5);
      expect(bill.title, 'Item txn_1');
      expect(bill.currency?.code, 'USD');
      expect(bill.createdAt, DateTime(2026, 11, 20));
      expect(added[TellerImporter.uuidOf('acc_1', 'txn_2')], isA<InvoiceAppData>());

      final repeated = importer.run(source: account, transactions: transactions, account: 'A', category: 'C');
      expect(repeated, (added: 0, skipped: 2, pending: 1));
    });
  });

  group('TellerSettings', () {
    test('stores the configuration, encrypted credentials and enrollments', () async {
      final settings = TellerSettings(applicationId: 'app_1', environment: TellerEnvironment.development)
        ..links['acc_1'] = 'uuid'
        ..imported['acc_1'] = DateTime(2026, 11, 20);
      await settings.save();
      final loaded = TellerSettings.load();
      expect(loaded.applicationId, 'app_1');
      expect(loaded.environment, TellerEnvironment.development);
      expect(loaded.links, {'acc_1': 'uuid'});
      expect(loaded.imported, {'acc_1': DateTime(2026, 11, 20)});

      await TellerSettings.saveCertificate(tellerTestCertificate);
      await TellerSettings.saveKey(tellerTestKey);
      expect(AppPreferences.get(AppPreferences.prefTellerKey), isNot(contains('PRIVATE KEY')));
      expect(TellerSettings.loadCertificate(), tellerTestCertificate);
      expect(TellerSettings.loadKey(), tellerTestKey);
      await TellerSettings.clearCertificate();
      expect(TellerSettings.loadCertificate(), isNull);
      expect(TellerSettings.loadKey(), isNull);

      const enrollment = TellerEnrollment(id: 'enr_1', accessToken: token, institution: 'Bank');
      await TellerSettings.saveEnrollments([enrollment]);
      expect(AppPreferences.get(AppPreferences.prefTellerEnrollments), isNot(contains(token)));
      expect(TellerSettings.loadEnrollments().single.toJson(), enrollment.toJson());
      await TellerSettings.saveEnrollments([]);
      expect(TellerSettings.loadEnrollments(), isEmpty);
    });

    test('builds the address of the connection page', () {
      final settings = TellerSettings(applicationId: 'app_1');
      expect(
        settings.connectUrl().toString(),
        '${TellerSettings.defaultConnectPage}?app=app_1&env=sandbox',
      );
      settings
        ..connectPage = 'https://example.com/connect.html?lang=en'
        ..environment = TellerEnvironment.production;
      expect(
        settings.connectUrl(enrollmentId: 'enr_1').toString(),
        'https://example.com/connect.html?lang=en&app=app_1&env=production&enrollment=enr_1',
      );
    });

    test('reads enrollments from the deep link, its copy or a plain token', () {
      final link = Uri.parse('${TellerSettings.callbackUrl}?token=$token&enrollment=enr_1&institution=My+Bank');
      expect(DeepLinkHandler.isTellerCallback(link), isTrue);
      final enrollment = TellerEnrollment.fromLink(link)!;
      expect(enrollment.toJson(), {'id': 'enr_1', 'accessToken': token, 'institution': 'My Bank'});
      expect(TellerEnrollment.parse(' $link\n')!.id, 'enr_1');
      expect(TellerEnrollment.parse(token)!.accessToken, token);
      expect(TellerEnrollment.parse('  '), isNull);
      expect(TellerEnrollment.fromLink(Uri.parse(TellerSettings.callbackUrl)), isNull);
    });

    test('replaces a repaired enrollment', () {
      const first = TellerEnrollment(id: 'enr_1', accessToken: 'a');
      const second = TellerEnrollment(id: 'enr_2', accessToken: 'b');
      const repaired = TellerEnrollment(id: 'enr_1', accessToken: 'a', institution: 'Bank');
      final result = TellerSettings.merge([first, second], repaired);
      expect(result.map((e) => e.id), ['enr_2', 'enr_1']);
      expect(result.last.institution, 'Bank');
      expect(TellerSettings.merge([first], const TellerEnrollment(id: '', accessToken: 'c')).length, 2);
    });
  });
}
