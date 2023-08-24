// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/data_handler.dart';
import 'package:app_finance/_classes/storage/history_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/charts/bar_vertical_single.dart';
import 'package:app_finance/charts/gauge_chart.dart';
import 'package:app_finance/charts/interface/chart_value.dart';
import 'package:app_finance/charts/interface/ohlc_data.dart';
import 'package:app_finance/charts/ohlc_chart.dart';
import 'package:app_finance/charts/pie_radius_chart.dart';
import 'package:app_finance/widgets/_generic/text_widget.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:app_finance/widgets/_wrappers/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountTab extends StatelessWidget {
  final AppData store;

  const AccountTab({
    super.key,
    required this.store,
  });

  List<OhlcData> _getData(List<AccountAppData> accounts, DateTime xMin) {
    final exchange = Exchange(store: store);
    return DataHandler.generateOhlcSummary(
      HistoryData.getMultiLog(accounts),
      exchange: exchange,
      cut: xMin,
    );
  }

  double _getHealthData(List<OhlcData> data) {
    double health = 0;
    if (data.isNotEmpty && data.first.high > 0) {
      health = 100 * (data.last.close - data.first.high) / data.first.high;
    }
    return health;
  }

  List<ChartValue> _getCurrencyDistribution(List<AccountAppData> accounts) {
    final exchange = Exchange(store: store);
    final result = <String, ChartValue>{};
    for (int i = 0; i < accounts.length; i++) {
      final code = accounts[i].currency?.code ?? '?';
      final value = exchange.reform(accounts[i].details, accounts[i].currency, Exchange.defaultCurrency);
      if (!result.containsKey(code)) {
        result[code] = ChartValue(0, color: accounts[i].color ?? Colors.grey, tooltip: code);
      }
      result[code]!.value += value;
    }
    return result.values.toList();
  }

  List<List<Widget>> _generateCurrencyTable(List<ChartValue> data) {
    final formatter = NumberFormat.compact();
    final max = data.fold(0.0, (v, o) => v + o.value);
    final List<List<Widget>> result = [
      [
        const Text(''),
        TextWidget(AppLocale.labels.currencyShort),
        Align(
          alignment: Alignment.centerRight,
          child: TextWidget(AppLocale.labels.currencyIn(Exchange.defaultCurrency?.code ?? '?')),
        ),
        Align(alignment: Alignment.centerRight, child: TextWidget(AppLocale.labels.currencyDistribution)),
      ]
    ];
    for (int i = 0; i < data.length; i++) {
      final grade = 100 * data[i].value / max;
      result.add([
        BarVerticalSingle(color: data[i].color, value: 1, height: 6),
        TextWidget(data[i].tooltip),
        Align(alignment: Alignment.centerRight, child: TextWidget(formatter.format(data[i].value))),
        Align(alignment: Alignment.centerRight, child: TextWidget('${grade.toStringAsFixed(2)}%')),
      ]);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent = ThemeHelper.getIndent();
    double width = ThemeHelper.getWidth(context, 4);
    double pieWidth = width > 600 ? 280 : width * 0.4;
    final now = DateTime.now();
    final xMin = DateTime(now.year, now.month - 5);
    final accountList = store.getList(AppDataType.accounts).cast<AccountAppData>();
    final data = _getData(accountList, xMin);
    final currency = _getCurrencyDistribution(accountList);
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
            RowWidget(
              alignment: MainAxisAlignment.end,
              indent: indent,
              maxWidth: width - indent,
              chunk: [null, ThemeHelper.getTextWidth(healthTxt), 40 + indent],
              children: [
                const [SizedBox()],
                [
                  healthTxt,
                  SizedBox(height: indent),
                ],
                [
                  GaugeChart(
                    value: _getHealthData(data),
                    valueMin: 0,
                    valueMax: 100,
                    width: 40,
                    height: 30,
                  ),
                ],
              ],
            ),
            SizedBox(height: indent),
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
            SizedBox(height: indent * 3),
            RowWidget(
              maxWidth: width,
              indent: indent,
              chunk: [null, pieWidth],
              children: [
                [
                  TableWidget(
                    shadowColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                    width: width - pieWidth - 2 * indent,
                    chunk: const [8, null, null, null],
                    data: _generateCurrencyTable(currency),
                  ),
                ],
                [
                  PieRadiusChart(
                    data: currency,
                    width: pieWidth,
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
