// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/summary_app_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SummaryAppData', () {
    late SummaryAppData object;

    setUp(() {
      object = SummaryAppData(list: ['init'], total: 0);
    });

    group('add', () {
      final current = DateTime.now();
      final testCases = [
        (item: '1', date: DateTime(current.year, current.month, current.day), listLength: 2, activeLength: 1),
        (item: '1', date: DateTime(current.year, current.month - 1, current.day), listLength: 2, activeLength: 0),
      ];

      for (var v in testCases) {
        test('$v', () {
          object.add(v.item, updatedAt: v.date);
          expect(object.list.length, v.listLength);
          expect(object.listActual.length, v.activeLength);
        });
      }
    });
  });
}
