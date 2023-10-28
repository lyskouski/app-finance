// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';

import 'package:app_finance/_classes/controller/iterator_controller.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/transaction_log_data.dart';
import 'package:app_finance/_ext/iterable_ext.dart';

class HistoryData {
  static final _history = HashMap<String, SplayTreeMap<int, TransactionLogData>>();

  static void addLog(uuid, dynamic initial, dynamic initialValue, dynamic value, [String? ref]) {
    if (_history[uuid] == null) {
      _history[uuid] = SplayTreeMap<int, TransactionLogData>();
    }
    if (initialValue != value) {
      _history[uuid]![-initial.createdAt.millisecondsSinceEpoch] = TransactionLogData(
        timestamp: initial.createdAt,
        ref: ref,
        currency: initial.currency,
        name: 'details',
        changedFrom: initialValue,
        changedTo: value,
      );
    }
  }

  static List<TransactionLogData>? getLog(String uuid) {
    return _history[uuid]?.values.map((e) => e.clone()).toList();
  }

  static InterfaceIterator<int, dynamic, TransactionLogData>? getStream(String uuid) =>
      _history[uuid]?.toStream<TransactionLogData>(false, transform: (e) => e.clone());

  static List<List<TransactionLogData>?> getMultiLog(List<InterfaceAppData> scope) {
    return scope.map((e) => getLog(e.uuid!)).toList();
  }
}
