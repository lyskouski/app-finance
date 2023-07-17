// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'package:app_finance/_classes/data/abstract_recalculation.dart';
import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/data/bill_app_data.dart';
import 'package:app_finance/_classes/data/budget_app_data.dart';
import 'package:app_finance/_classes/data/summary_app_data.dart';
import 'package:currency_picker/currency_picker.dart';

typedef ReformFunction = double Function(
    double? amount, Currency? origin, Currency? target);

class BillRecalculation extends AbstractRecalculation {
  BillAppData change;
  BillAppData? initial;
  ReformFunction reform;

  BillRecalculation({
    required this.reform,
    required this.change,
    this.initial,
  });

  @override
  double getDelta() {
    double delta = change.hidden ? 0.0 : change.details;
    if (initial != null && change.uuid == initial?.uuid) {
      delta = change.hidden
          ? -initial?.details
          : (initial!.hidden
              ? change.details
              : change.details - initial?.details);
    }
    return delta;
  }

  double getPrevDelta() {
    return initial!.hidden ? 0.0 : initial?.details;
  }

  BillRecalculation updateAccount(
      AccountAppData accountChange, AccountAppData? accountInitial) {
    if (accountInitial != null &&
        accountChange.uuid != accountInitial.uuid &&
        accountInitial.createdAt.isBefore(initial!.createdAt)) {
      accountInitial.details +=
          reform(getPrevDelta(), initial?.currency, accountInitial.currency);
    }
    if (accountChange.createdAt.isBefore(change.createdAt)) {
      accountChange.details -=
          reform(getDelta(), change.currency, accountChange.currency);
    }
    return this;
  }

  BillRecalculation updateBudget(
      BudgetAppData budgetChange, BudgetAppData? budgetInitial) {
    DateTime now = DateTime.now();
    if (DateTime(now.year, now.month).isAfter(change.createdAt)) {
      return this;
    }
    if (budgetInitial != null && budgetChange.uuid != budgetInitial.uuid) {
      double prevDelta =
          reform(getPrevDelta(), initial?.currency, budgetInitial.currency);
      budgetInitial.progress = getProgress(
          budgetInitial.amountLimit, budgetInitial.progress, -prevDelta);
    }
    double delta = reform(getDelta(), change.currency, budgetChange.currency);
    budgetChange.progress =
        getProgress(budgetChange.amountLimit, budgetChange.progress, delta);
    return this;
  }

  @override
  BillRecalculation updateTotal(
      SummaryAppData? summary, HashMap<String, dynamic> hashTable) {
    var list = summary?.listActual;
    summary?.total = getDelta() +
        (list == null || list.isEmpty
            ? 0.0
            : list
                .map<double>((String uuid) => hashTable[uuid].details as double)
                .reduce((value, details) => value + details));
    return this;
  }
}
