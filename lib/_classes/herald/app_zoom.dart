// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:flutter/material.dart';

class AppZoom extends ValueNotifier<double> {
  static get state => double.tryParse(AppPreferences.get(AppPreferences.prefZoom) ?? '') ?? 1.0;

  AppZoom() : super(state);

  Future<void> set(double newValue) async {
    newValue = newValue.clamp(1.0, 2.0);
    if (newValue != value) {
      value = newValue;
      await AppPreferences.set(AppPreferences.prefZoom, value.toString());
      notifyListeners();
    }
  }
}
