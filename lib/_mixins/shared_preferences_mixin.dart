// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:shared_preferences/shared_preferences.dart';

mixin SharedPreferencesMixin {
  final String prefPrivacyPolicy = 'privacyPolicy';
  final String prefDoEncrypt = 'doEncrypt';
  final String prefAccount = 'account';
  final String prefBudget = 'budget';
  final String prefCurrency = 'currency';
  final String prefTheme = 'themeMode';
  final String prefLocale = 'localeMode';
  final String prefExpand = 'expand';
  final String prefPeer = 'p2p_host';
  final String prefP2P = 'p2p_spot';

  static late SharedPreferences pref;

  Future<void> setPreference(String key, String value) async {
    await pref.setString(key, value);
  }

  Future<void> clearPreference(String key) async {
    await pref.remove(key);
  }

  String? getPreference(String key) {
    return pref.getString(key);
  }
}
