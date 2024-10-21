// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/bar_vertical_single.dart';
import 'package:app_finance/charts/interface/chart_value.dart';
import 'package:app_finance/charts/pie_radius_chart.dart';
import 'package:app_finance/components/widgets/account_flow_chart.dart';
import 'package:app_finance/components/widgets/account_health_chart.dart';
import 'package:app_finance/design/generic/text_widget.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountTab extends StatelessWidget {
  final AppData store;

  const AccountTab({
    super.key,
    required this.store,
  });

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
    double indent = ThemeHelper.getIndent();
    final accountList = store.getList(AppDataType.accounts).cast<AccountAppData>();
    final currency = _getCurrencyDistribution(accountList);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(indent * 2),
        child: LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth;
          double pieWidth = width > 600 ? 280 : width * 0.4;
          return Column(
            crossAxisAlignment: AppDesign.getAlignment(),
            children: [
              const AccountHealthChart(),
              ThemeHelper.hIndent2x,
              const AccountFlowChart(),
              ThemeHelper.hIndent3x,
              RowWidget(
                maxWidth: width,
                indent: indent,
                chunk: [null, pieWidth],
                children: [
                  [
                    TableWidget(
                      shadowColor: context.colorScheme.onSurface.withOpacity(0.1),
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
          );
        }),
      ),
    );
  }
}
