// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/math/abstract_recalculation.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/summary_app_data.dart';

class TotalRecalculation extends AbstractRecalculation {
  @override
  // ignore: overridden_fields
  Exchange exchange;

  TotalRecalculation({
    required this.exchange,
  });

  @override
  double getDelta() {
    throw UnimplementedError();
  }

  double updateTotalMap(AppDataType type, String uuid, HashMap<String, dynamic> hashTable) {
    final item = hashTable[uuid];
    if (item == null || item.hidden) {
      return 0.0;
    }
    double total = exchange.reform(item.details, item.currency, Exchange.defaultCurrency);
    if (type == AppDataType.goals) {
      total *= (1 - item.progress);
    }
    return total;
  }

  List<String> getSummaryList(AppDataType type, SummaryAppData? summary) {
    if (summary == null) {
      return [];
    }
    return [AppDataType.bills, AppDataType.budgets, AppDataType.invoice].contains(type)
        ? summary.listActual
        : summary.list;
  }

  Future<void> updateTotal(AppDataType type, SummaryAppData? summary, HashMap<String, dynamic> hashTable) async {
    final list = getSummaryList(type, summary);
    summary?.total = list.isEmpty
        ? 0.0
        : list
            .map<double>((String uuid) => updateTotalMap(type, uuid, hashTable))
            .reduce((value, details) => value + details);
  }

  void updateGoals(dynamic goalList, double initTotal, double total) {
    double delta = total - initTotal;
    if (goalList.isNotEmpty) {
      int index = 0;
      delta /= goalList.length;
      goalList.forEach((dynamic goal) {
        index++;
        double convDelta = 0;
        if (delta > 0 && total <= goal.initial) {
          convDelta = exchange.reform(total, Exchange.defaultCurrency, goal.currency) - goal.initial;
        } else {
          convDelta = exchange.reform(delta, Exchange.defaultCurrency, goal.currency);
        }
        double progress = getProgress(goal.details, goal.progress, convDelta);
        if (progress > 1.0) {
          if (index < goalList.length) {
            delta += exchange.reform(goal.details * (progress - 1.0), goal.currency, Exchange.defaultCurrency) /
                (goalList.length - index);
          }
          progress = 1.0;
        }
        if (progress < 1.0 && goal.progress == 1.0 && goal.initial + goal.details < total) {
          progress = 1.0;
          delta += delta / (goalList.length - index);
        }
        if (progress < 0.0) {
          progress = 0.0;
        }
        goal.progress = progress;
      });
    }
  }
}
