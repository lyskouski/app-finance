// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:flutter/material.dart';

class AppStartOfWeek extends ValueNotifier<int> {
  static get state => int.tryParse(AppPreferences.get(AppPreferences.prefWeekStartDay) ?? '') ?? 1;

  AppStartOfWeek() : super(state);

  Future<void> set(int newValue) async {
    if (newValue != value) {
      value = newValue;
      await AppPreferences.set(AppPreferences.prefWeekStartDay, value.toString());
      notifyListeners();
    }
  }
}
