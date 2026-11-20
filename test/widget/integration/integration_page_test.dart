// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/integration/enablebanking/enablebanking_client.dart';
import 'package:app_finance/_classes/integration/enablebanking/enablebanking_settings.dart';
import 'package:app_finance/_classes/integration/fints/fints_settings.dart';
import 'package:app_finance/_classes/integration/notification/notification_channel.dart';
import 'package:app_finance/_classes/integration/notification/notification_controller.dart';
import 'package:app_finance/_classes/integration/monobank/monobank_client.dart';
import 'package:app_finance/_classes/integration/monobank/monobank_importer.dart';
import 'package:app_finance/_classes/integration/monobank/monobank_settings.dart';
import 'package:app_finance/_classes/integration/notification/notification_parser.dart';
import 'package:app_finance/_classes/integration/notification/notification_settings.dart';
import 'package:app_finance/_classes/integration/privatbank/privatbank_client.dart';
import 'package:app_finance/_classes/integration/privatbank/privatbank_settings.dart';
import 'package:app_finance/_classes/integration/simplefin/simplefin_client.dart';
import 'package:app_finance/_classes/integration/simplefin/simplefin_settings.dart';
import 'package:app_finance/_classes/integration/wise/wise_client.dart';
import 'package:app_finance/_classes/integration/wise/wise_settings.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/pages/integration/widgets/enablebanking_widget.dart';
import 'package:app_finance/pages/integration/widgets/fints_widget.dart';
import 'package:app_finance/pages/integration/widgets/monobank_widget.dart';
import 'package:app_finance/pages/integration/widgets/notification_widget.dart';
import 'package:app_finance/pages/integration/widgets/privatbank_widget.dart';
import 'package:app_finance/pages/integration/widgets/simplefin_widget.dart';
import 'package:app_finance/pages/integration/widgets/wise_widget.dart';
import 'package:fints/fints.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../pump_main.dart';
import '../../pump_main.wrapper.dart';
import '../../unit/_classes/integration/enablebanking_test_keys.dart';

const _iban = 'DE02120300000000202051';

class FakeFinTsClient implements FinTsClient {
  final FinTsClientOptions options;
  final String pin;
  final calls = <String>[];
  bool closed = false;

  FakeFinTsClient(this.options, this.pin);

  final account = Account(bankCode: '12030000', iban: _iban, productName: 'Girokonto', currency: 'EUR');

  @override
  FinTsLoginRefusedException? get loginRefusal => null;

  @override
  String get state => '{"fake":true}';

  @override
  Future<List<Account>> getAccounts() async {
    calls.add('getAccounts');
    return [account];
  }

  @override
  Future<Balance> getBalance(Account account) async {
    calls.add('getBalance');
    return Balance(account: account, booked: Amount(123456, 2, 'EUR'), bookedAsOf: DateTime(2026, 11, 14));
  }

  @override
  Future<List<Transaction>> getTransactions(
    Account account, {
    DateTime? from,
    DateTime? to,
    TransactionFormat format = TransactionFormat.auto,
  }) async {
    calls.add('getTransactions');
    final answer = await options.tanCallback(TanChallenge.create(
      method: const TanMethod(securityFunction: '942', name: 'mobileTAN', maxTanLength: 6),
      reference: 'ref-1',
      message: 'Enter the TAN sent to your phone',
    ));
    if (answer is! EnteredTan || answer.tan != '123456') {
      throw const FinTsTanCancelledExceptionStub();
    }
    return [
      Transaction(
        valueDate: DateTime(2026, 11, 2),
        amount: Amount(-1250, 2, 'EUR'),
        counterpartyName: 'Bakery',
        purpose: 'Bread',
        endToEndId: 'E2E-1',
      ),
      Transaction(
        valueDate: DateTime(2026, 11, 3),
        amount: Amount(250000, 2, 'EUR'),
        counterpartyName: 'Employer',
        purpose: 'Salary',
        endToEndId: 'E2E-2',
      ),
      Transaction(
        status: TransactionStatus.pending,
        valueDate: DateTime(2026, 11, 4),
        amount: Amount(-500, 2, 'EUR'),
      ),
    ];
  }

  @override
  Future<void> close() async => closed = true;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class FinTsTanCancelledExceptionStub implements Exception {
  const FinTsTanCancelledExceptionStub();
}

Future<void> pumpFrames(WidgetTester tester) async {
  for (var i = 0; i < 10; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

void main() {
  testWidgets('Integrations follow Automation in the navigation', (WidgetTester tester) async {
    await PumpMain.init(tester);

    final routes = AppMenu.get().map((e) => e.route).toList();
    expect(routes.indexOf(AppRoute.integrationRoute), routes.indexOf(AppRoute.automationRoute) + 1);
  });

  testWidgets('Integration names expand into their sections', (WidgetTester tester) async {
    await PumpMain.init(tester);
    Navigator.of(tester.element(find.byType(Scaffold).first)).pushNamed(AppRoute.integrationRoute);
    await tester.pumpAndSettle();

    expect(find.text('Integrations'), findsWidgets);
    expect(find.text('Financial Transaction Services (FinTS 4.1)'), findsOneWidget);
    expect(find.text('SimpleFIN Bridge (US)'), findsOneWidget);
    expect(find.text('Enable Banking (EU)'), findsOneWidget);
    expect(find.text('Wise API (Global)'), findsOneWidget);
    expect(find.text('PrivatBank Autoclient (Ukraine)'), findsOneWidget);
    expect(find.text('Monobank Personal API (Ukraine)'), findsOneWidget);
    expect(find.text('Notifications Parser'), findsOneWidget);
    // Protocols are separated from the APIs of single institutions
    final divider = tester.getTopLeft(find.byKey(const ValueKey('integration_divider'))).dy;
    expect(tester.getTopLeft(find.byKey(const ValueKey('integration_enablebanking'))).dy, lessThan(divider));
    expect(tester.getTopLeft(find.byKey(const ValueKey('integration_wise'))).dy, greaterThan(divider));
    expect(tester.getTopLeft(find.byKey(const ValueKey('integration_privatbank'))).dy, greaterThan(divider));
    expect(tester.getTopLeft(find.byKey(const ValueKey('integration_monobank'))).dy, greaterThan(divider));
    expect(find.textContaining('Bank Code (BLZ)', findRichText: true), findsNothing);
    expect(find.textContaining('SimpleFIN Setup Token', findRichText: true), findsNothing);

    await tester.tap(find.text('SimpleFIN Bridge (US)'));
    await tester.pumpAndSettle();

    expect(find.textContaining('SimpleFIN Setup Token', findRichText: true), findsOneWidget);
    expect(find.byKey(const ValueKey('simplefin_connect')), findsOneWidget);

    await tester.tap(find.text('Financial Transaction Services (FinTS 4.1)'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Bank Code (BLZ)', findRichText: true), findsOneWidget);
    expect(find.byKey(const ValueKey('fints_connect')), findsOneWidget);
  });

  testWidgets('FinTS connects with a PIN, asks for a TAN and imports transactions', (WidgetTester tester) async {
    await PumpMain.init(tester);
    final memory = <String, String>{};
    final pref = AppPreferences.pref as WrapperMockSharedPreferences;
    pref.mockGetString = (key) => memory[key] ?? (key == AppPreferences.prefCurrency ? 'USD' : null);
    pref.mockSetString = (key, value) async {
      memory[key!] = value!;
      return true;
    };
    final state = Provider.of<AppData>(tester.element(find.byType(Scaffold).first), listen: false);
    final account = state.add(AccountAppData(
      title: 'Bank',
      type: AppAccountType.account.toString(),
      details: 0.0,
      hidden: false,
    )) as AccountAppData;
    final budget = state.add(BudgetAppData(title: 'Food', hidden: false)) as BudgetAppData;
    final bills = state.getList(AppDataType.bills, false).length;
    final invoices = state.getList(AppDataType.invoice, false).length;
    await FinTsSettings(
      url: 'https://fints.example-bank.de/fints',
      bankCode: '12030000',
      userId: 'alice',
      productId: 'PRODUCT',
      links: {_iban: account.uuid!},
    ).save();

    FakeFinTsClient? client;
    Navigator.of(tester.element(find.byType(Scaffold).first)).push(MaterialPageRoute(
      builder: (_) => Scaffold(
        body: SingleChildScrollView(
          child: FinTsWidget(
            isWeb: false,
            clientFactory: (settings, pin, options) => client = FakeFinTsClient(options, pin),
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.byKey(const ValueKey('fints_connect')));
    await tester.tap(find.byKey(const ValueKey('fints_connect')));
    await pumpFrames(tester);
    await tester.enterText(find.byKey(const ValueKey('fints_pin')), '1234');
    await tester.tap(find.descendant(of: find.byType(AlertDialog), matching: find.text('Connect')));
    await tester.pumpAndSettle();

    expect(client?.pin, '1234');
    expect(client?.calls, ['getAccounts', 'getBalance']);
    expect(find.text('Girokonto …2051'), findsOneWidget);
    expect(find.textContaining('1234.56 EUR'), findsOneWidget);

    final widgetState = tester.state<FinTsWidgetState>(find.byType(FinTsWidget));
    widgetState.accounts.single.category = budget.uuid;
    await tester.ensureVisible(find.text('Import Transactions'));
    await tester.tap(find.text('Import Transactions'));
    await pumpFrames(tester);

    expect(find.text('Enter the TAN sent to your phone'), findsOneWidget);
    await tester.enterText(find.byKey(const ValueKey('fints_tan')), '123456');
    await tester.tap(find.descendant(of: find.byType(AlertDialog), matching: find.text('OK')));
    await tester.pumpAndSettle();

    expect(find.text('Imported: 2, skipped as already present: 0, pending (not imported): 1'), findsOneWidget);
    expect(state.getList(AppDataType.bills, false).length, bills + 1);
    expect(state.getList(AppDataType.invoice, false).length, invoices + 1);
    final bill = state.getList(AppDataType.bills, false).whereType<BillAppData>().last;
    expect(bill.title, 'Bakery — Bread');
    expect(bill.account, account.uuid);
    expect(bill.category, budget.uuid);
    expect(state.getList(AppDataType.invoice, false).whereType<InvoiceAppData>().last.details, 2500.0);
    expect(FinTsSettings.load().imported.containsKey(_iban), isTrue);
    expect(FinTsSettings.loadState(), '{"fake":true}');

    // A second import of the same period adds nothing
    await tester.ensureVisible(find.text('Import Transactions'));
    await tester.tap(find.text('Import Transactions'));
    await pumpFrames(tester);
    await tester.enterText(find.byKey(const ValueKey('fints_tan')), '123456');
    await tester.tap(find.descendant(of: find.byType(AlertDialog), matching: find.text('OK')));
    await tester.pumpAndSettle();
    expect(find.text('Imported: 0, skipped as already present: 2, pending (not imported): 1'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const ValueKey('fints_disconnect')));
    await tester.tap(find.byKey(const ValueKey('fints_disconnect')));
    await tester.pumpAndSettle();
    expect(client?.closed, isTrue);
    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('SimpleFIN claims a Setup Token and imports transactions', (WidgetTester tester) async {
    await PumpMain.init(tester);
    final memory = <String, String>{};
    final pref = AppPreferences.pref as WrapperMockSharedPreferences;
    pref.mockGetString = (key) => memory[key] ?? (key == AppPreferences.prefCurrency ? 'USD' : null);
    pref.mockSetString = (key, value) async {
      memory[key!] = value!;
      return true;
    };
    pref.mockRemove = (key) async => memory.remove(key) != null;
    final state = Provider.of<AppData>(tester.element(find.byType(Scaffold).first), listen: false);
    final account = state.add(AccountAppData(
      title: 'Checking',
      type: AppAccountType.account.toString(),
      details: 0.0,
      hidden: false,
    )) as AccountAppData;
    final budget = state.add(BudgetAppData(title: 'Coffee', hidden: false)) as BudgetAppData;
    final bills = state.getList(AppDataType.bills, false).length;

    const accessUrl = 'https://user:secret@bridge.example.com/simplefin';
    final requests = <http.Request>[];
    final client = SimpleFinClient(
      client: MockClient((request) async {
        requests.add(request);
        if (request.method == 'POST') {
          return http.Response(accessUrl, 200);
        }
        final withTransactions = !request.url.queryParameters.containsKey('balances-only');
        return http.Response(
          jsonEncode({
            'errlist': [],
            'connections': [
              {'conn_id': 'C', 'name': 'My Bank', 'org_id': 'O', 'sfin_url': 'https://bridge.example.com/simplefin'},
            ],
            'accounts': [
              {
                'id': 'ACT-1',
                'name': 'Checking',
                'conn_id': 'C',
                'currency': 'USD',
                'balance': '100.25',
                'balance-date': 1763078400,
                if (withTransactions)
                  'transactions': [
                    {'id': 'T1', 'posted': 1762905600, 'amount': '-4.75', 'description': 'Coffee Shop'},
                    {'id': 'T2', 'posted': 0, 'amount': '-1.00', 'description': 'Hold', 'pending': true},
                  ],
              },
            ],
          }),
          200,
        );
      }),
    );

    Navigator.of(tester.element(find.byType(Scaffold).first)).push(MaterialPageRoute(
      builder: (_) => Scaffold(body: SingleChildScrollView(child: SimpleFinWidget(client: client))),
    ));
    await tester.pumpAndSettle();

    await tester.enterText(
        find.byType(TextField).first, base64.encode(utf8.encode('https://bridge.example.com/claim/x')));
    await tester.ensureVisible(find.byKey(const ValueKey('simplefin_connect')));
    await tester.tap(find.byKey(const ValueKey('simplefin_connect')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(requests.first.method, 'POST');
    expect(SimpleFinSettings.loadAccess(), Uri.parse(accessUrl));
    expect(find.text('My Bank — Checking'), findsOneWidget);
    expect(find.textContaining('100.25 USD'), findsOneWidget);

    final widgetState = tester.state<SimpleFinWidgetState>(find.byType(SimpleFinWidget));
    widgetState.accounts.single
      ..appAccount = account.uuid
      ..category = budget.uuid;
    await tester.ensureVisible(find.text('Import Transactions'));
    await tester.tap(find.text('Import Transactions'));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(find.text('Imported: 1, skipped as already present: 0, pending (not imported): 1'), findsOneWidget);
    expect(requests.last.headers['Authorization'], 'Basic ${base64.encode(utf8.encode('user:secret'))}');
    expect(state.getList(AppDataType.bills, false).length, bills + 1);
    expect(state.getList(AppDataType.bills, false).whereType<BillAppData>().last.title, 'Coffee Shop');
    expect(SimpleFinSettings.load().links, {'ACT-1': account.uuid});

    await tester.ensureVisible(find.text('Import Transactions'));
    await tester.tap(find.text('Import Transactions'));
    await pumpFrames(tester);
    await tester.pumpAndSettle();
    expect(find.text('Imported: 0, skipped as already present: 1, pending (not imported): 1'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const ValueKey('simplefin_forget')));
    await tester.tap(find.byKey(const ValueKey('simplefin_forget')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();
    expect(SimpleFinSettings.loadAccess(), isNull);
    expect(find.textContaining('SimpleFIN Setup Token', findRichText: true), findsOneWidget);
    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('PrivatBank connects with an Autoclient token and imports transactions by IBAN',
      (WidgetTester tester) async {
    await PumpMain.init(tester);
    final memory = <String, String>{};
    final pref = AppPreferences.pref as WrapperMockSharedPreferences;
    pref.mockGetString = (key) => memory[key] ?? (key == AppPreferences.prefCurrency ? 'UAH' : null);
    pref.mockSetString = (key, value) async {
      memory[key!] = value!;
      return true;
    };
    pref.mockRemove = (key) async => memory.remove(key) != null;
    final state = Provider.of<AppData>(tester.element(find.byType(Scaffold).first), listen: false);
    final account = state.add(AccountAppData(
      title: 'FOP UAH',
      type: AppAccountType.account.toString(),
      details: 0.0,
      hidden: false,
    )) as AccountAppData;
    final budget = state.add(BudgetAppData(title: 'Office', hidden: false)) as BudgetAppData;
    final bills = state.getList(AppDataType.bills, false).length;
    const iban = 'UA213052990000026007233566001';

    final requests = <http.Request>[];
    final client = PrivatBankClient(
      client: MockClient((request) async {
        requests.add(request);
        final body = switch (request.url.path) {
          '/api/statements/settings' => {
              'status': 'SUCCESS',
              'settings': {'phase': 'WRK'},
            },
          '/api/statements/balance' => {
              'status': 'SUCCESS',
              'exist_next_page': false,
              'balances': [
                {'acc': iban, 'currency': 'UAH', 'balanceOut': '1520.25', 'nameACC': 'FOP'},
              ],
            },
          '/api/statements/transactions' => {
              'status': 'SUCCESS',
              'exist_next_page': false,
              'transactions': [
                {
                  'ID': 'T-1',
                  'AUT_CNTR_NAM': 'Hosting',
                  'CCY': 'UAH',
                  'FL_REAL': 'r',
                  'PR_PR': 'r',
                  'SUM': '250.00',
                  'TRANTYPE': 'D',
                  'DATE_TIME_DAT_OD_TIM_P': '02.11.2026 10:15:00',
                },
              ],
            },
          _ => throw StateError('Unexpected ${request.url}'),
        };
        return http.Response(jsonEncode(body), 200);
      }),
    );

    Navigator.of(tester.element(find.byType(Scaffold).first)).push(MaterialPageRoute(
      builder: (_) => Scaffold(body: SingleChildScrollView(child: PrivatBankWidget(client: client))),
    ));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).first, 'autoclient-token');
    await tester.ensureVisible(find.byKey(const ValueKey('privatbank_connect')));
    await tester.tap(find.byKey(const ValueKey('privatbank_connect')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(requests.first.headers['token'], 'autoclient-token');
    expect(PrivatBankSettings.loadToken(), 'autoclient-token');

    await tester.enterText(find.byType(TextField).last, 'UA21 3052 9900 0002 6007 2335 6600 1');
    await tester.ensureVisible(find.byKey(const ValueKey('privatbank_add')));
    await tester.tap(find.byKey(const ValueKey('privatbank_add')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(PrivatBankSettings.load().accounts, [iban]);
    expect(find.textContaining('1520.25 UAH'), findsOneWidget);

    final widgetState = tester.state<PrivatBankWidgetState>(find.byType(PrivatBankWidget));
    widgetState.accounts.single
      ..appAccount = account.uuid
      ..category = budget.uuid;
    await tester.ensureVisible(find.text('Import Transactions'));
    await tester.tap(find.text('Import Transactions'));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(find.text('Imported: 1, skipped as already present: 0, pending (not imported): 0'), findsOneWidget);
    expect(state.getList(AppDataType.bills, false).length, bills + 1);
    expect(state.getList(AppDataType.bills, false).whereType<BillAppData>().last.title, 'Hosting');
    expect(PrivatBankSettings.load().links, {iban: account.uuid});

    await tester.ensureVisible(find.byKey(const ValueKey('privatbank_forget')));
    await tester.tap(find.byKey(const ValueKey('privatbank_forget')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();
    expect(PrivatBankSettings.loadToken(), isNull);
    expect(find.byKey(const ValueKey('privatbank_steps')), findsOneWidget);
    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('Monobank connects with a personal token, creates an account and imports by windows',
      (WidgetTester tester) async {
    await PumpMain.init(tester);
    final memory = <String, String>{};
    final pref = AppPreferences.pref as WrapperMockSharedPreferences;
    pref.mockGetString = (key) => memory[key] ?? (key == AppPreferences.prefCurrency ? 'UAH' : null);
    pref.mockSetString = (key, value) async {
      memory[key!] = value!;
      return true;
    };
    pref.mockRemove = (key) async => memory.remove(key) != null;
    final state = Provider.of<AppData>(tester.element(find.byType(Scaffold).first), listen: false);
    final budget = state.add(BudgetAppData(title: 'Groceries', hidden: false)) as BudgetAppData;
    final bills = state.getList(AppDataType.bills, false).length;
    final accounts = state.getList(AppDataType.accounts, false).length;
    final now = DateTime.now();

    final requests = <http.Request>[];
    final waits = <Duration>[];
    final client = MonobankClient(
      wait: (duration) async => waits.add(duration),
      client: MockClient((request) async {
        requests.add(request);
        final path = request.url.path;
        final body = path == '/personal/client-info'
            ? {
                'name': 'Client',
                'accounts': [
                  {
                    'id': 'card',
                    'balance': 152025,
                    'creditLimit': 0,
                    'type': 'black',
                    'currencyCode': 980,
                    'maskedPan': ['537541******1234'],
                    'iban': 'UA733220010000026201234567890',
                  },
                ],
                'jars': [],
              }
            : path.startsWith('/personal/statement/card/')
                ? [
                    if (requests.where((e) => e.url.path.startsWith('/personal/statement/')).length == 1)
                      {
                        'id': 'T-1',
                        'time': now.subtract(const Duration(days: 40)).millisecondsSinceEpoch ~/ 1000,
                        'description': 'Market',
                        'mcc': 5411,
                        'hold': false,
                        'amount': -25000,
                        'operationAmount': -25000,
                        'currencyCode': 980,
                      },
                  ]
                : throw StateError('Unexpected ${request.url}');
        return http.Response.bytes(utf8.encode(jsonEncode(body)), 200);
      }),
    );

    Navigator.of(tester.element(find.byType(Scaffold).first)).push(MaterialPageRoute(
      builder: (_) => Scaffold(body: SingleChildScrollView(child: MonobankWidget(client: client))),
    ));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('monobank_steps')), findsOneWidget);
    await tester.enterText(find.byType(TextField).first, 'personal-token');
    await tester.ensureVisible(find.byKey(const ValueKey('monobank_connect')));
    await tester.tap(find.byKey(const ValueKey('monobank_connect')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(requests.first.headers['X-Token'], 'personal-token');
    expect(MonobankSettings.loadToken(), 'personal-token');
    expect(find.text('Black — 537541******1234 — UAH'), findsOneWidget);
    expect(find.textContaining('1520.25 UAH'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const ValueKey('monobank_create_card')));
    await tester.tap(find.byKey(const ValueKey('monobank_create_card')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(state.getList(AppDataType.accounts, false).length, accounts + 1);
    final widgetState = tester.state<MonobankWidgetState>(find.byType(MonobankWidget));
    final item = widgetState.accounts.single;
    final created = state.getByUuid(item.appAccount!) as AccountAppData;
    expect(created.details, 1520.25);
    expect(created.currency?.code, 'UAH');
    expect(MonobankSettings.load().links, {'card': created.uuid});
    expect(find.byKey(const ValueKey('monobank_create_card')), findsNothing);

    item
      ..category = budget.uuid
      ..from = now.subtract(const Duration(days: 45));
    await tester.ensureVisible(find.text('Import Transactions'));
    await tester.tap(find.text('Import Transactions'));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    // 45 days are requested by two windows with a pause between them
    expect(requests.where((e) => e.url.path.startsWith('/personal/statement/card/')).length, 2);
    expect(waits.length, 1);
    expect(find.text('Imported: 1, skipped as already present: 0, pending (not imported): 0'), findsOneWidget);
    expect(state.getList(AppDataType.bills, false).length, bills + 1);
    final bill = state.getByUuid(MonobankImporter.recordUuid('card', 'T-1')) as BillAppData;
    expect(bill.title, 'Market');
    expect(bill.details, 250.0);
    expect(MonobankSettings.load().records, {bill.uuid: 5411});
    expect(MonobankSettings.load().imported['card'], DateTime(now.year, now.month, now.day));

    await tester.ensureVisible(find.byKey(const ValueKey('monobank_forget')));
    await tester.tap(find.byKey(const ValueKey('monobank_forget')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();
    expect(MonobankSettings.loadToken(), isNull);
    expect(find.byKey(const ValueKey('monobank_steps')), findsOneWidget);
    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('Wise connects with a Personal API Token and imports transactions', (WidgetTester tester) async {
    await PumpMain.init(tester);
    final memory = <String, String>{};
    final pref = AppPreferences.pref as WrapperMockSharedPreferences;
    pref.mockGetString = (key) => memory[key] ?? (key == AppPreferences.prefCurrency ? 'USD' : null);
    pref.mockSetString = (key, value) async {
      memory[key!] = value!;
      return true;
    };
    pref.mockRemove = (key) async => memory.remove(key) != null;
    final state = Provider.of<AppData>(tester.element(find.byType(Scaffold).first), listen: false);
    final account = state.add(AccountAppData(
      title: 'Wise EUR',
      type: AppAccountType.account.toString(),
      details: 0.0,
      hidden: false,
    )) as AccountAppData;
    final budget = state.add(BudgetAppData(title: 'Travel', hidden: false)) as BudgetAppData;
    final bills = state.getList(AppDataType.bills, false).length;

    final requests = <http.Request>[];
    final client = WiseClient(
      client: MockClient((request) async {
        requests.add(request);
        final body = switch (request.url.path) {
          '/v2/profiles' => [
              {'id': 7, 'type': 'PERSONAL', 'fullName': 'Jane Doe'},
            ],
          '/v4/profiles/7/balances' => [
              {
                'id': 100,
                'currency': 'EUR',
                'amount': {'value': 42.5, 'currency': 'EUR'},
              },
            ],
          '/v1/profiles/7/balance-statements/100/statement.json' => {
              'transactions': [
                {
                  'type': 'DEBIT',
                  'date': '2026-11-02T08:00:00Z',
                  'amount': {'value': -7.5, 'currency': 'EUR'},
                  'details': {
                    'type': 'CARD',
                    'description': 'Card',
                    'merchant': {'name': 'Museum'}
                  },
                  'referenceNumber': 'CARD-1',
                },
              ],
            },
          _ => throw StateError('Unexpected ${request.url}'),
        };
        return http.Response(jsonEncode(body), 200);
      }),
    );

    Navigator.of(tester.element(find.byType(Scaffold).first)).push(MaterialPageRoute(
      builder: (_) => Scaffold(body: SingleChildScrollView(child: WiseWidget(client: client))),
    ));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).first, 'personal-token');
    await tester.ensureVisible(find.byKey(const ValueKey('wise_connect')));
    await tester.tap(find.byKey(const ValueKey('wise_connect')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(requests.first.headers['Authorization'], 'Bearer personal-token');
    expect(WiseSettings.loadToken(), 'personal-token');
    expect(WiseSettings.load().profile, 7);
    expect(find.textContaining('42.5 EUR'), findsOneWidget);

    final widgetState = tester.state<WiseWidgetState>(find.byType(WiseWidget));
    widgetState.accounts.single
      ..appAccount = account.uuid
      ..category = budget.uuid;
    await tester.ensureVisible(find.text('Import Transactions'));
    await tester.tap(find.text('Import Transactions'));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(find.text('Imported: 1, skipped as already present: 0, pending (not imported): 0'), findsOneWidget);
    expect(state.getList(AppDataType.bills, false).length, bills + 1);
    expect(state.getList(AppDataType.bills, false).whereType<BillAppData>().last.title, 'Museum');
    expect(WiseSettings.load().links, {'100': account.uuid});

    await tester.ensureVisible(find.text('Import Transactions'));
    await tester.tap(find.text('Import Transactions'));
    await pumpFrames(tester);
    await tester.pumpAndSettle();
    expect(find.text('Imported: 0, skipped as already present: 1, pending (not imported): 0'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const ValueKey('wise_forget')));
    await tester.tap(find.byKey(const ValueKey('wise_forget')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();
    expect(WiseSettings.loadToken(), isNull);
    expect(find.textContaining('Personal API Tokenrequired', findRichText: true), findsOneWidget);
    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('Enable Banking authorizes at the bank and imports transactions', (WidgetTester tester) async {
    await PumpMain.init(tester);
    final memory = <String, String>{};
    final pref = AppPreferences.pref as WrapperMockSharedPreferences;
    pref.mockGetString = (key) => memory[key] ?? (key == AppPreferences.prefCurrency ? 'USD' : null);
    pref.mockSetString = (key, value) async {
      memory[key!] = value!;
      return true;
    };
    pref.mockRemove = (key) async => memory.remove(key) != null;
    final state = Provider.of<AppData>(tester.element(find.byType(Scaffold).first), listen: false);
    final account = state.add(AccountAppData(
      title: 'Current',
      type: AppAccountType.account.toString(),
      details: 0.0,
      hidden: false,
    )) as AccountAppData;
    final budget = state.add(BudgetAppData(title: 'Food', hidden: false)) as BudgetAppData;
    final bills = state.getList(AppDataType.bills, false).length;
    final invoices = state.getList(AppDataType.invoice, false).length;

    final requests = <http.Request>[];
    final launched = <Uri>[];
    String? authState;
    final client = MockClient((request) async {
      requests.add(request);
      final body = switch ((request.method, request.url.path)) {
        ('GET', '/aspsps') => {
            'aspsps': [
              {'name': 'Nordea', 'country': 'FI'},
            ],
          },
        ('POST', '/auth') => () {
            authState = jsonDecode(request.body)['state'];
            return {'url': 'https://bank.example.com/authorize', 'authorization_id': 'A1'};
          }(),
        ('POST', '/sessions') => {
            'session_id': 'S1',
            'access': {'valid_until': DateTime.now().add(const Duration(days: 90)).toUtc().toIso8601String()},
            'accounts': [
              {
                'uid': 'U1',
                'account_id': {'iban': 'FI2112345600000785'},
                'name': 'Current',
                'currency': 'EUR',
              },
            ],
          },
        ('GET', '/accounts/U1/balances') => {
            'balances': [
              {
                'name': 'Booked',
                'balance_amount': {'currency': 'EUR', 'amount': '321.09'},
                'balance_type': 'CLBD',
              },
            ],
          },
        ('GET', '/accounts/U1/transactions') => {
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
                'transaction_amount': {'currency': 'EUR', 'amount': '100.00'},
                'credit_debit_indicator': 'CRDT',
                'status': 'BOOK',
                'booking_date': '2026-11-03',
                'debtor': {'name': 'Friend'},
              },
              {
                'transaction_amount': {'currency': 'EUR', 'amount': '5.00'},
                'credit_debit_indicator': 'DBIT',
                'status': 'PDNG',
                'value_date': '2026-11-04',
              },
            ],
          },
        ('DELETE', '/sessions/S1') => {'message': 'OK'},
        _ => throw StateError('Unexpected ${request.method} ${request.url}'),
      };
      return http.Response(jsonEncode(body), 200);
    });

    Navigator.of(tester.element(find.byType(Scaffold).first)).push(MaterialPageRoute(
      builder: (_) => Scaffold(
        body: SingleChildScrollView(
          child: EnableBankingWidget(httpClient: client, launcher: (url) async => launched.add(url)),
        ),
      ),
    ));
    await tester.pumpAndSettle();

    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'app-id');
    await tester.enterText(fields.at(1), testPrivateKeyPkcs8);
    await tester.enterText(fields.at(2), 'https://example.com/callback');
    await tester.enterText(fields.at(3), 'fi');
    await tester.ensureVisible(find.byKey(const ValueKey('enablebanking_banks')));
    await tester.tap(find.byKey(const ValueKey('enablebanking_banks')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    final widgetState = tester.state<EnableBankingWidgetState>(find.byType(EnableBankingWidget));
    expect(widgetState.error, isNull);
    expect(widgetState.aspsps.single.name, 'Nordea');
    expect(EnableBankingSettings.loadKey(), EnableBankingClient.normalizePrivateKey(testPrivateKeyPkcs8));
    expect(EnableBankingSettings.load().country, 'FI');
    widgetState.settings.aspsp = 'Nordea';

    await tester.ensureVisible(find.byKey(const ValueKey('enablebanking_connect')));
    await tester.tap(find.byKey(const ValueKey('enablebanking_connect')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(launched, [Uri.parse('https://bank.example.com/authorize')]);
    expect(requests.last.headers['Authorization'], startsWith('Bearer '));
    final redirected = 'https://example.com/callback?state=$authState&code=C1';
    await tester.enterText(find.byType(TextField).last, redirected);
    await tester.ensureVisible(find.byKey(const ValueKey('enablebanking_connect')));
    await tester.tap(find.byKey(const ValueKey('enablebanking_connect')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(widgetState.error, isNull);
    expect(jsonDecode(requests.firstWhere((e) => e.url.path == '/sessions').body), {'code': 'C1'});
    expect(EnableBankingSettings.loadSession()?.id, 'S1');
    expect(find.text('Current …0785'), findsOneWidget);
    expect(find.textContaining('321.09 EUR'), findsOneWidget);

    widgetState.accounts.single
      ..appAccount = account.uuid
      ..category = budget.uuid;
    await tester.ensureVisible(find.text('Import Transactions'));
    await tester.tap(find.text('Import Transactions'));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(find.text('Imported: 2, skipped as already present: 0, pending (not imported): 1'), findsOneWidget);
    expect(state.getList(AppDataType.bills, false).length, bills + 1);
    expect(state.getList(AppDataType.invoice, false).length, invoices + 1);
    expect(state.getList(AppDataType.bills, false).whereType<BillAppData>().last.title, 'Bakery — Bread');
    expect(EnableBankingSettings.load().links, {'FI2112345600000785': account.uuid});

    await tester.ensureVisible(find.text('Import Transactions'));
    await tester.tap(find.text('Import Transactions'));
    await pumpFrames(tester);
    await tester.pumpAndSettle();
    expect(find.text('Imported: 0, skipped as already present: 2, pending (not imported): 1'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const ValueKey('enablebanking_forget')));
    await tester.tap(find.byKey(const ValueKey('enablebanking_forget')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();
    expect(requests.last.method, 'DELETE');
    expect(EnableBankingSettings.loadSession(), isNull);
    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('Notifications Parser reads notifications of selected apps and imports them',
      (WidgetTester tester) async {
    await PumpMain.init(tester);
    final memory = <String, String>{};
    final pref = AppPreferences.pref as WrapperMockSharedPreferences;
    pref.mockGetString = (key) => memory[key] ?? (key == AppPreferences.prefCurrency ? 'USD' : null);
    pref.mockSetString = (key, value) async {
      memory[key!] = value!;
      return true;
    };
    final state = Provider.of<AppData>(tester.element(find.byType(Scaffold).first), listen: false);
    final account = state.add(AccountAppData(
      title: 'Card',
      type: AppAccountType.account.toString(),
      details: 0.0,
      hidden: false,
    )) as AccountAppData;
    state.add(BudgetAppData(title: 'Food', hidden: false));
    final bills = state.getList(AppDataType.bills, false).length;

    var isGranted = false;
    var packages = <String>[];
    var notifications = [
      {'id': 'n1', 'package': 'com.bank', 'title': 'Bank', 'text': 'Paid 12.50 EUR at Bakery', 'time': 1794787200000},
      {'id': 'n2', 'package': 'com.bank', 'title': 'Bank', 'text': 'Your code is 4455', 'time': 1794787300000},
    ];
    final calls = <String>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(NotificationChannel.channel, (call) async {
      calls.add(call.method);
      final args = call.arguments as Map?;
      switch (call.method) {
        case 'isGranted':
          return isGranted;
        case 'getApps':
          return {'com.bank': 'My Bank', 'com.chat': 'Chat'};
        case 'getPackages':
          return packages;
        case 'setPackages':
          packages = List<String>.from(args!['packages']);
          return null;
        case 'getNotifications':
          return notifications.where((e) => packages.contains(e['package'])).toList();
        case 'removeNotifications':
          final ids = List<String>.from(args!['ids']);
          notifications = notifications.where((e) => !ids.contains(e['id'])).toList();
          return null;
      }
      return null;
    });
    addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(NotificationChannel.channel, null));

    Navigator.of(tester.element(find.byType(Scaffold).first)).push(MaterialPageRoute(
      builder: (_) => const Scaffold(body: SingleChildScrollView(child: NotificationWidget())),
    ));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('notification_steps')), findsOneWidget);
    await tester.ensureVisible(find.byKey(const ValueKey('notification_grant')));
    await tester.tap(find.byKey(const ValueKey('notification_grant')));
    await pumpFrames(tester);
    expect(calls, contains('openSettings'));

    // The access is granted in the system settings
    isGranted = true;
    for (final state in [
      AppLifecycleState.inactive,
      AppLifecycleState.hidden,
      AppLifecycleState.paused,
      AppLifecycleState.hidden,
      AppLifecycleState.inactive,
      AppLifecycleState.resumed,
    ]) {
      tester.binding.handleAppLifecycleStateChanged(state);
    }
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('notification_steps')), findsNothing);
    expect(find.text('My Bank'), findsOneWidget);
    expect(find.text('Chat'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('notification_app_com.bank')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(packages, ['com.bank']);
    expect(find.text('Captured notifications: 2'), findsOneWidget);
    expect(find.textContaining('-12.5 EUR — Bakery'), findsOneWidget);
    expect(find.text('Not recognized'), findsOneWidget);

    // Parsing options are shared by all apps and shown before them
    final income = find.byKey(const ValueKey('notification_income'));
    expect(tester.getTopLeft(income).dy, lessThan(tester.getTopLeft(find.text('My Bank').first).dy));
    await tester.enterText(find.descendant(of: income, matching: find.byType(TextField)), 'Paid');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await pumpFrames(tester);
    expect(find.textContaining('12.5 EUR — Bakery'), findsOneWidget);
    expect(find.textContaining('-12.5 EUR — Bakery'), findsNothing);
    expect(NotificationSettings.load().income, contains('paid'));
    await tester.tap(find.descendant(of: find.byKey(const ValueKey('tag_paid')), matching: find.byIcon(Icons.close)));
    await pumpFrames(tester);
    expect(find.textContaining('-12.5 EUR — Bakery'), findsOneWidget);
    expect(NotificationSettings.load().income, NotificationParser.incomeKeywords);

    // The account is recognized by its keywords, otherwise the default one is taken
    expect(find.textContaining('Default Account', findRichText: true), findsWidgets);
    expect(find.byKey(const ValueKey('notification_currency_com.bank')), findsOneWidget);
    final cardKeywords = find.byKey(ValueKey('notification_account_${account.uuid}'));
    await tester.ensureVisible(cardKeywords);
    await tester.enterText(find.descendant(of: cardKeywords, matching: find.byType(TextField)), 'Bakery');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await pumpFrames(tester);
    expect(find.textContaining('-12.5 EUR — Bakery → Card'), findsOneWidget);
    expect(NotificationSettings.load().accounts[account.uuid], ['bakery']);

    // Neither the period nor the manual import: recognized notifications are imported automatically
    expect(find.text('Import Transactions'), findsNothing);
    expect(state.getList(AppDataType.bills, false).length, bills);

    await tester.ensureVisible(find.text('Clear Captured'));
    await tester.tap(find.text('Clear Captured'));
    await pumpFrames(tester);
    await tester.pumpAndSettle();
    expect(notifications, isEmpty);
    expect(find.text('Captured notifications: 0'), findsOneWidget);
    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('Notifications Parser imports recognized notifications automatically', (WidgetTester tester) async {
    await PumpMain.init(tester);
    final memory = <String, String>{};
    final pref = AppPreferences.pref as WrapperMockSharedPreferences;
    pref.mockGetString = (key) => memory[key] ?? (key == AppPreferences.prefCurrency ? 'USD' : null);
    pref.mockSetString = (key, value) async {
      memory[key!] = value!;
      return true;
    };
    final state = Provider.of<AppData>(tester.element(find.byType(Scaffold).first), listen: false);
    final account = state.add(AccountAppData(
      title: 'Card',
      type: AppAccountType.account.toString(),
      details: 0.0,
      hidden: false,
    )) as AccountAppData;
    final budget = state.add(BudgetAppData(title: 'Food', hidden: false)) as BudgetAppData;
    final bills = state.getList(AppDataType.bills, false).length;

    var notifications = [
      {'id': 'n1', 'package': 'com.bank', 'title': 'Bank', 'text': 'Paid 12.50 EUR at Bakery', 'time': 1794787200000},
      {'id': 'n2', 'package': 'com.bank', 'title': 'Bank', 'text': 'Your code is 4455', 'time': 1794787300000},
    ];
    var autoPackages = <String>[];
    final messenger = tester.binding.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(NotificationChannel.channel, (call) async {
      final args = call.arguments as Map?;
      switch (call.method) {
        case 'setAutoPackages':
          autoPackages = List<String>.from(args!['packages']);
          return null;
        case 'isGranted':
          return true;
        case 'getApps':
          return {'com.bank': 'My Bank'};
        case 'getPackages':
          return ['com.bank'];
        case 'getNotifications':
          return notifications;
        case 'removeNotifications':
          final ids = List<String>.from(args!['ids']);
          notifications = notifications.where((e) => !ids.contains(e['id'])).toList();
          return null;
      }
      return null;
    });
    final controller = NotificationController();
    NotificationController.instance = controller;
    addTearDown(() {
      controller.detach();
      NotificationController.instance = null;
      messenger.setMockMethodCallHandler(NotificationChannel.channel, null);
    });

    Navigator.of(tester.element(find.byType(Scaffold).first)).push(MaterialPageRoute(
      builder: (_) => const Scaffold(body: SingleChildScrollView(child: NotificationWidget())),
    ));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    // Nothing is imported until the app is linked to an account and a category
    expect(state.getList(AppDataType.bills, false).length, bills);
    expect(autoPackages, isEmpty);
    expect(find.byKey(const ValueKey('notification_auto_com.bank')), findsNothing);

    final widgetState = tester.state<NotificationWidgetState>(find.byType(NotificationWidget));
    widgetState.sources['com.bank']!
      ..appAccount = account.uuid
      ..category = budget.uuid;
    await widgetState.persist('com.bank');
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    // Already captured notifications are imported right away, an unrecognized one is kept
    final link = NotificationSettings.load().apps['com.bank']!;
    expect((link.account, link.category), (account.uuid, budget.uuid));
    // The background instance is started by the Android service only for these applications
    expect(autoPackages, ['com.bank']);
    expect(find.text('Added from notifications: 1'), findsOneWidget);
    expect(state.getList(AppDataType.bills, false).length, bills + 1);
    expect(notifications.map((e) => e['id']), ['n2']);
    expect(find.text('Captured notifications: 1'), findsOneWidget);

    // A notification captured while the application is running
    notifications = [
      ...notifications,
      {'id': 'n3', 'package': 'com.bank', 'title': 'Bank', 'text': 'Paid 4 EUR at Kiosk', 'time': 1794787400000},
    ];
    await messenger.handlePlatformMessage(
      NotificationChannel.channel.name,
      NotificationChannel.channel.codec.encodeMethodCall(const MethodCall('onCaptured')),
      (_) {},
    );
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(state.getList(AppDataType.bills, false).length, bills + 2);
    expect(state.getList(AppDataType.bills, false).whereType<BillAppData>().map((e) => e.title), contains('Kiosk'));
    expect(notifications.map((e) => e['id']), ['n2']);

    // Repeated runs do not duplicate transactions
    await controller.run();
    expect(state.getList(AppDataType.bills, false).length, bills + 2);
    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('Notifications Parser imports in the background instance', (WidgetTester tester) async {
    await PumpMain.init(tester);
    final memory = <String, String>{
      AppPreferences.prefNotification: '{"apps":{"com.bank":{"account":"acc","category":"cat"}}}',
    };
    final pref = AppPreferences.pref as WrapperMockSharedPreferences;
    pref.mockGetString = (key) => memory[key] ?? (key == AppPreferences.prefCurrency ? 'USD' : null);
    final state = Provider.of<AppData>(tester.element(find.byType(Scaffold).first), listen: false);
    state.add(
      AccountAppData(title: 'Card', type: AppAccountType.account.toString(), details: 0.0, hidden: false),
      'acc',
    );
    state.add(BudgetAppData(title: 'Food', hidden: false), 'cat');
    final bills = state.getList(AppDataType.bills, false).length;

    var isBusy = false;
    var notifications = [
      {'id': 'n1', 'package': 'com.bank', 'title': 'Bank', 'text': 'Paid 12.50 EUR at Bakery', 'time': 1794787200000},
    ];
    final done = <int>[];
    final messenger = tester.binding.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(NotificationChannel.channel, (call) async {
      final args = call.arguments as Map?;
      switch (call.method) {
        case 'isBusy':
          return isBusy;
        case 'isGranted':
          return true;
        case 'getNotifications':
          return notifications;
        case 'removeNotifications':
          final ids = List<String>.from(args!['ids']);
          notifications = notifications.where((e) => !ids.contains(e['id'])).toList();
          return null;
        case 'done':
          done.add(args!['added'] as int);
          return null;
      }
      return null;
    });
    addTearDown(() {
      NotificationController.instance = null;
      messenger.setMockMethodCallHandler(NotificationChannel.channel, null);
      NotificationChannel.channel.setMethodCallHandler(null);
    });

    // The application waits while the background instance is importing
    isBusy = true;
    final application = NotificationController();
    NotificationController.instance = application;
    application.attach(state);
    await application.run();
    expect(notifications, hasLength(1));
    expect(state.getList(AppDataType.bills, false).length, bills);
    application.detach();

    // The background instance imports all captured notifications and reports the result
    final background = NotificationController();
    NotificationController.instance = background;
    await tester.runAsync(() => background.attachBackground(state));
    expect(done, [1]);
    expect(notifications, isEmpty);
    expect(state.getList(AppDataType.bills, false).length, bills + 1);

    // A notification captured during the background import is imported by the same instance
    notifications = [
      {'id': 'n2', 'package': 'com.bank', 'title': 'Bank', 'text': 'Paid 4 EUR at Kiosk', 'time': 1794787400000},
      {'id': 'n3', 'package': 'com.other', 'title': 'Chat', 'text': 'Paid 9 EUR at Bar', 'time': 1794787500000},
    ];
    await tester.runAsync(() => messenger.handlePlatformMessage(
          NotificationChannel.channel.name,
          NotificationChannel.channel.codec.encodeMethodCall(const MethodCall('onCaptured')),
          (_) {},
        ));
    expect(done, [1, 2]);
    // Only applications linked to an account are processed
    expect(notifications.map((e) => e['id']), ['n3']);
    expect(state.getList(AppDataType.bills, false).length, bills + 2);
    await tester.pump(const Duration(seconds: 10));
  });
}
