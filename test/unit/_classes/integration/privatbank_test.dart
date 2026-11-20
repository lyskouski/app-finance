// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/privatbank/privatbank_client.dart';
import 'package:app_finance/_classes/integration/privatbank/privatbank_importer.dart';
import 'package:app_finance/_classes/integration/privatbank/privatbank_settings.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

const iban = 'UA213052990000026007233566001';

Map<String, dynamic> transaction(String id, String type, String sum,
        {String status = 'r', String real = 'r', String counterparty = 'ТОВ Постачальник'}) =>
    {
      'ID': id,
      'AUT_MY_ACC': iban,
      'AUT_CNTR_NAM': counterparty,
      'CCY': 'UAH',
      'FL_REAL': real,
      'PR_PR': status,
      'OSND': 'Оплата за послуги',
      'SUM': sum,
      'TRANTYPE': type,
      'DAT_OD': '02.11.2026',
      'TIM_P': '10:15',
      'DATE_TIME_DAT_OD_TIM_P': '02.11.2026 10:15:30',
      'REF': 'REF$id',
      'REFN': '1',
    };

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppPreferences.pref = await SharedPreferences.getInstance();
  });

  group('PrivatBankClient', () {
    test('normalizes Ukrainian IBANs', () {
      expect(PrivatBankClient.normalizeIban(' ua21 3052 9900 0002 6007 2335 6600 1 '), iban);
      expect(PrivatBankClient.normalizeIban('DE02120300000000202051'), isNull);
      expect(PrivatBankClient.normalizeIban('UA2130529900000260072335660'), isNull);
    });

    test('checks the phase of the statements with the token header', () async {
      final sent = <http.Request>[];
      final client = PrivatBankClient(
        client: MockClient((request) async {
          sent.add(request);
          return http.Response(
            jsonEncode({
              'status': 'SUCCESS',
              'type': 'settings',
              'settings': {'phase': sent.length == 1 ? 'WRK' : 'PRE'},
            }),
            200,
          );
        }),
      );

      await client.ensureReady(' token ');
      expect(sent.single.url.toString(), 'https://acp.privatbank.ua/api/statements/settings');
      expect(sent.single.headers['token'], 'token');
      expect(sent.single.headers['User-Agent'], PrivatBankClient.userAgent);
      expect(
        () => client.ensureReady('token'),
        throwsA(isA<PrivatBankNotReadyException>().having((e) => e.phase, 'phase', 'PRE')),
      );
    });

    test('follows the pages of transactions', () async {
      final sent = <Uri>[];
      final client = PrivatBankClient(
        client: MockClient((request) async {
          sent.add(request.url);
          final isFirst = sent.length == 1;
          return http.Response.bytes(
            utf8.encode(jsonEncode({
              'status': 'SUCCESS',
              'type': 'transactions',
              'exist_next_page': isFirst,
              'next_page_id': isFirst ? 'page-2' : '',
              'transactions': [isFirst ? transaction('1', 'D', '120.50') : transaction('2', 'C', '1000')],
            })),
            200,
          );
        }),
      );

      final result =
          await client.getTransactions('token', iban: iban, start: DateTime(2026, 11, 1), end: DateTime(2026, 11, 20));

      expect(sent.length, 2);
      expect(sent.first.path, '/api/statements/transactions');
      expect(sent.first.queryParameters['acc'], iban);
      expect(sent.first.queryParameters['startDate'], '01-11-2026');
      expect(sent.first.queryParameters['endDate'], '20-11-2026');
      expect(sent.first.queryParameters.containsKey('followId'), isFalse);
      expect(sent.last.queryParameters['followId'], 'page-2');
      expect(result.map((e) => e.amount), [-120.5, 1000.0]);
      expect(result.first.title, 'ТОВ Постачальник');
      expect(result.first.date, DateTime(2026, 11, 2, 10, 15, 30));
    });

    test('reads the balance of an account', () async {
      final client = PrivatBankClient(
        client: MockClient((request) async {
          expect(request.url.path, '/api/statements/balance');
          return http.Response.bytes(
            utf8.encode(jsonEncode({
              'status': 'SUCCESS',
              'exist_next_page': false,
              'balances': [
                {'acc': iban, 'currency': 'UAH', 'balanceOut': '1500.00', 'nameACC': 'ФОП Іваненко'},
                {'acc': iban, 'currency': 'UAH', 'balanceOut': '1520.25', 'nameACC': 'ФОП Іваненко'},
              ],
            })),
            200,
          );
        }),
      );

      final balance = await client.getBalance('token', iban);
      expect(balance?.amount, 1520.25);
      expect(balance?.currency, 'UAH');
      expect(balance?.name, 'ФОП Іваненко');
    });

    test('reports errors of the service', () async {
      final client = PrivatBankClient(
        client: MockClient((_) async => http.Response(jsonEncode({'status': 'ERROR', 'message': 'Wrong acc'}), 400)),
      );
      final denied = PrivatBankClient(client: MockClient((_) async => http.Response('', 401)));

      expect(
        () => client.getBalance('token', iban),
        throwsA(isA<PrivatBankException>()
            .having((e) => e.message, 'message', AppLocale.labels.integrationServiceError('Wrong acc'))),
      );
      expect(
        () => denied.getPhase('token'),
        throwsA(
            isA<PrivatBankException>().having((e) => e.message, 'message', AppLocale.labels.integrationAccessDenied)),
      );
    });
  });

  group('PrivatBankImporter', () {
    final transactions = [
      transaction('1', 'D', '120.50'),
      transaction('2', 'C', '1000'),
      transaction('3', 'D', '10', status: 'p'),
      transaction('4', 'D', '15', status: 't'),
    ].map(PrivatBankTransaction.fromJson).toList();

    test('imports booked transactions once by their identifier', () {
      final store = <String, InterfaceAppData>{};
      final importer = PrivatBankImporter(exists: store.containsKey, add: (item, uuid) => store[uuid] = item);

      run() => importer.run(iban: iban, transactions: transactions, account: 'acc', category: 'bud');
      expect(run(), (added: 2, skipped: 0, pending: 1));
      expect(run(), (added: 0, skipped: 2, pending: 1));

      final bill = store[PrivatBankImporter.recordUuid(iban, '1')] as BillAppData;
      expect(bill.details, 120.5);
      expect(bill.currency?.code, 'UAH');
      expect(bill.title, 'ТОВ Постачальник');
      expect(store.values.whereType<InvoiceAppData>().single.details, 1000.0);
    });
  });

  group('PrivatBankSettings', () {
    test('keeps the token encrypted', () async {
      await PrivatBankSettings.saveToken('secret-token');

      expect(AppPreferences.get(AppPreferences.prefPrivatBankToken), isNot(contains('secret-token')));
      expect(PrivatBankSettings.loadToken(), 'secret-token');

      await PrivatBankSettings.clearToken();
      expect(PrivatBankSettings.loadToken(), isNull);
    });

    test('saves accounts, links and import dates', () async {
      await PrivatBankSettings(accounts: [iban], links: {iban: 'acc'}, imported: {iban: DateTime(2026, 11, 14)}).save();

      final loaded = PrivatBankSettings.load();
      expect(loaded.accounts, [iban]);
      expect(loaded.links, {iban: 'acc'});
      expect(loaded.imported, {iban: DateTime(2026, 11, 14)});
    });
  });
}
