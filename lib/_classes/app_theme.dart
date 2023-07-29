// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier with SharedPreferencesMixin {
  final ValueNotifier<ThemeMode> theme =
      ValueNotifier<ThemeMode>(ThemeMode.system);

  AppTheme() {
    getPreference(prefTheme).then((value) {
      if (value != null) {
        _set(value);
      }
    });
  }

  _set(String value) {
    int? idx = int.tryParse(value);
    if (idx != null) {
      theme.value = ThemeMode.values[idx];
      notifyListeners();
    }
  }

  updateState(String value) {
    setPreference(prefTheme, value).then((_) {
      _set(value);
    });
  }
}
