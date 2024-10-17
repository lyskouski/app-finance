// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String prefPrivacyPolicy = 'privacyPolicy';
  static const String prefDoEncrypt = 'doEncrypt';
  static const String prefAccount = 'account';
  static const String prefBudget = 'budget';
  static const String prefCurrency = 'currency';
  static const String prefTheme = 'themeMode';
  static const String prefLocale = 'localeMode';
  static const String prefDesign = 'localeDesign';
  static const String prefExpand = 'expand';
  static const String prefPeer = 'p2p_host';
  static const String prefP2P = 'p2p_spot';
  static const String prefZoom = 'zoom';
  static const String prefColor = 'color';
  static const String prefPalette = 'palette';
  static const String prefPaletteDark = 'palette_dark';
  static const String prefVersion = 'version';
  static const String prefWeekStartDay = 'weekStartDay';
  static const String prefMonthStartDay = 'monthStartDay';

  static late SharedPreferences pref;

  static Future<void> set(String key, String value) async {
    await pref.setString(key, value);
  }

  static Future<void> clear(String key) async {
    await pref.remove(key);
  }

  static String? get(String key) {
    return pref.getString(key);
  }
}
