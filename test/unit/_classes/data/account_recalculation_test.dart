// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/data/account_recalculation.dart';
import 'package:app_finance/_classes/data/goal_app_data.dart';
import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:app_finance/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AccountRecalculation>()])
import 'account_recalculation_test.mocks.dart';
@GenerateWithMethodSetters([AccountRecalculation])
import 'account_recalculation_test.wrapper.dart';

void main() {
  group('AccountRecalculation', () {
    late AccountRecalculation object;

    setUp(() {
      final accountMock = AccountAppData(
        uuid: '1',
        title: 'test',
        type: AppAccountType.account.toString(),
      );
      object = AccountRecalculation(
        initial: accountMock.clone(),
        change: accountMock.clone(),
      );
    });

    group('getDelta', () {
      final testCases = [
        (
          initial: (hidden: false, details: 5.0),
          change: (hidden: false, details: 1.0),
          result: -4.0
        ),
        (
          initial: (hidden: false, details: 1.0),
          change: (hidden: false, details: 5.0),
          result: 4.0
        ),
        (
          initial: (hidden: true, details: 2.0),
          change: (hidden: false, details: 3.0),
          result: 3.0
        ),
        (
          initial: (hidden: false, details: 2.0),
          change: (hidden: true, details: 3.0),
          result: -2.0
        ),
      ];

      for (var v in testCases) {
        test('$v', () {
          object.initial!.hidden = v.initial.hidden;
          object.initial!.details = v.initial.details;
          object.change.hidden = v.change.hidden;
          object.change.details = v.change.details;
          expect(object.getDelta(), v.result);
        });
      }
    });

    group('getProgress', () {
      final testCases = [
        (amount: 0.0, progress: 0.0, delta: 0.0, result: 0.0),
        (amount: 0.0, progress: 0.5, delta: 10.0, result: 0.0),
        (amount: 100.0, progress: 0.1, delta: 10.0, result: 0.2),
      ];

      for (var v in testCases) {
        test('$v', () {
          expect(object.getProgress(v.amount, v.progress, v.delta), v.result);
        });
      }
    });

    group('updateGoals', () {
      late List<GoalAppData> goals;

      setUp(() {
        goals = [
          GoalAppData(title: '1', details: 25.0, progress: 0.0),
          GoalAppData(title: '2', details: 50.0, progress: 0.0),
          GoalAppData(title: '3', details: 100.0, progress: 0.0),
        ];
      });

      final testCases = [
        (getDelta: 0.0, progress: [0.0, 0.0, 0.0], result: [0.0, 0.0, 0.0]),
        (getDelta: 200.0, progress: [0.0, 0.0, 0.0], result: [1.0, 1.0, 1.0]),
        (getDelta: 30.0, progress: [0.0, 0.0, 0.0], result: [0.4, 0.2, 0.1]),
        (getDelta: 75.0, progress: [0.0, 0.0, 0.0], result: [1.0, 0.5, 0.25]),
        (
          getDelta: 100.0,
          progress: [0.0, 0.0, 0.0],
          result: [1.0, 0.75, 0.375]
        ),
        (
          getDelta: -100.0,
          progress: [1.0, 1.0, 1.0],
          result: [0.0, 0.333, 0.666]
        ),
      ];

      for (var v in testCases) {
        test('$v', () {
          final mock = MockAccountRecalculation();
          final wrapper = WrapperAccountRecalculation(
              change: object.change, initial: object.initial);
          when(mock.getDelta()).thenReturn(v.getDelta);
          wrapper.mockGetDelta = mock.getDelta;
          for (int i = 0; i < v.progress.length; i++) {
            goals[i].progress = v.progress[i];
          }
          wrapper.updateGoals(goals);
          verify(mock.getDelta()).called(1);
          for (int i = 0; i < v.result.length; i++) {
            expect(goals[i].progress, closeTo(v.result[i], 0.001));
          }
        });
      }
    });
  });
}
