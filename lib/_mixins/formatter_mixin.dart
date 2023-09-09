// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_ext/double_ext.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:intl/intl.dart';

mixin FormatterMixin {
  Currency? currency;

  String getDateFormatted(DateTime date) {
    DateFormat formatterDate;
    try {
      formatterDate = DateFormat.yMEd(AppLocale.code);
    } catch (e) {
      formatterDate = DateFormat.yMEd('en_US');
    }
    return formatterDate.format(date);
  }

  @Deprecated('use double extension')
  String getNumberFormatted(double value, [String? symbol]) {
    return value.toCurrency(symbol != null ? CurrencyProvider.findByCode(symbol) : currency);
  }
}
