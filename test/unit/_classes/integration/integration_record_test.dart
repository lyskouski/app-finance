// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IntegrationRecord', () {
    test('uses the top predicted category for an expense', () {
      final prediction = BudgetPrediction()
        ..add(BillAppData(account: 'account', category: 'predicted', title: 'Coffee Shop'));

      final result = IntegrationRecord.toAppData(
        amount: -4.5,
        currency: null,
        date: DateTime(2026),
        title: 'Coffee Shop',
        account: 'account',
        category: 'default',
        prediction: prediction,
      ) as BillAppData;

      expect(result.category, 'predicted');
    });

    test('uses the default category when there is no prediction', () {
      final result = IntegrationRecord.toAppData(
        amount: -4.5,
        currency: null,
        date: DateTime(2026),
        title: 'Coffee Shop',
        account: 'account',
        category: 'default',
        prediction: BudgetPrediction(),
      ) as BillAppData;

      expect(result.category, 'default');
    });
  });
}
