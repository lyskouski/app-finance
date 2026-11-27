// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  final now = DateTime.now().toIso8601String();
  Map<String, dynamic> base([List<dynamic>? tags]) => {
        'uuid': 'uuid',
        'title': 'title',
        'account': 'a',
        'category': 'b',
        'details': 1,
        'currency': null,
        'createdAt': now,
        'updatedAt': now,
        'hidden': false,
        if (tags != null) 'tags': tags,
      };

  group('BillAppData.tags', () {
    test('restored', () => expect(BillAppData.fromJson(base(['food', 'trip'])).tags, ['food', 'trip']));

    test('missing in legacy data', () => expect(BillAppData.fromJson(base()).tags, isEmpty));

    test('clone is detached', () {
      final bill = BillAppData(account: 'a', category: 'b', tags: ['food']);
      final copy = bill.clone()..tags.add('trip');
      expect(bill.tags, ['food']);
      expect(copy.tags, ['food', 'trip']);
    });
  });

  group('InvoiceAppData.tags', () {
    test('restored', () => expect(InvoiceAppData.fromJson(base(['salary'])).tags, ['salary']));

    test('missing in legacy data', () => expect(InvoiceAppData.fromJson(base()).tags, isEmpty));

    test('clone is detached', () {
      final invoice = InvoiceAppData(title: 't', account: 'a', tags: ['salary']);
      final copy = invoice.clone()..tags.clear();
      expect(invoice.tags, ['salary']);
      expect(copy.tags, isEmpty);
    });
  });
}
