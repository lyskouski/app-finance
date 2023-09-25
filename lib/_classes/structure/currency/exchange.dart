// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/currency_app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class Exchange {
  AppData store;
  static Currency? defaultCurrency;

  Exchange({
    required this.store,
  });

  Currency? getDefaultCurrency() {
    defaultCurrency ??= CurrencyProvider.find(AppPreferences.get(AppPreferences.prefCurrency));
    defaultCurrency ??= CurrencyProvider.find('EUR');
    return defaultCurrency;
  }

  double reform(double? amount, Currency? origin, Currency? target) {
    amount ??= 0.0;
    if (origin != null && target != null && origin.code != target.code) {
      CurrencyAppData? ex = store.getByUuid('${origin.code}-${target.code}');
      if (ex == null) {
        ex = CurrencyAppData(
          currency: target,
          currencyFrom: origin,
        );
        store.add(ex);
      }
      amount *= ex.details;
    }
    return amount;
  }
}
