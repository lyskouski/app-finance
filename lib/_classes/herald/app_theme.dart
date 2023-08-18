// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:flutter/material.dart';

class AppTheme extends ValueNotifier<ThemeMode> with SharedPreferencesMixin {
  AppTheme(ThemeMode value) : super(value) {
    final val = getPreference(prefTheme);
    if (val != null) {
      _set(val);
    }
  }

  _set(String val) {
    int? idx = int.tryParse(val);
    if (idx != null) {
      final newValue = ThemeMode.values[idx];
      if (newValue != value) {
        value = newValue;
        notifyListeners();
      }
    }
  }

  updateState(String value) {
    setPreference(prefTheme, value).then((_) {
      _set(value);
    });
  }
}
