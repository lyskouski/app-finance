// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/data_handler.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/charts/gauge_chart.dart';
import 'package:app_finance/charts/ohlc_chart.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:flutter/material.dart';

class AccountTab extends StatelessWidget {
  final AppData store;

  const AccountTab({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent = ThemeHelper.getIndent();
    double width = ThemeHelper.getWidth(context, 4);
    final exchange = Exchange(store: store);
    final now = DateTime.now();
    final xMin = DateTime(now.year, now.month - 5);
    final data = DataHandler.generateOhlcSummary(
      store.getMultiLog(store.getList(AppDataType.accounts).cast<AccountAppData>()),
      exchange: exchange,
      cut: xMin,
    );
    double health = 0;
    if (data.isNotEmpty && data.first.high > 0) {
      health = 100 * (data.last.close - data.first.high) / data.first.high;
    }
    final healthTxt = Text(
      AppLocale.labels.incomeHealth,
      style: Theme.of(context).textTheme.bodyMedium,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(indent * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: indent),
            RowWidget(
              alignment: MainAxisAlignment.end,
              indent: indent,
              maxWidth: width - indent,
              chunk: [null, ThemeHelper.getTextWidth(healthTxt), 40 + indent],
              children: [
                [],
                [
                  healthTxt,
                  SizedBox(height: indent),
                ],
                [
                  GaugeChart(
                    value: health,
                    valueMin: 0,
                    valueMax: 100,
                    width: 40,
                    height: 30,
                  ),
                ],
              ],
            ),
            Text(
              AppLocale.labels.chartOHLC,
              style: textTheme.bodyLarge,
            ),
            OhlcChart(
              width: width,
              height: 200,
              indent: indent,
              xMin: xMin,
              data: data,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocale.labels.raiseData,
                  style: textTheme.bodySmall!.copyWith(color: Colors.blue),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  AppLocale.labels.failData,
                  style: textTheme.bodySmall!.copyWith(color: Colors.red),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
