// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';
import 'dart:math';

import 'package:app_finance/_ext/date_time_ext.dart';

class SummaryAppData {
  final _scope = SplayTreeMap<double, String>();
  final _actual = SplayTreeMap<double, String>();
  final _hash = HashMap<String, double>();
  double total;
  int startingDay;

  SummaryAppData({
    this.total = 0,
    this.startingDay = 1,
    List<String> list = const [],
  }) {
    this.list = list;
  }

  SplayTreeMap<double, String> get origin => _scope;

  List<String> get list => _scope.values.toList().reversed.toList();

  List<String> get listActual => _actual.values.toList().reversed.toList();

  set list(List<String> list) {
    for (int i = 0; i < list.length; i++) {
      add(list[i], id: i + 1);
    }
  }

  add(String value, {DateTime? updatedAt, int? id}) {
    if (_hash.containsKey(value)) {
      _scope.remove(_hash[value]);
      _actual.remove(_hash[value]);
      _hash.remove(value);
    }
    final current = DateTime.now();
    updatedAt ??= current;
    double key = (id ?? updatedAt.millisecondsSinceEpoch).toDouble() + Random().nextDouble();
    _scope[key] = value;
    _hash[value] = key;
    if (key >= current.getStartingDay(startingDay).millisecondsSinceEpoch) {
      _actual[key] = value;
    }
  }
}
