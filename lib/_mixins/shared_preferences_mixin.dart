// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:shared_preferences/shared_preferences.dart';

mixin SharedPreferencesMixin {
  final String prefPrivacyPolicy = 'privacyPolicy';
  final String prefDoEncrypt = 'doEncrypt';
  final String prefAccount = 'account';
  final String prefBudget = 'budget';
  final String prefCurrency = 'currency';
  final String prefTheme = 'themeMode';

  static Future<SharedPreferences> get pref async =>
      await SharedPreferences.getInstance();

  Future<void> setPreference(String key, String value) async {
    await (await pref).setString(key, value);
  }

  Future<String?> getPreference(String key) async {
    return (await pref).getString(key);
  }
}
