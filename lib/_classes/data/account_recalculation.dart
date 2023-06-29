// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/abstract_recalculation.dart';
import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/data/summary_app_data.dart';

class AccountRecalculation extends AbstractRecalculation {
  AccountAppData change;
  AccountAppData? initial;

  AccountRecalculation({
    required this.change,
    this.initial,
  });

  @override
  double getDelta() {
    return change.hidden
        ? -initial!.details
        : change.details - initial!.details;
  }

  AccountRecalculation updateGoals(dynamic goalList) {
    if (initial == null) {
      return this;
    }
    double delta = getDelta();
    if (goalList.isNotEmpty && !initial!.hidden) {
      int index = 0;
      delta /= goalList.length;
      goalList.forEach((dynamic goal) {
        index++;
        double progress = getProgress(goal.details, goal.progress, delta);
        if (progress > 1.0) {
          if (index < goalList.length) {
            delta +=
                goal.details * (progress - 1.0) / (goalList.length - index);
          }
          progress = 1.0;
        }
        if (progress < 0.0) {
          progress = 0.0;
        }
        goal.progress = progress;
      });
    }
    return this;
  }

  @override
  AccountRecalculation updateTotal(SummaryAppData? summary) {
    summary?.total += getDelta();
    return this;
  }
}
