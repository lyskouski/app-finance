// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:intl/intl.dart';

extension DoubleExt on double {
  String toCurrency([Currency? currency]) {
    currency = currency ?? Exchange.defaultCurrency;
    final NumberFormat formatter = NumberFormat.currency(
      locale: AppLocale.code,
      symbol: currency?.symbol ?? '?',
      decimalDigits: currency?.decimalDigits ?? 2,
    );
    return formatter.format(this);
  }
}
