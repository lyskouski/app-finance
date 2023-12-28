// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:flutter/material.dart';

enum AppDesignType {
  global,
  // Area specific
  asiaGeneral, // interface complexity
  rtlGeneral, // right-to-left notation
  // Location specific
  germany, // alphabetical order in lists, detailed descriptions
}

class AppDesign extends ValueNotifier<AppDesignType> {
  static AppDesignType _state = find(AppPreferences.get(AppPreferences.prefDesign)) ?? AppDesignType.global;

  AppDesign() : super(get());

  static AppDesignType get() => _state;

  static AppDesignType? find(String? name) => AppDesignType.values.where((e) => e.name == name).firstOrNull;

  static String fromLocale(Locale? value) => switch (value?.languageCode) {
        'ge' => AppDesignType.germany.name,
        'zh' => AppDesignType.asiaGeneral.name,
        'fa' => AppDesignType.rtlGeneral.name,
        _ => AppDesignType.global.name,
      };

  static TextDirection getTextDirection() => get() == AppDesignType.rtlGeneral ? TextDirection.rtl : TextDirection.ltr;

  static getAlignment<T extends Enum>() => switch (T) {
        MainAxisAlignment => get() == AppDesignType.rtlGeneral ? MainAxisAlignment.end : MainAxisAlignment.start,
        _ => get() == AppDesignType.rtlGeneral ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      };

  static getInverseAlignment<T extends Enum>() => switch (T) {
        MainAxisAlignment => get() == AppDesignType.rtlGeneral ? MainAxisAlignment.start : MainAxisAlignment.end,
        _ => get() == AppDesignType.rtlGeneral ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      };

  Future<void> set(String newValue, [Function? callback]) async {
    final change = find(newValue);
    if (change != null && change != value) {
      value = change;
      _state = change;
      await AppPreferences.set(AppPreferences.prefDesign, newValue);
      if (callback != null) {
        callback();
      }
      notifyListeners();
    }
  }
}
