// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/fints/fints_settings.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/pages/integration/widgets/fints_widget.dart';
import 'package:fints/fints.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../pump_main.dart';
import '../../pump_main.wrapper.dart';

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
    expect(find.textContaining('Bank Code (BLZ)', findRichText: true), findsNothing);

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
}
