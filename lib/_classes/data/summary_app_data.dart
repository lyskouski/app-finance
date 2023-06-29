// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:collection';

class SummaryAppData {
  final _scope = SplayTreeMap<int, String>();
  final _actual = SplayTreeMap<int, String>();
  final _hash = HashMap<String, int>();
  double total;

  SummaryAppData({
    required this.total,
    required List<String> list,
  }) {
    this.list = list;
  }

  List<String> get list => _scope.values.toList().reversed.toList();

  List<String> get listActual => _actual.values.toList().reversed.toList();

  set list(List<String> list) {
    for (int i = 0; i < list.length; i++) {
      add(list[i], i + 1);
    }
  }

  add(String value, [int? id]) {
    if (_hash.containsKey(value)) {
      _scope.remove(_hash[value]);
      _actual.remove(_hash[value]);
      _hash.remove(value);
    }
    DateTime now = DateTime.now();
    int key = id ?? now.millisecondsSinceEpoch;
    _scope[key] = value;
    _hash[value] = key; 
    if (key >= DateTime(now.year, now.month).millisecondsSinceEpoch) {
      _actual[key] = value;
    }
  }
}