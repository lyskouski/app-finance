// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/storage/file_parser.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  group('FileParser prediction', () {
    final prediction = BudgetPrediction()
      ..add(BillAppData(account: 'account', category: 'predicted', title: 'Coffee Shop'));
    final line = ['Coffee Shop', '4.5', '2026-01-01', 'Groceries'];
    final def = {
      FileParser.attrAccountName: 'account',
      FileParser.attrCategoryName: 'default',
      FileParser.defDateFormat: 'yyyy-MM-dd',
    };

    FileParser parser(List<String> columnMap) => FileParser(
          columnMap: columnMap,
          search: (type, value) => null,
          add: (item) => item..uuid ??= 'new',
          prediction: prediction,
        );

    test('predicts the category when the file has no category column', () async {
      final item = await parser([FileParser.attrBillComment, FileParser.attrBillAmount, FileParser.attrBillDate, '']).parseFileLine(line, def);

      expect((item as BillAppData).category, 'predicted');
    });

    test('keeps the category from the file', () async {
      final item = await parser(
              [FileParser.attrBillComment, FileParser.attrBillAmount, FileParser.attrBillDate, FileParser.attrCategoryName])
          .parseFileLine(line, def);

      expect((item as BillAppData).category, isNot('predicted'));
    });
  });
}
