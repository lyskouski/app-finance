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

  dynamic setContext(BuildContext context) {
    _context = context;
    return this;
  }

  BuildContext? getContext() => _context;

  String? getLocale() {
    return Localizations.localeOf(_context!).toString();
  }

  String getDateFormatted(DateTime date) {
    final DateFormat formatterDate = DateFormat.yMEd(getLocale());
    return formatterDate.format(date);
  }

  String getNumberFormatted(double value) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: getLocale(),
      symbol: currency?.symbol ?? '?',
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
