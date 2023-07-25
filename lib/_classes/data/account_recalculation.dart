// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/abstract_recalculation.dart';
import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/data/exchange.dart';

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
        ? -(initial?.details ?? 0.0)
        : (initial?.hidden ?? true
            ? change.details
            : change.details - initial?.details);
  }

  AccountRecalculation updateGoals(
      dynamic goalList, double initTotal, double total) {
    if (initial == null) {
      return this;
    }
    double delta = total - initTotal;
    if (goalList.isNotEmpty && !initial!.hidden) {
      int index = 0;
      delta /= goalList.length;
      goalList.forEach((dynamic goal) {
        index++;
        double convDelta =
            exchange.reform(delta, Exchange.defaultCurrency, goal.currency);
        double progress = getProgress(goal.details, goal.progress, convDelta);
        if (progress > 1.0) {
          if (index < goalList.length) {
            delta += exchange.reform(goal.details * (progress - 1.0),
                    goal.currency, Exchange.defaultCurrency) /
                (goalList.length - index);
          }
          progress = 1.0;
        }
        if (progress < 1.0 &&
            goal.progress == 1.0 &&
            goal.initial + goal.details < total) {
          progress = 1.0;
          delta += delta / (goalList.length - index);
        }
        if (progress < 0.0) {
          progress = 0.0;
        }
        goal.progress = progress;
      });
    }
    return this;
  }
}
