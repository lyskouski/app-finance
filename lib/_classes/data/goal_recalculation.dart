// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'package:app_finance/_classes/data/abstract_recalculation.dart';
import 'package:app_finance/_classes/data/goal_app_data.dart';
import 'package:app_finance/_classes/data/summary_app_data.dart';

class GoalRecalculation extends AbstractRecalculation {
  GoalAppData change;
  GoalAppData? initial;

  GoalRecalculation({
    required this.change,
    this.initial,
  });

  @override
  double getDelta() {
    if (initial != null && !change.hidden) {
      return getProgress(initial!.details, initial!.progress,
          change.details - initial!.details);
    } else {
      return 0.0;
    }
  }

  @override
  Future<void> updateTotal(
      SummaryAppData? summary, HashMap<String, dynamic> hashTable) async {
    var list = summary?.list;
    summary?.total = (list == null || list.isEmpty
        ? 0.0
        : list.map<double>((String uuid) {
            var element = hashTable[uuid];
            return element.details * (1 - element.progress);
          }).reduce((value, details) => value + details));
  }

  GoalRecalculation updateGoal() {
    change.progress = getDelta();
    return this;
  }
}
