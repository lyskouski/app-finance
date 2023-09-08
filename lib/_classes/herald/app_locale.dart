// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AppLocale extends ValueNotifier<Locale?> {
  static String code = 'en';
  static late AppLocalizations labels;

  AppLocale([Locale? value]) : super(value) {
    final newValue = AppPreferences.get(AppPreferences.prefLocale);
    if (newValue != null) {
      set(newValue);
    }
  }

  static Locale? fromCode(String value) {
    try {
      return Locale.fromSubtags(languageCode: value);
    } catch (e) {
      return null;
    }
  }

  void set(String newValue, [Function? callback]) {
    final loc = fromCode(newValue);
    if (loc != null && loc != value && AppLocalizations.supportedLocales.contains(loc)) {
      value = loc;
      code = value.toString();
      if (callback != null) {
        callback();
      }
      WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
    }
  }

  void updateState(BuildContext context) {
    final value = Localizations.localeOf(context).toString();
    labels = AppLocalizations.of(context)!;
    set(value, () => AppPreferences.set(AppPreferences.prefLocale, value));
  }
}
