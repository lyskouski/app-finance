// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/_classes/structure/summary_app_data.dart';
import 'package:app_finance/_classes/math/total_recalculation.dart';
import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<Exchange>()])
import 'total_recalculation_test.mocks.dart';
@GenerateWithMethodSetters([MockExchange, SummaryAppData, TotalRecalculation])
import 'total_recalculation_test.wrapper.dart';

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

    test('getDelta (UnimplementedError)', () {
      expect(() => object.getDelta(), throwsA(isA<UnimplementedError>()));
    });

    group('updateTotalMap', () {
      final hashTable = HashMap<String, dynamic>();
      hashTable['in-table'] = GoalAppData(initial: 1.0, details: 1.0, title: '');

      final testCases = [
        (type: AppDataType.goals, uuid: 'in-table', progress: 1.0, result: 0.0),
        (type: AppDataType.goals, uuid: 'in-table', progress: 0.2, result: 0.8),
        (type: AppDataType.accounts, uuid: 'in-table', progress: 1.0, result: 1.0),
        (type: AppDataType.goals, uuid: 'not-in-table', progress: 1.0, result: 0.0),
      ];

      for (var v in testCases) {
        test('$v', () {
          hashTable['in-table'].progress = v.progress;
          expect(object.updateTotalMap(v.type, v.uuid, hashTable), v.result);
        });
      }
    });

    group('getSummaryList', () {
      final testCases = [
        (type: AppDataType.accounts, isActualList: false),
        (type: AppDataType.bills, isActualList: true),
        (type: AppDataType.budgets, isActualList: true),
        (type: AppDataType.currencies, isActualList: false),
        (type: AppDataType.goals, isActualList: false),
      ];

      for (var v in testCases) {
        test('$v', () {
          final summary = WrapperSummaryAppData(list: [], total: 0.0);
          summary.mockListActual = ['1', '2', '3'];
          summary.mockList = ['4', '5', '6'];
          expect(object.getSummaryList(v.type, summary), v.isActualList ? summary.listActual : summary.list);
        });
      }
    });

    group('updateTotal', () {
      final testCases = [
        (list: null, total: 1.0, result: 0.0),
        (list: ['1', '2', '3'], total: 1.0, result: 3.0),
      ];

      for (var v in testCases) {
        test('$v', () async {
          final obj = WrapperTotalRecalculation(exchange: object.exchange);
          obj.mockGetSummaryList = (AppDataType type, SummaryAppData? obj) => v.list;
          obj.mockUpdateTotalMap = (type, uuid, hashTable) => v.total;
          final summary = SummaryAppData(list: [], total: 0.0);
          await obj.updateTotal(AppDataType.bills, summary, HashMap<String, dynamic>());
          expect(summary.total, v.result);
        });
      }
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
