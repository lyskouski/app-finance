// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/history_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/data/data_handler.dart';
import 'package:app_finance/charts/interface/ohlc_data.dart';
import 'package:app_finance/charts/ohlc_chart.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComponentAccountFlow extends StatelessWidget {
  const ComponentAccountFlow({super.key});

  List<OhlcData> getData(AppData store, List<AccountAppData> accounts, DateTime xMin) {
    final exchange = Exchange(store: store);
    return DataHandler.generateOhlcSummary(
      HistoryData.getMultiLog(accounts),
      exchange: exchange,
      cut: xMin,
    );
  }

  DateTime getMin() => DateTime(DateTime.now().year, DateTime.now().month - 5);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    double indent = ThemeHelper.getIndent();
    return Consumer<AppData>(builder: (context, appState, _) {
      final accountList = appState.getList(AppDataType.accounts).cast<AccountAppData>();
      final xMin = getMin();
      final data = getData(appState, accountList, xMin);
      return LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth - indent * 2;
        return Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            TextWrapper(
              '${AppLocale.labels.chartOHLC}, ${Exchange.defaultCurrency?.code}',
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
              chunk: const [null, null],
              children: [
                [
                  Padding(
                    padding: EdgeInsets.only(left: indent * 2),
                    child: TextWrapper(
                      AppLocale.labels.raiseData,
                      style: textTheme.bodySmall?.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
                [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextWrapper(
                      AppLocale.labels.failData,
                      style: textTheme.bodySmall?.copyWith(color: Colors.red),
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
