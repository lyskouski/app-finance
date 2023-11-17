// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/charts/data/data_handler.dart';
import 'package:app_finance/_classes/storage/history_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/bar_vertical_single.dart';
import 'package:app_finance/charts/gauge_linear_chart.dart';
import 'package:app_finance/charts/interface/chart_value.dart';
import 'package:app_finance/charts/interface/ohlc_data.dart';
import 'package:app_finance/charts/ohlc_chart.dart';
import 'package:app_finance/charts/pie_radius_chart.dart';
import 'package:app_finance/design/generic/text_widget.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/table_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountTab extends StatelessWidget {
  final AppData store;
  final double? width;

  const AccountTab({
    super.key,
    required this.store,
    this.width,
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
    final scope = result.values.toList();
    scope.sort((a, b) => b.value.compareTo(a.value));
    return scope;
  }

  List<List<Widget>> _generateCurrencyTable(List<ChartValue> data) {
    final formatter = NumberFormat.compact();
    final max = data.fold(0.0, (v, o) => v + o.value.abs());
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
      final grade = data[i].value > 0 ? 100 * data[i].value / max : 0.0;
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
    final TextTheme textTheme = context.textTheme;
    double indent = ThemeHelper.getIndent();
    double width = this.width ?? ThemeHelper.getWidth(context, 8);
    double pieWidth = width > 600 ? 280 : width * 0.4;
    final now = DateTime.now();
    final xMin = DateTime(now.year, now.month - 5);
    final accountList = store.getList(AppDataType.accounts).cast<AccountAppData>();
    final data = _getData(accountList, xMin);
    final currency = _getCurrencyDistribution(accountList);
    return SingleChildScrollView(
      child: Padding(
        padding: this.width != null ? EdgeInsets.zero : EdgeInsets.all(indent * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWrapper(AppLocale.labels.incomeHealth, style: context.textTheme.bodyLarge),
            GaugeLinearChart(
              value: _getHealthData(data),
              valueMin: 0,
              valueMax: 100,
              width: width,
              height: 20,
            ),
            ThemeHelper.hIndent2x,
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
            RowWidget(
              maxWidth: width,
              indent: indent,
              chunk: [indent * 2, null, null],
              children: [
                const [ThemeHelper.emptyBox],
                [
                  TextWrapper(
                    AppLocale.labels.raiseData,
                    style: textTheme.bodySmall!.copyWith(color: Colors.blue),
                  ),
                ],
                [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextWrapper(
                      AppLocale.labels.failData,
                      style: textTheme.bodySmall!.copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ],
            ),
            ThemeHelper.hIndent3x,
            RowWidget(
              maxWidth: width,
              indent: indent,
              chunk: [null, pieWidth],
              children: [
                [
                  TableWidget(
                    shadowColor: context.colorScheme.onBackground.withOpacity(0.1),
                    width: width - pieWidth - 2 * indent,
                    chunk: const [8, 34, null, null],
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
            ThemeHelper.formEndBox,
          ],
        ),
      ),
    );
  }
}
