// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class AppPalette extends ValueNotifier<String> {
  static get state => AppPreferences.get(AppPreferences.prefColor) ?? AppColors.colorApp;

  AppPalette() : super(state);

  Future<void> setMode(String newValue) async {
    if (newValue != value) {
      value = newValue;
      await AppPreferences.set(AppPreferences.prefColor, value);
      notifyListeners();
    }
  }
}
