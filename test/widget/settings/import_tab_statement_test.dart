// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/file_parser.dart';
import 'package:app_finance/_classes/storage/file_picker.dart';
import 'package:app_finance/_classes/storage/statement_parser.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/pages/settings/widgets/import_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import '../../pump_main.dart';
import '../../unit/_classes/storage/statement_parser_test.dart' show camt053;

void main() {
  testWidgets('Statement files are imported once', (WidgetTester tester) async {
    await PumpMain.init(tester);
    final state = Provider.of<AppData>(tester.element(find.byType(Scaffold).first), listen: false);
    final account = state.add(AccountAppData(
      title: 'Konto',
      type: AppAccountType.account.toString(),
      details: 0.0,
      hidden: false,
    )) as AccountAppData;
    final budget = state.add(BudgetAppData(title: 'Jedzenie', hidden: false)) as BudgetAppData;
    final bills = state.getList(AppDataType.bills, false).length;
    final invoices = state.getList(AppDataType.invoice, false).length;

    Navigator.of(tester.element(find.byType(Scaffold).first)).push(MaterialPageRoute(
      builder: (_) => const Scaffold(body: ImportTab()),
    ));
    await tester.pumpAndSettle();

    final tab = tester.state<ImportTabState>(find.byType(ImportTab));
    expect(find.text('Pick .mt940-file'), findsOneWidget);
    expect(find.text('Pick .camt.053-file'), findsOneWidget);

    Future<void> import() async {
      final picker = FilePicker([StatementParser.camtFormat]);
      final rows = picker.parseStatement(StatementParser.camtFormat, utf8.encode(camt053));
      // The picked file, as pickFile stores it
      tab.fileContent = rows;
      tab.columnMap = picker.columnMap;
      tab.fileFormat = StatementParser.camtFormat;
      tab.pending = picker.pending;
      tab.dateFormat.text = StatementParser.dateFormat;
      tab.attrValue[FileParser.attrAccountName] = account.uuid;
      tab.attrValue[FileParser.attrCategoryName] = budget.uuid;
      await tester.pumpAndSettle();
      // wrapCall waits for timers: the fake clock of the test has to move on
      final done = tab.wrapCall(tab.parseFile);
      for (var i = 0; i < 20; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      await done;
      await tester.pump();
    }

    await import();
    expect(
        find.textContaining('Imported: 2, skipped as already present: 0, pending (not imported): 1'), findsOneWidget);
    expect(state.getList(AppDataType.bills, false).length, bills + 1);
    expect(state.getList(AppDataType.invoice, false).length, invoices + 1);
    final bill = state.getList(AppDataType.bills, false).whereType<BillAppData>().last;
    expect(bill.title, 'Piekarnia Żabka — Zakupy spożywcze');
    expect(bill.details, 12.5);
    expect(bill.account, account.uuid);
    expect(bill.category, budget.uuid);
    expect(bill.currency?.code, 'PLN');
    expect(bill.createdAt, DateTime(2026, 11, 2));
    expect(state.getList(AppDataType.invoice, false).whereType<InvoiceAppData>().last.details, 2500.0);

    await import();
    expect(
        find.textContaining('Imported: 0, skipped as already present: 2, pending (not imported): 1'), findsOneWidget);
    expect(state.getList(AppDataType.bills, false).length, bills + 1);
    expect(state.getList(AppDataType.invoice, false).length, invoices + 1);
    await tester.pump(const Duration(seconds: 10));
  });
}
