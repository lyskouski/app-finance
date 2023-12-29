// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/components/component_budget_forecast.dart';
import 'package:app_finance/components/component_budget_ytd.dart';
import 'package:flutter/material.dart';

class BudgetTab extends StatelessWidget {
  final double? width;

  const BudgetTab({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: width != null ? EdgeInsets.zero : EdgeInsets.all(ThemeHelper.getIndent(2)),
        child: Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: const [
            ComponentBudgetForecast(),
            ThemeHelper.hIndent4x,
            ComponentBudgetYtd(),
          ],
        ),
      ),
    );
  }
}
