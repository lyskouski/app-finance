// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_classes/data/bill_app_data.dart';
import 'package:app_finance/_classes/data/budget_app_data.dart';
import 'package:app_finance/charts/forecast_chart.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BudgetTab extends StatelessWidget {
  final AppData store;

  const BudgetTab({
    super.key,
    required this.store,
  });

  List<Offset> _generateData() {
    final data = SplayTreeMap<int, List<double>>();
    for (BillAppData item in store.getActualList(AppDataType.bills)) {
      int actual = DateTime(item.createdAt.year, item.createdAt.month, item.createdAt.day).microsecondsSinceEpoch;
      if (data[actual] == null) {
        data[actual] = [];
      }
      data[actual]!.add(item.details);
    }
    final List<Offset> result = [];
    data.forEach((key, value) => result.add(Offset(key.toDouble(), value.fold(0.0, (v, e) => v + e))));
    return result;
  }

  double _getBudgetTotal() {
    double result = 0.0;
    for (BudgetAppData item in store.getList(AppDataType.budgets)) {
      result += item.amountLimit;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    var helper = ThemeHelper(windowType: getWindowType(context));
    double indent = helper.getIndent();
    double width = MediaQuery.of(context).size.width - indent * 2;
    return Padding(
      padding: EdgeInsets.all(indent * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.chartForecast,
            style: textTheme.bodyLarge,
          ),
          ForecastChart(
            width: width - indent * 2,
            indent: indent,
            data: _generateData(),
            yMax: _getBudgetTotal(),
          ),
        ],
      ),
    );
  }
}
