// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/math/abstract_recalculation.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';

class GoalRecalculation extends AbstractRecalculation {
  GoalAppData change;
  GoalAppData? initial;

  GoalRecalculation({
    required this.change,
    this.initial,
  });

  @override
  double getDelta() {
    double result = 0.0;
    if (initial != null && !change.hidden && change.details > 0) {
      result = initial!.details * initial!.progress / change.details;
    }
    return result.clamp(0, 1);
  }

  GoalRecalculation updateGoal() {
    change.progress = getDelta();
    return this;
  }
}
