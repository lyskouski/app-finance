// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/transaction_log_data.dart';
import 'package:app_finance/charts/interface/ohlc_data.dart';
import 'package:flutter/material.dart';

class DataHandler {
  static void deactivate(NavigatorState nav, {required AppData store, String? uuid, InterfaceAppData? data}) {
    assert(uuid != null || data != null);
    final obj = data ?? store.getByUuid(uuid!);
    obj.deactivate();
    store.update(obj.uuid, obj);
    store.restate();
    nav.pop();
  }

  static double countBudgetTotal(List<InterfaceAppData> scope, {required Exchange exchange}) {
    final currency = exchange.getDefaultCurrency();
    return scope.fold(0.0, (v, e) => v + exchange.reform((e as BudgetAppData).amountLimit, e.currency, currency));
  }

  static List<Offset> getAmountGroupedByDate(List<InterfaceAppData> scope, {required Exchange exchange}) {
    final data = SplayTreeMap<int, List<double>>();
    final currency = exchange.getDefaultCurrency();
    for (final item in scope) {
      int actual = DateTime(item.createdAt.year, item.createdAt.month, item.createdAt.day).microsecondsSinceEpoch;
      if (data[actual] == null) {
        data[actual] = [];
      }
      data[actual]!.add(exchange.reform(item.details, item.currency, currency));
    }
    final List<Offset> result = [];
    data.forEach((key, value) => result.add(Offset(key.toDouble(), value.fold(0.0, (v, e) => v + e))));
    return result;
  }

  static List<OhlcData> generateOhlcSummary(List<InterfaceAppData> scope, {required Exchange exchange}) {
    return [];
  }

  static List<OhlcData> generateOhlc(List<TransactionLogData> scope) {
    // date,open,high,low,close
    return [];
  }
}
