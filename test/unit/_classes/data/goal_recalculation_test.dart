// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/data/goal_app_data.dart';
import 'package:app_finance/_classes/data/goal_recalculation.dart';
import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateWithMethodSetters([GoalRecalculation])
import 'goal_recalculation_test.wrapper.dart';

void main() {
  group('GoalRecalculation', () {
    late GoalRecalculation object;

    setUp(() {
      object = GoalRecalculation(
        change: GoalAppData(initial: 0.0, title: ''),
        initial: GoalAppData(initial: 0.0, title: ''),
      );
    });

    group('getDelta', () {
      final testCases = [
        (initial: null, change: (progress: 0.5, details: 1.0, hidden: false), result: 0.0),
        (initial: null, change: (progress: 0.5, details: 1.0, hidden: true), result: 0.0),
        (initial: (progress: 0.5, details: 1.0), change: (progress: 0.6, details: 1.2, hidden: true), result: 0.0),
        (initial: (progress: 0.1, details: 5.0), change: (progress: 0.1, details: 10.0, hidden: false), result: 1.1),
      ];

      for (var v in testCases) {
        test('$v', () {
          if (v.initial == null) {
            object.initial = null;
          } else {
            object.initial!.progress = v.initial!.progress;
            object.initial!.details = v.initial!.details;
          }
          object.change.progress = v.change.progress;
          object.change.details = v.change.details;
          object.change.hidden = v.change.hidden;
          expect(object.getDelta(), v.result);
        });
      }
    });

    test('updateGoal (change.progress: 0.0, getDelta: 0.5, result: 0.5)', () {
      final obj = WrapperGoalRecalculation(change: object.change, initial: object.initial);
      double result = 0.5;
      obj.mockGetDelta = () => result;
      expect(obj.change.progress, 0.0);
      obj.updateGoal();
      expect(obj.change.progress, result);
    });
  });
}
