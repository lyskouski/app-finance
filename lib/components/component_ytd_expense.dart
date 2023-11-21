// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/column_chart.dart';
import 'package:app_finance/charts/data/data_handler.dart';
import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComponentYtdExpense extends StatelessWidget {
  const ComponentYtdExpense({super.key});

  List<ChartData> getData(AppData store) {
    final currentYear = DateTime(DateTime.now().year);
    final prevYear = DateTime(currentYear.year - 1);
    final scope = store.getStream<BillAppData>(AppDataType.bills, filter: (e) => e.createdAt.isBefore(prevYear));

    final exchange = Exchange(store: store);
    return [
      ChartData(
        DataHandler.getAmountGroupedByMonth(
          scope.getTill(0.0 + currentYear.millisecondsSinceEpoch).cast(),
          exchange: exchange,
        ),
        color: Colors.blue,
      ),
      ChartData(
        DataHandler.getAmountGroupedByMonth(
          scope.toList().cast<InterfaceAppData>().map((e) {
            e.createdAt = e.createdAt.add(const Duration(days: 365));
            return e;
          }).toList(),
          exchange: exchange,
        ),
        color: Colors.grey,
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
    final year = DateTime.now().year;
    return Consumer<AppData>(builder: (context, appState, _) {
      final data = getData(appState);
      return LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth - indent * 2;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocale.labels.chartYtdExpense,
              style: textTheme.bodyLarge,
            ),
            ColumnChart(
              width: width,
              height: 200,
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
                      year.toString(),
                      style: textTheme.bodySmall?.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
                [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextWrapper(
                      (year - 1).toString(),
                      style: textTheme.bodySmall?.copyWith(color: Colors.grey),
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
