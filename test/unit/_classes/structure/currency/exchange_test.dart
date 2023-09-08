// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/currency_app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>(), MockSpec<AppData>()])
import 'exchange_test.mocks.dart';
@GenerateWithMethodSetters([MockAppData])
import 'exchange_test.wrapper.dart';

void main() {
  group('Exchange', () {
    late Exchange object;

    setUp(() {
      AppPreferences.pref = MockSharedPreferences();
      object = Exchange(store: WrapperMockAppData());
    });

    tearDown(() => resetMockitoState());

    group('getDefaultCurrency', () {
      final testCases = [
        (def: null, getPreference: null, result: 'EUR'),
        (def: null, getPreference: 'USD', result: 'USD'),
        (def: 'JPY', getPreference: 'USD', result: 'JPY'),
        (def: null, getPreference: 'ABC', result: 'EUR'),
      ];

      for (var v in testCases) {
        test('$v', () {
          when(AppPreferences.pref.getString('currency')).thenReturn(v.getPreference);
          Exchange.defaultCurrency = CurrencyProvider.findByCode(v.def);
          expect(object.getDefaultCurrency()?.code, v.result);
        });
      }
    });

    group('reform', () {
      final testCases = [
        (amount: null, origin: 'USD', target: 'EUR', rate: 0.5, result: 0.0),
        (amount: 1.0, origin: 'USD', target: 'EUR', rate: 0.5, result: 0.5),
        (amount: 1.0, origin: 'USD', target: 'EUR', rate: null, result: 1.0),
      ];

      for (var v in testCases) {
        test('$v', () {
          final origin = CurrencyProvider.findByCode(v.origin);
          final target = CurrencyProvider.findByCode(v.target);
          CurrencyAppData? exchange;
          if (v.rate != null) {
            exchange = CurrencyAppData(
              currency: target,
              currencyFrom: origin,
              details: v.rate,
            );
          }
          CurrencyAppData? assertObject;
          (object.store as WrapperMockAppData).mockGetByUuid = (_, [bool? v]) => exchange;
          (object.store as WrapperMockAppData).mockAdd =
              (value, [String? uuid]) => assertObject = value as CurrencyAppData;
          expect(object.reform(v.amount, origin, target), v.result);
          if (v.rate == null) {
            assert(assertObject is CurrencyAppData);
            expect(assertObject!.currencyFrom, origin);
            expect(assertObject!.currency, target);
          }
        });
      }
    });
  });
}
