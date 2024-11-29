// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:math';

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_start_of_month.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/history_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/charts/column_chart.dart';
import 'package:app_finance/charts/data/data_handler.dart';
import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetYtdChart extends StatelessWidget {
  const BudgetYtdChart({super.key});

  List<BudgetAppData> getBudgetHistory(AppData store) {
    final day = AppStartOfMonth.get();
    final current = DateTime.now().getStartingDay(day);
    final endLastYear = DateTime(current.year, current.month - 12, day);
    final budgets = store.getList(AppDataType.budgets).cast<BudgetAppData>();
    final exchange = Exchange(store: store);
    final budgetsAmount =
        budgets.fold(0.0, (v, e) => v + exchange.reform(e.amountLimit, e.currency, exchange.getDefaultCurrency()));
    final budgetHistory = HistoryData.getMultiLog(budgets).expand((e) => e!).toList();
    final budgetList = [];
    for (DateTime date = DateTime(current.year, current.month + 1, day);
        date.isAfter(endLastYear);
        date = DateTime(date.year, date.month - 1, day)) {
      final delta = budgetHistory.where((e) => e.timestamp.isAfter(date)).fold(
          0.0, (v, e) => v - exchange.reform(e.changedTo - e.changedFrom, e.currency, exchange.getDefaultCurrency()));
      budgetList.add(BudgetAppData(title: '', createdAt: date, amountLimit: budgetsAmount + delta));
    }
    return budgetList.cast();
  }

  List<ChartData> getData(AppData store) {
    final day = AppStartOfMonth.get();
    final currentYear = DateTime(DateTime.now().year).getStartingDay(day);
    final prevYear = DateTime(currentYear.year - 1).getStartingDay(day);
    final bills = store.getStream<BillAppData>(AppDataType.bills, filter: (e) => e.createdAt.isBefore(prevYear));
    final exchange = Exchange(store: store);
    return [
      ChartData(
        DataHandler.getAmountGroupedByMonth(
          getBudgetHistory(store),
          exchange: exchange,
        ),
        color: Colors.blue,
      ),
      ChartData(
        DataHandler.getAmountGroupedByMonth(
          bills.getTill(0.0 + currentYear.millisecondsSinceEpoch).cast(),
          exchange: exchange,
        ),
        color: Colors.red,
      ),
    ];
  }

  double getMax(List<ChartData> data) {
    double yMax = 0;
    if (data.isNotEmpty && data.first.data.isNotEmpty) {
      yMax = data.first.data.reduce((max, current) => current.dy > max.dy ? current : max).dy;
      if (data.last.data.isNotEmpty) {
        double yPrevMax = data.last.data.reduce((max, current) => current.dy > max.dy ? current : max).dy;
        yMax = yMax > yPrevMax ? yMax : yPrevMax;
      }
    }
    return yMax;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final indent = ThemeHelper.getIndent();
    return Consumer<AppData>(builder: (context, appState, _) {
      final data = getData(appState);
      return LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth - indent * 2;
        return Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            Text(
              '${AppLocale.labels.budgetHeadline} ${AppLocale.labels.budgetLimit}, ${Exchange.defaultCurrency?.code}',
              style: textTheme.bodyLarge,
            ),
            ColumnChart(
              width: width,
              height: [constraints.maxHeight - 6 * indent, 200].reduce(min).toDouble(),
              indent: indent,
              data: data,
              yMax: getMax(data) * 1.2,
            ),
            RowWidget(
              maxWidth: width,
              indent: indent,
              chunk: const [null, null],
              children: [
                [
                  Padding(
                    padding: EdgeInsets.only(left: indent * 2),
                    child: TextWrapper(
                      AppLocale.labels.budgetHeadline,
                      style: textTheme.bodySmall?.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
                [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextWrapper(
                      AppLocale.labels.billHeadline,
                      style: textTheme.bodySmall?.copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ],
            ),
          ],
        );
      });
    });
  }
}
