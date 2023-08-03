// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/abstract_recalculation.dart';
import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/data/bill_app_data.dart';
import 'package:app_finance/_classes/data/budget_app_data.dart';

class BillRecalculation extends AbstractRecalculation {
  BillAppData change;
  BillAppData? initial;

  BillRecalculation({
    required this.change,
    this.initial,
  });

  @override
  double getDelta() {
    throw UnimplementedError();
  }

  double getStateDelta(dynamic prev, dynamic curr) {
    double delta = change.hidden ? 0.0 : change.details;
    if (initial != null && prev?.uuid == curr?.uuid) {
      delta =
          change.hidden ? -initial?.details : (initial!.hidden ? change.details : change.details - initial?.details);
    }
    return delta;
  }

  double getPrevDelta() {
    return initial!.hidden ? 0.0 : initial?.details;
  }

  BillRecalculation updateAccount(AccountAppData accountChange, AccountAppData? accountInitial) {
    if (accountInitial != null &&
        accountChange.uuid != accountInitial.uuid &&
        accountInitial.createdAt.isBefore(initial!.createdAt)) {
      accountInitial.details += super.exchange.reform(getPrevDelta(), initial?.currency, accountInitial.currency);
    }
    if (accountChange.createdAt.isBefore(change.createdAt)) {
      accountChange.details -=
          super.exchange.reform(getStateDelta(accountInitial, accountChange), change.currency, accountChange.currency);
    }
    return this;
  }

  BillRecalculation updateBudget(BudgetAppData budgetChange, BudgetAppData? budgetInitial) {
    DateTime now = DateTime.now();
    if (DateTime(now.year, now.month).isAfter(change.createdAt)) {
      return this;
    }
    if (budgetInitial != null && budgetChange.uuid != budgetInitial.uuid) {
      double prevDelta = super.exchange.reform(getPrevDelta(), initial?.currency, budgetInitial.currency);
      budgetInitial.progress = getProgress(budgetInitial.amountLimit, budgetInitial.progress, -prevDelta);
    }
    double delta =
        super.exchange.reform(getStateDelta(budgetInitial, budgetChange), change.currency, budgetChange.currency);
    budgetChange.progress = getProgress(budgetChange.amountLimit, budgetChange.progress, delta);
    return this;
  }
}
