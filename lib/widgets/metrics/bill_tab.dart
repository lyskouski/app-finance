// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/data_handler.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/charts/bar_race_chart.dart';
import 'package:app_finance/charts/column_chart.dart';
import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:flutter/material.dart';

class BillTab extends StatelessWidget {
  final AppData store;

  const BillTab({
    super.key,
    required this.store,
  });

  List<ChartData> getData() {
    final currentYear = DateTime(DateTime.now().year);
    final prevYear = DateTime(currentYear.year - 1);
    final scope = store.getList(AppDataType.bills).cast<BillAppData>().where((e) => e.createdAt.isAfter(prevYear));
    final exchange = Exchange(store: store);
    return [
      ChartData(
        DataHandler.getAmountGroupedByMonth(
          scope.where((e) => e.createdAt.isAfter(currentYear)).toList(),
          exchange: exchange,
        ),
        color: Colors.blue,
      ),
      ChartData(
        DataHandler.getAmountGroupedByMonth(
          scope.where((e) => e.createdAt.isBefore(currentYear)).map((e) {
            e.createdAt = e.createdAt.add(const Duration(days: 365));
            return e;
          }).toList(),
          exchange: exchange,
        ),
        color: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent = ThemeHelper.getIndent();
    final data = getData();
    double yMax = data.first.data.reduce((max, current) => current.dy > max.dy ? current : max).dy;
    if (data.last.data.isNotEmpty) {
      double yPrevMax = data.last.data.reduce((max, current) => current.dy > max.dy ? current : max).dy;
      yMax = yMax > yPrevMax ? yMax : yPrevMax;
    }
    final budgets = store.getList(AppDataType.budgets);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(indent * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocale.labels.chartYtdExpense,
              style: textTheme.bodyLarge,
            ),
            ColumnChart(
              width: ThemeHelper.getWidth(context, 4),
              height: 200,
              indent: indent,
              data: data,
              yMax: yMax * 1.2,
            ),
            SizedBox(height: indent),
            Text(
              AppLocale.labels.chartBarRace,
              style: textTheme.bodyLarge,
            ),
            BarRaceChart(
              width: ThemeHelper.getWidth(context, 4),
              indent: indent,
              categories: budgets.cast(),
              data: DataHandler.getAmountGroupedByCategory(
                store.getActualList(AppDataType.bills).cast(),
                budgets.cast(),
                exchange: Exchange(store: store),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
