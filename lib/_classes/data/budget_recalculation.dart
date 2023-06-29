// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'package:app_finance/_classes/data/abstract_recalculation.dart';
import 'package:app_finance/_classes/data/budget_app_data.dart';
import 'package:app_finance/_classes/data/summary_app_data.dart';

class BudgetRecalculation extends AbstractRecalculation {
  BudgetAppData change;
  BudgetAppData? initial;

  BudgetRecalculation({
    required this.change,
    this.initial,
  });

  @override
  double getDelta() {
    if (!change.hidden && initial != null && change.amountLimit != 0) {
      return (change.amountLimit - initial!.amountLimit * initial!.progress) /
          change.amountLimit;
    } else {
      return 0.0;
    }
  }

  BudgetRecalculation updateBudget() {
    change.progress = getDelta();
    return this;
  }
}
