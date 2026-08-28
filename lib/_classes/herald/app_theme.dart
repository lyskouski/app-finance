// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:flutter/material.dart';

class AppTheme extends ValueNotifier<ThemeMode> {
  AppTheme(super.value) {
    final val = AppPreferences.get(AppPreferences.prefTheme);
    if (val != null) {
      _set(val);
    }
  }

  _set(String val) {
    int? idx = int.tryParse(val);
    if (idx != null && idx < ThemeMode.values.length) {
      final newValue = ThemeMode.values[idx];
      if (newValue != value) {
        value = newValue;
        notifyListeners();
      }
    }
  }

  Future<void> setTheme(String value) async {
    await AppPreferences.set(AppPreferences.prefTheme, value);
    _set(value);
  }
}
