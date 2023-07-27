// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

mixin FormatterMixin {
  static final Map<String, IconData> _cache = {};
  BuildContext? _context;
  Currency? currency;

  dynamic updateContext(BuildContext context) {
    _context = context;
    return this;
  }

  BuildContext? getContext() => _context;

  String getDateFormatted(DateTime date) {
    final locale = Localizations.localeOf(_context!).toString();
    final DateFormat formatterDate = DateFormat.yMEd(locale);
    return formatterDate.format(date);
  }

  String getNumberFormatted(double value) {
    final locale = Localizations.localeOf(_context!).toString();
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: currency?.symbol ?? '?',
      decimalDigits: 2,
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
