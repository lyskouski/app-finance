// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:app_finance/_mixins/formatter_mixin.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateWithMethodSetters([FormatterMixin])
import 'formatter_mixin_test.wrapper.dart';

void main() {
  group('FormatterMixin', () {
    final object = WrapperFormatterMixin();

    group('getDateFormatted', () {
      final testCases = [
        (date: [2023, 8, 13], locale: null, result: 'Sun, 8/13/2023'),
        //(date: [2023, 8, 13], locale: 'de', result: 'Sonne, 13/8/2023'), // Err: Locale data has not been initialized
      ];

      for (var v in testCases) {
        test('$v', () {
          final date = DateTime(v.date[0], v.date[1], v.date[2]);
          expect(object.getDateFormatted(date), v.result);
        });
      }
    });
  });
}
