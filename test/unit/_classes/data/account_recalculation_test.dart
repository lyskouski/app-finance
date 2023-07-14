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
        [false, 5.0, false, 1.0, -4.0],
        [false, 1.0, false, 5.0, 4.0],
        [true, 2.0, false, 3.0, 3.0],
        [false, 2.0, true, 3.0, -2.0],
      ];

      for (var v in testCases) {
        test(
            '[returned ${v[4]}] from(hidden: ${v[0]}, details: ${v[1]}), to(hidden: ${v[2]}, details: ${v[3]})',
            () {
          object.initial!.hidden = v[0] as bool;
          object.initial!.details = v[1] as double;
          object.change.hidden = v[2] as bool;
          object.change.details = v[3] as double;
          expect(object.getDelta(), v[4]);
        });
      }

      test('[returned 2.0] from(null), to(hidden: false, details: 2.0)', () {
        object.initial = null;
        object.change.hidden = false;
        object.change.details = 2.0;
        expect(object.getDelta(), 2.0);
      });
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
