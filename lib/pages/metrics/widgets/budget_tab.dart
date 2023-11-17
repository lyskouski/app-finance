// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/charts/data/data_handler.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/forecast_chart.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:flutter/material.dart';

class BudgetTab extends StatelessWidget {
  final AppData store;
  final double? width;

  const BudgetTab({
    super.key,
    required this.store,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final width = this.width ?? ThemeHelper.getWidth(context, 6);
    final TextTheme textTheme = context.textTheme;
    double indent = ThemeHelper.getIndent();
    final exchange = Exchange(store: store);
    return SingleChildScrollView(
      child: Padding(
        padding: this.width != null ? EdgeInsets.zero : EdgeInsets.all(indent * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocale.labels.chartForecast,
              style: textTheme.bodyLarge,
            ),
            ForecastChart(
              width: width,
              height: 200,
              indent: indent,
              data: [
                ChartData(DataHandler.getAmountGroupedByDate(
                  store.getActualList(AppDataType.bills).cast<BillAppData>(),
                  exchange: exchange,
                )),
              ],
              yMax: DataHandler.countBudgetTotal(
                store.getList(AppDataType.budgets).cast<BudgetAppData>(),
                exchange: exchange,
              ),
            ),
            RowWidget(
              maxWidth: width,
              indent: indent,
              chunk: [indent * 2, null, null],
              children: [
                const [ThemeHelper.emptyBox],
                [
                  Text(
                    AppLocale.labels.actualData,
                    style: textTheme.bodySmall!.copyWith(color: Colors.red),
                  ),
                ],
                [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppLocale.labels.forecastData,
                      style: textTheme.bodySmall!.copyWith(color: Colors.red.withBlue(200)),
                    ),
                  ),
                ],
              ],
            ),
            ThemeHelper.formEndBox,
          ],
        ),
      ),
    );
  }
}
