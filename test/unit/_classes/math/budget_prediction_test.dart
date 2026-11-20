// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:flutter_test/flutter_test.dart';

BillAppData bill(String title, String category, {String account = 'card', double details = 12.5, String? uuid}) =>
    BillAppData(uuid: uuid, account: account, category: category, title: title, details: details, hidden: false);

void main() {
  group('BudgetPrediction', () {
    test('returns nothing without a match instead of every known category', () {
      final prediction = BudgetPrediction()
        ..add(bill('Coffee Shop', 'cafe', account: 'cash', details: 4000))
        ..add(bill('Fuel Station', 'car', account: 'cash', details: 4000));

      expect(prediction.predict(bill('Cinema Tickets', '', account: 'card', details: 3)), isEmpty);
      expect(prediction.predict(bill('Coffee Shop', '', account: 'card', details: 3)), ['cafe']);
    });

    test('learns titles in any script', () {
      final prediction = BudgetPrediction()
        ..add(bill('Сільпо Київ', 'food'))
        ..add(bill('ბენზინი Gulf', 'car'));

      expect(prediction.predict(bill('СІЛЬПО', '', account: 'other')), ['food']);
      expect(prediction.predict(bill('ბენზინი', '', account: 'other')), ['car']);
    });

    test('does not prefer a small category by the account', () {
      final prediction = BudgetPrediction();
      for (var i = 0; i < 9; i++) {
        prediction.add(bill('Market $i', 'food', account: 'card'));
      }
      prediction.add(bill('Gift', 'gifts', account: 'card'));

      expect(prediction.predict(bill('', '', account: 'card')), ['food']);
    });

    test('unlearns changed and removed bills', () {
      final prediction = BudgetPrediction()..add(bill('Coffee Shop', 'food', uuid: '1'));
      expect(prediction.predict(bill('Coffee Shop', '')), ['food']);

      prediction.add(bill('Coffee Shop', 'cafe', uuid: '1'));
      expect(prediction.predict(bill('Coffee Shop', '')), ['cafe']);

      prediction.add(bill('Coffee Shop', 'cafe', uuid: '1')..hidden = true);
      expect(prediction.predict(bill('Coffee Shop', '')), isEmpty);
    });

    test('skips removed budget categories and bills without a category', () {
      final prediction = BudgetPrediction(isValid: (uuid) => uuid != 'removed')
        ..add(bill('Coffee Shop', 'removed'))
        ..add(bill('Coffee Shop', ''));

      expect(prediction.predict(bill('Coffee Shop', '')), isEmpty);
    });
  });
}
