// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_start_of_month.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
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
    final defaultCurrency = exchange.getDefaultCurrency();

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

    double sumForBudgetAndMonth(BudgetAppData budget, int monthIndex) {
      final start = monthStarts[monthIndex];
      final end = monthEnds[monthIndex];
      final targetCurrency = budget.currency ?? defaultCurrency;

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
        if (targetCurrency == null || bill.currency == null || bill.currency?.code == targetCurrency.code) {
          total += amount;
        } else {
          // Avoid mutating store during build (Exchange.reform may add missing rates).
          // `exchangeCategory` is precomputed when bills are updated.
          total += amount * bill.exchangeCategory;
        }
      }
      return total;
    }

    String formatAmountForBudget(BudgetAppData budget, double value) {
      final curr = budget.currency ?? defaultCurrency;
      if (curr == null) {
        return value.toStringAsFixed(2);
      }
      return value.toCurrency(currency: curr, withPattern: false);
    }

    final rows = <List<Widget>>[];

    // Header
    rows.add([
      TextWidget(AppLocale.labels.budgetHeadline),
      for (final m in monthStarts) TextWidget(m.fullMonthYear()),
      TextWidget(AppLocale.labels.summary),
    ]);

    // Budget category rows
    for (final budget in budgets) {
      final monthTotals = List<double>.generate(6, (i) => sumForBudgetAndMonth(budget, i));
      final total = monthTotals.fold<double>(0.0, (a, b) => a + b);
      rows.add([
        TextWidget(budget.title),
        for (final v in monthTotals) TextWidget(formatAmountForBudget(budget, v)),
        TextWidget(formatAmountForBudget(budget, total)),
      ]);
    }

    // Overall summary row (in default currency where available)
    final summaryMonthTotals = List<double>.generate(6, (monthIndex) {
      double total = 0.0;
      for (final budget in budgets) {
        final targetCurrency = budget.currency ?? defaultCurrency;
        final value = sumForBudgetAndMonth(budget, monthIndex);
        // If budgets use different currencies, totals are best-effort.
        if (defaultCurrency != null && targetCurrency != null && targetCurrency.code != defaultCurrency.code) {
          // Can't safely convert here without mutating store; skip conversion.
          total += value;
        } else {
          total += value;
        }
      }
      return total;
    });
    final summaryTotal = summaryMonthTotals.fold<double>(0.0, (a, b) => a + b);
    rows.add([
      TextWidget(AppLocale.labels.summary),
      for (final v in summaryMonthTotals)
        TextWidget(defaultCurrency == null
            ? v.toStringAsFixed(2)
            : v.toCurrency(currency: defaultCurrency, withPattern: false)),
      TextWidget(defaultCurrency == null
          ? summaryTotal.toStringAsFixed(2)
          : summaryTotal.toCurrency(currency: defaultCurrency, withPattern: false)),
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
            TableWidget(
              shadowColor: context.colorScheme.onSurface.withValues(alpha: 0.1),
              width: constraints.maxWidth - indent * 4,
              chunk: const [200, null, null, null, null, null, null, 100],
              data: _generateSummaryTable(appState),
            )
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
