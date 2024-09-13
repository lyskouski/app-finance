// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:math';

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/data/data_handler.dart';
import 'package:app_finance/charts/forecast_chart.dart';
import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/components/widgets/account_flow_chart.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetForecastChart extends AccountFlowChart {
  const BudgetForecastChart({super.key});

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent();
    final TextTheme textTheme = context.textTheme;
    return Consumer<AppData>(builder: (context, appState, _) {
      final exchange = Exchange(store: appState);
      return LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth - indent * 2;
        return Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            TextWrapper(
              AppLocale.labels.chartForecast,
              style: textTheme.bodyLarge,
            ),
            ForecastChart(
              width: width,
              height: [constraints.maxHeight - 6 * indent, 200].reduce(min).toDouble(),
              indent: indent,
              data: [
                ChartData(DataHandler.getAmountGroupedByDate(
                  appState.getActualList(AppDataType.bills).cast<BillAppData>(),
                  exchange: exchange,
                )),
              ],
              yMax: DataHandler.countBudgetTotal(
                appState.getList(AppDataType.budgets).cast<BudgetAppData>(),
                exchange: exchange,
              ),
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
                      AppLocale.labels.actualData,
                      style: textTheme.bodySmall!.copyWith(color: Colors.red),
                    ),
                  ),
                ],
                [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextWrapper(
                      AppLocale.labels.forecastData,
                      style: textTheme.bodySmall!.copyWith(color: Colors.red.withBlue(200)),
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
