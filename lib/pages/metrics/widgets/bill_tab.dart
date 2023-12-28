// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/charts/data/data_handler.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/bar_race_chart.dart';
import 'package:app_finance/components/component_bill_ytd.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class BillTab extends StatelessWidget {
  final AppData store;
  final double? width;

  const BillTab({
    super.key,
    required this.store,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    double indent = ThemeHelper.getIndent();
    final width = this.width ?? ThemeHelper.getWidth(context, 6);
    final budgets = store.getList(AppDataType.budgets);
    return SingleChildScrollView(
      child: Padding(
        padding: this.width != null ? EdgeInsets.zero : EdgeInsets.all(indent * 2),
        child: Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            const ComponentBillYtd(),
            ThemeHelper.hIndent2x,
            TextWrapper(
              '${AppLocale.labels.chartBarRace}, ${Exchange.defaultCurrency?.code}',
              style: textTheme.bodyLarge,
            ),
            BarRaceChart(
              width: width,
              indent: indent,
              categories: budgets.cast(),
              data: DataHandler.getAmountGroupedByCategory(
                store.getActualList(AppDataType.bills).cast(),
                budgets.cast(),
                exchange: Exchange(store: store),
              ),
            ),
            ThemeHelper.formEndBox,
          ],
        ),
      ),
    );
  }
}
