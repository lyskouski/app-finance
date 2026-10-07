// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/design/form/simple_input.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SimpleInputFormatter.filterDouble', () {
    final formatter = SimpleInputFormatter.filterDouble;

    test('keeps the full decimal value while editing', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: '12.34', selection: TextSelection.collapsed(offset: 4)),
        const TextEditingValue(text: '12.834', selection: TextSelection.collapsed(offset: 5)),
      );

      expect(result.text, '12.834');
      expect(double.tryParse(result.text), 12.834);
    });

    test('normalizes a comma decimal separator', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: '12', selection: TextSelection.collapsed(offset: 2)),
        const TextEditingValue(text: '12,34', selection: TextSelection.collapsed(offset: 5)),
      );

      expect(result.text, '12.34');
      expect(double.tryParse(result.text), 12.34);
    });

    test('rejects a second decimal separator without truncating the value', () {
      const oldValue = TextEditingValue(
        text: '12.34',
        selection: TextSelection.collapsed(offset: 2),
      );
      final result = formatter.formatEditUpdate(
        oldValue,
        const TextEditingValue(text: '12..34', selection: TextSelection.collapsed(offset: 3)),
      );

      expect(result, oldValue);
    });
  });
}
