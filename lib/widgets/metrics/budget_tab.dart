// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/data_handler.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/charts/forecast_chart.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:flutter/material.dart';

class BudgetTab extends StatelessWidget {
  final AppData store;

  const BudgetTab({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent = ThemeHelper.getIndent();
    final exchange = Exchange(store: store);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(indent * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocale.labels.chartForecast,
              style: textTheme.bodyLarge,
            ),
            ForecastChart(
              width: ThemeHelper.getWidth(context, 4),
              indent: indent,
              data: DataHandler.getAmountGroupedByDate(
                store.getActualList(AppDataType.bills).cast<BillAppData>(),
                exchange: exchange,
              ),
              yMax: DataHandler.countBudgetTotal(
                store.getList(AppDataType.budgets).cast<BudgetAppData>(),
                exchange: exchange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
