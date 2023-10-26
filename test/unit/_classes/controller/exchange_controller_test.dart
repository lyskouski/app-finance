// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/exchange_controller.dart';
import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<AppData>()])
import 'exchange_controller_test.mocks.dart';

@GenerateWithMethodSetters([MockAppData])
import 'exchange_controller_test.wrapper.dart';

void main() {
  group('ExchangeController', () {
    test('_updateSum | _updateRate', () {
      final editor = TextEditingController(text: '10');
      final controller = ExchangeController(
        {},
        store: WrapperMockAppData(),
        source: [CurrencyProvider.find('USD')],
        target: CurrencyProvider.find('EUR'),
        targetController: editor,
      );
      expect(controller.get(0).from, 'EUR');
      expect(controller.get(0).to, 'USD');
      editor.text = '123.02';
      expect(controller.get(0).rate.text, '1.0');
      expect(controller.get(0).sum.text, '123.02');
      controller.get(0).rate.text = '2.0';
      expect(controller.get(0).sum.text, '246.04');
      controller.get(0).sum.text = '62.51';
      expect(double.parse(controller.get(0).rate.text).toStringAsFixed(1), '0.5');
    });
  });
}
