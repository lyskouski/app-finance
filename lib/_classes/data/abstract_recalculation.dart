// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'package:app_finance/_classes/data/summary_app_data.dart';

abstract class AbstractRecalculation {
  double getDelta();

  dynamic updateTotal(
      SummaryAppData? summary, HashMap<String, dynamic> hashTable) {
    var list = summary?.list;
    summary?.total = (list == null || list.isEmpty
        ? 0.0
        : list
            .map<double>((String uuid) => hashTable[uuid].details)
            .reduce((value, details) => value + details));
    return this;
  }

  double getProgress(double amount, double progress, double delta) {
    if (amount > 0) {
      progress = (amount * progress + delta) / amount;
    } else {
      progress = 0.0;
    }
    return progress;
  }
}
