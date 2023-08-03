// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/abstract_recalculation.dart';
import 'package:app_finance/_classes/data/account_app_data.dart';

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
        : (initial?.hidden ?? true ? change.details : change.details - initial?.details);
  }
}
