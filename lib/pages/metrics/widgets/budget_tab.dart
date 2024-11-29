// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_start_of_month.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/_ext/double_ext.dart';
import 'package:app_finance/components/widgets/budget_forecast_chart.dart';
import 'package:app_finance/components/widgets/budget_ytd_chart.dart';
import 'package:app_finance/design/generic/text_widget.dart';
import 'package:app_finance/design/wrapper/table_widget.dart';
import 'package:flutter/material.dart';

class BudgetTab extends StatelessWidget {
  final AppData store;
  final double width;

  const BudgetTab({
    super.key,
    required this.store,
    required this.width,
  });

  Widget _getField(BudgetAppData budget, List<BillAppData> bills) {
    Color? color;
    String? text = '-';
    if (budget.amountLimit > 0) {
      final ex = Exchange(store: store);
      double value = bills.fold(0.0, (v, e) => v + ex.reform(e.details, e.currency, ex.getDefaultCurrency()));
      value = 100 * value / ex.reform(budget.amountLimit, budget.currency, ex.getDefaultCurrency());
      text = '${value.toFixed(2)}%';
      if (value < 50) {
        color = Colors.green;
      } else if (value < 120) {
        color = Colors.yellow;
      } else {
        color = Colors.pink;
      }
    }
    return Container(
      alignment: Alignment.centerRight,
      color: color?.withOpacity(0.2),
      child: TextWidget(text),
    );
  }

  List<List<Widget>> _generateTable() {
    final date = DateTime.now();
    final List<List<Widget>> result = [
      [
        const Icon(Icons.category),
        TextWidget(AppLocale.labels.title),
        Align(alignment: Alignment.centerRight, child: TextWidget(date.fullMonth())),
        Align(alignment: Alignment.centerRight, child: TextWidget(date.getPreviousMonth(1).fullMonth())),
        Align(alignment: Alignment.centerRight, child: TextWidget(date.getPreviousMonth(2).fullMonth())),
      ]
    ];
    final day = AppStartOfMonth.get();
    final bills = store.getStream(AppDataType.bills);
    final billFirst = bills.getTill(date.getStartingDay(day).millisecondsSinceEpoch.toDouble()).cast<BillAppData>();
    final billSecond = bills
        .getTill(date.getPreviousMonth(1).getStartingDay(day).millisecondsSinceEpoch.toDouble())
        .cast<BillAppData>();
    final billThird = bills
        .getTill(date.getPreviousMonth(2).getStartingDay(day).millisecondsSinceEpoch.toDouble())
        .cast<BillAppData>();
    for (BudgetAppData budget in store.getList(AppDataType.budgets)) {
      result.add([
        Icon(budget.icon, color: budget.color),
        TextWidget(budget.title),
        _getField(budget, billFirst.where((bill) => bill.category == budget.uuid).toList()),
        _getField(budget, billSecond.where((bill) => bill.category == budget.uuid).toList()),
        _getField(budget, billThird.where((bill) => bill.category == budget.uuid).toList()),
      ]);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final indent = ThemeHelper.getIndent(2);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(indent),
        child: Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            const BudgetForecastChart(),
            ThemeHelper.hIndent4x,
            const BudgetYtdChart(),
            ThemeHelper.hIndent4x,
            TableWidget(
              shadowColor: context.colorScheme.onSurface.withOpacity(0.1),
              width: width - indent,
              chunk: const [20, 72, null, null, null],
              data: _generateTable(),
            ),
            ThemeHelper.formEndBox,
          ],
        ),
      ),
    );
  }
}
