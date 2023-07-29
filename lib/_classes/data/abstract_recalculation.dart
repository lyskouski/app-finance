// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/exchange.dart';

abstract class AbstractRecalculation {
  late Exchange exchange;

  double getDelta();

  double getProgress(double amount, double progress, double delta) {
    if (amount > 0) {
      progress = (amount * progress + delta) / amount;
    } else {
      progress = 0.0;
    }
    return progress;
  }
}
