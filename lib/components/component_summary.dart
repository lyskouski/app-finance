// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_start_of_month.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/components/_core/component_data.dart';
import 'package:app_finance/design/generic/text_widget.dart';
import 'package:app_finance/design/wrapper/table_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:provider/provider.dart';

class ComponentSummary extends StatelessWidget {
  final ComponentData data;

  const ComponentSummary(this.data, {super.key});

  List<List<Widget>> _generateSummaryTable(AppData appState) {
    final exchange = Exchange(store: appState);
    final displayCurrency = exchange.getDefaultCurrency() ?? Exchange.defaultCurrency;

    final DateTime startingDay = DateTime.now().getStartingDay(AppStartOfMonth.get());
    final monthStarts = <DateTime>[
      startingDay.getPreviousMonth(5),
      startingDay.getPreviousMonth(4),
      startingDay.getPreviousMonth(3),
      startingDay.getPreviousMonth(2),
      startingDay.getPreviousMonth(1),
      startingDay,
    ];
    final monthEnds = monthStarts.map((d) => d.getNextMonth()).toList();

    final budgets = appState.getList(AppDataType.budgets).cast<BudgetAppData>().where((b) => !b.hidden).toList();
    final bills = appState.getList(AppDataType.bills).cast<BillAppData>().where((b) => !b.hidden).toList();
    final accounts = appState.getList(AppDataType.accounts).cast<AccountAppData>().where((a) => !a.hidden).toList();
    final invoices = appState
        .getList(AppDataType.invoice)
        .cast<InvoiceAppData>()
        .where((i) => !i.hidden && i.accountFrom == null)
        .toList();

    String formatAmount(double value, Currency? currency) {
      if (currency == null) {
        return value.toStringAsFixed(2);
      }
      return value.toCurrency(currency: currency, withPattern: false);
    }

    double sumForBudgetAndMonth(BudgetAppData budget, int monthIndex) {
      final start = monthStarts[monthIndex];
      final end = monthEnds[monthIndex];

      double total = 0.0;
      for (final bill in bills) {
        if (bill.category != budget.uuid) {
          continue;
        }
        final createdAt = bill.createdAt;
        if (createdAt.isBefore(start) || !createdAt.isBefore(end)) {
          continue;
        }

        final amount = (bill.details as num?)?.toDouble() ?? 0.0;
        total += exchange.reform(amount, bill.currency, displayCurrency);
      }
      return total;
    }

    String formatAmountForBudget(BudgetAppData budget, double value) => formatAmount(value, displayCurrency);

    double sumBillsForMonth(int monthIndex) {
      final start = monthStarts[monthIndex];
      final end = monthEnds[monthIndex];

      double total = 0.0;
      for (final bill in bills) {
        final createdAt = bill.createdAt;
        if (createdAt.isBefore(start) || !createdAt.isBefore(end)) {
          continue;
        }
        final amount = (bill.details as num?)?.toDouble() ?? 0.0;
        total += exchange.reform(amount, bill.currency, displayCurrency);
      }
      return total;
    }

    double sumIncomeForMonth(int monthIndex) {
      final start = monthStarts[monthIndex];
      final end = monthEnds[monthIndex];

      double total = 0.0;
      for (final invoice in invoices) {
        final createdAt = invoice.createdAt;
        if (createdAt.isBefore(start) || !createdAt.isBefore(end)) {
          continue;
        }
        final amount = (invoice.details as num?)?.toDouble() ?? 0.0;
        total += exchange.reform(amount, invoice.currency, displayCurrency);
      }
      return total;
    }

    double sumIncomeForAccountAndMonth(AccountAppData account, int monthIndex) {
      final start = monthStarts[monthIndex];
      final end = monthEnds[monthIndex];

      double total = 0.0;
      for (final invoice in invoices) {
        if (invoice.account != account.uuid) {
          continue;
        }
        final createdAt = invoice.createdAt;
        if (createdAt.isBefore(start) || !createdAt.isBefore(end)) {
          continue;
        }
        final amount = (invoice.details as num?)?.toDouble() ?? 0.0;
        total += exchange.reform(amount, invoice.currency, displayCurrency);
      }
      return total;
    }

    final rows = <List<Widget>>[];

    // Header
    rows.add([
      TextWidget(' '),
      for (final m in monthStarts)
        Align(
          alignment: Alignment.centerRight,
          child: TextWidget(m.fullMonthYear(), style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      Align(
        alignment: Alignment.centerRight,
        child: TextWidget(AppLocale.labels.summary, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ]);
    rows.add([
      TextWidget(AppLocale.labels.budgetHeadline, style: TextStyle(fontWeight: FontWeight.bold)),
      for (final _ in monthStarts) TextWidget(' '),
      TextWidget(' '),
    ]);

    // Budget category rows
    for (final budget in budgets) {
      final monthTotals = List<double>.generate(6, (i) => sumForBudgetAndMonth(budget, i));
      final total = monthTotals.fold<double>(0.0, (a, b) => a + b);
      rows.add([
        TextWidget('- ${budget.title}'),
        for (final v in monthTotals)
          Align(
            alignment: Alignment.centerRight,
            child: TextWidget(formatAmountForBudget(budget, v)),
          ),
        Align(
          alignment: Alignment.centerRight,
          child: TextWidget(formatAmountForBudget(budget, total)),
        ),
      ]);
    }

    List<Widget> separatorRow() => List<Widget>.generate(8, (_) => const TextWidget(' '));

    // Header
    rows.add([
      TextWidget(AppLocale.labels.accountHeadline, style: TextStyle(fontWeight: FontWeight.bold)),
      for (final _ in monthStarts) TextWidget(' '),
      TextWidget(' '),
    ]);

    // Accounts with invoices
    final accountsWithInvoices = accounts.where((a) => invoices.any((i) => i.account == a.uuid)).toList();
    for (final account in accountsWithInvoices) {
      final monthTotals = List<double>.generate(6, (i) => sumIncomeForAccountAndMonth(account, i));
      final total = monthTotals.fold<double>(0.0, (a, b) => a + b);
      rows.add([
        TextWidget('- ${account.title}'),
        for (final v in monthTotals)
          Align(
            alignment: Alignment.centerRight,
            child: TextWidget(formatAmount(v, displayCurrency)),
          ),
        Align(
          alignment: Alignment.centerRight,
          child: TextWidget(formatAmount(total, displayCurrency)),
        ),
      ]);
    }

    // Income

    // Totals: Income - Bills
    rows.add(separatorRow());
    final incomeMonthTotals = List<double>.generate(6, (i) => sumIncomeForMonth(i));
    final billMonthTotals = List<double>.generate(6, (i) => sumBillsForMonth(i));
    final netMonthTotals = List<double>.generate(6, (i) => incomeMonthTotals[i] - billMonthTotals[i]);
    final netTotal = netMonthTotals.fold<double>(0.0, (a, b) => a + b);
    rows.add([
      TextWidget(AppLocale.labels.total, style: TextStyle(fontWeight: FontWeight.bold)),
      for (final v in netMonthTotals)
        Align(
          alignment: Alignment.centerRight,
          child: TextWidget(
            formatAmount(v, displayCurrency),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      Align(
        alignment: Alignment.centerRight,
        child: TextWidget(formatAmount(netTotal, displayCurrency), style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ]);

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent(0.5);
    return Consumer<AppData>(builder: (context, appState, _) {
      return LayoutBuilder(builder: (context, constraints) {
        return Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: TableWidget(
                  shadowColor: context.colorScheme.onSurface.withValues(alpha: 0.1),
                  width: constraints.maxWidth - indent * 4,
                  chunk: const [200, null, null, null, null, null, null, 100],
                  data: _generateSummaryTable(appState),
                ),
              ),
            ),
          ],
        );
      });
    });
  }
}

class ComponentSummaryForm extends StatefulWidget {
  final ComponentData data;
  final Function adjust;

  const ComponentSummaryForm(this.data, {super.key, required this.adjust});

  @override
  ComponentSummaryFormState createState() => ComponentSummaryFormState();
}

class ComponentSummaryFormState extends State<ComponentSummaryForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      padding: EdgeInsets.all(ThemeHelper.getIndent(4)),
      height: double.infinity,
      child: TextWrapper(AppLocale.labels.summary),
    );
  }
}
