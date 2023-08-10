// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/currency/exchange.dart';
import 'package:app_finance/_classes/data/goal_app_data.dart';
import 'package:app_finance/_classes/data/total_recalculation.dart';
import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<Exchange>()])
import 'account_recalculation_test.mocks.dart';
@GenerateWithMethodSetters([MockExchange])
import 'account_recalculation_test.wrapper.dart';

void main() {
  group('TotalRecalculation', () {
    late TotalRecalculation object;

    setUp(() {
      final exchange = WrapperMockExchange();
      exchange.mockReform = (double? v, Currency? from, Currency? to) => v ?? 0.0;
      object = TotalRecalculation(
        exchange: exchange,
      );
    });

    group('updateGoals', () {
      late List<GoalAppData> goals;

      setUp(() {
        goals = [
          GoalAppData(title: '1', initial: 0.0, details: 25.0, progress: 0.0),
          GoalAppData(title: '2', initial: 0.0, details: 50.0, progress: 0.0),
          GoalAppData(title: '3', initial: 0.0, details: 100.0, progress: 0.0),
        ];
      });

      final testCases = [
        (initTotal: 0.0, total: 0.0, initial: [0.0, 0.0, 0.0], progress: [0.0, 0.0, 0.0], result: [0.0, 0.0, 0.0]),
        (initTotal: 0.0, total: 200.0, initial: [0.0, 0.0, 0.0], progress: [0.0, 0.0, 0.0], result: [1.0, 1.0, 1.0]),
        (initTotal: 0.0, total: 30.0, initial: [0.0, 0.0, 0.0], progress: [0.0, 0.0, 0.0], result: [0.4, 0.2, 0.1]),
        (initTotal: 0.0, total: 75.0, initial: [0.0, 0.0, 0.0], progress: [0.0, 0.0, 0.0], result: [1.0, 0.5, 0.25]),
        (initTotal: 0.0, total: 100.0, initial: [0.0, 0.0, 0.0], progress: [0.0, 0.0, 0.0], result: [1.0, 0.75, 0.375]),
        (
          initTotal: 200.0,
          total: 100.0,
          initial: [0.0, 0.0, 0.0],
          progress: [1.0, 1.0, 1.0],
          result: [1.0, 1.0, 0.0],
        ),
        (
          initTotal: 200.0,
          total: 100.0,
          initial: [100.0, 100.0, 100.0],
          progress: [1.0, 1.0, 1.0],
          result: [0.0, 0.333, 0.666],
        ),
      ];

      for (var v in testCases) {
        test('$v', () {
          for (int i = 0; i < v.progress.length; i++) {
            goals[i].progress = v.progress[i];
            goals[i].initial = v.initial[i];
          }
          object.updateGoals(goals, v.initTotal, v.total);
          for (int i = 0; i < v.result.length; i++) {
            expect(goals[i].progress, closeTo(v.result[i], 0.001));
          }
        });
      }
    });
  });
}
