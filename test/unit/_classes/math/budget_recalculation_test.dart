// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/math/budget_recalculation.dart';
import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateWithMethodSetters([BudgetRecalculation])
import 'budget_recalculation_test.wrapper.dart';

void main() {
  group('BudgetRecalculation', () {
    late BudgetRecalculation object;

    setUp(() {
      final budgetMock = BudgetAppData(
        uuid: '1',
        title: 'test',
      );
      object = BudgetRecalculation(
        initial: budgetMock.clone(),
        change: budgetMock.clone(),
      );
    });

    group('getDelta', () {
      final testCases = [
        (
          initial: (hidden: true, progress: 0.0, amountLimit: 10.0),
          change: (hidden: true, progress: 0.0, amountLimit: 20.0),
          result: 0.0,
        ),
        (
          initial: (hidden: false, progress: 0.5, amountLimit: 10.0),
          change: (hidden: false, progress: 0.5, amountLimit: 20.0),
          result: 0.25,
        ),
        (
          initial: (hidden: false, progress: 0.5, amountLimit: 20.0),
          change: (hidden: false, progress: 0.5, amountLimit: 10.0),
          result: 1.0,
        ),
        (
          initial: (hidden: false, progress: 0.5, amountLimit: 80.0),
          change: (hidden: false, progress: 0.5, amountLimit: 20.0),
          result: 2.0,
        ),
        (
          initial: (hidden: true, progress: 0.5, amountLimit: 10.0),
          change: (hidden: false, progress: 0.5, amountLimit: 20.0),
          result: 0.0,
        ),
        (
          initial: (hidden: false, progress: 0.5, amountLimit: 10.0),
          change: (hidden: true, progress: 0.5, amountLimit: 20.0),
          result: 0.0,
        ),
        (
          initial: null,
          change: (hidden: false, progress: 0.5, amountLimit: 20.0),
          result: 0.0,
        ),
      ];

      for (var v in testCases) {
        test('$v', () {
          if (v.initial == null) {
            object.initial = null;
          } else {
            object.initial!.hidden = v.initial!.hidden;
            object.initial!.amountLimit = v.initial!.amountLimit;
            object.initial!.progress = v.initial!.progress;
          }
          object.change.hidden = v.change.hidden;
          object.change.amountLimit = v.change.amountLimit;
          object.change.progress = v.change.progress;

          expect(object.getDelta(), v.result);
        });
      }
    });

    test('updateBudget (change.progress: 0.5)', () {
      final obj = WrapperBudgetRecalculation(initial: object.initial, change: object.change);
      double result = 0.5;
      obj.mockGetDelta = () => result;
      expect(obj.change.progress, 0.0);
      obj.updateBudget();
      expect(obj.change.progress, result);
    });
  });
}
