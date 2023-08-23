// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

mixin FormatterMixin {
  static final Map<String, IconData> _cache = {};
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

  String getNumberFormatted(double value, [String? symbol]) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: AppLocale.code,
      symbol: symbol ?? currency?.symbol ?? '?',
      decimalDigits: currency?.decimalDigits ?? 2,
    );
    return formatter.format(value);
  }

  static IconData getIconFromString(int icon) {
    if (_cache.containsKey(icon)) {
      return _cache[icon]!;
    } else {
      const String fontFamily = 'MaterialIcons';
      return IconData(icon, fontFamily: fontFamily);
    }
  }
}
