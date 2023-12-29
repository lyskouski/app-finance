// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/gauge_linear_chart.dart';
import 'package:app_finance/charts/interface/ohlc_data.dart';
import 'package:app_finance/components/component_account_flow.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComponentAccountHealth extends ComponentAccountFlow {
  const ComponentAccountHealth({super.key});

  double getHealthData(List<OhlcData> data) {
    double health = 0;
    if (data.isNotEmpty && data.first.high > 0) {
      health = 100 * (data.last.close - data.first.high) / data.first.high;
    }
    return health;
  }

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent();
    return Consumer<AppData>(builder: (context, appState, _) {
      final accountList = appState.getList(AppDataType.accounts).cast<AccountAppData>();
      final data = getData(appState, accountList, getMin());
      return LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth - indent * 2;
        return Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            TextWrapper(AppLocale.labels.incomeHealth, style: context.textTheme.bodyLarge),
            GaugeLinearChart(
              value: getHealthData(data),
              valueMin: 0,
              valueMax: 100,
              width: width,
              height: 20,
            ),
          ],
        );
      });
    });
  }
}
