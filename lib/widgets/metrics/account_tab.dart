// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/data_handler.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/charts/ohlc_chart.dart';
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
    final exchange = Exchange(store: store);
    final now = DateTime.now();
    final xMin = DateTime(now.year, now.month - 5);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(indent * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocale.labels.chartOHLC,
              style: textTheme.bodyLarge,
            ),
            OhlcChart(
              width: ThemeHelper.getWidth(context, 4),
              height: 200,
              indent: indent,
              xMin: xMin,
              data: DataHandler.generateOhlcSummary(
                store.getMultiLog(store.getList(AppDataType.accounts).cast<AccountAppData>()),
                exchange: exchange,
                cut: xMin,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocale.labels.raiseData,
                  style: textTheme.bodySmall!.copyWith(color: Colors.blue),
                ),
                Text(
                  AppLocale.labels.failData,
                  style: textTheme.bodySmall!.copyWith(color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
