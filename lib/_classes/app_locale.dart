// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AppLocale extends ValueNotifier<Locale?> with SharedPreferencesMixin {
  static String code = 'en';
  static late AppLocalizations labels;

  AppLocale([Locale? value]) : super(value) {
    final newValue = getPreference(prefLocale);
    if (newValue != null) {
      final loc = fromCode(newValue);
      if (loc != null && AppLocalizations.supportedLocales.contains(loc)) {
        _set(loc);
      }
    }
  }

  static Locale? fromCode(String value) {
    try {
      return Locale.fromSubtags(languageCode: value);
    } catch (e) {
      return null;
    }
  }

  void _set(Locale newValue) {
    if (newValue != value) {
      value = newValue;
      code = value.toString();
      notifyListeners();
    }
  }

  updateState(BuildContext context) {
    final value = Localizations.localeOf(context).toString();
    final loc = fromCode(value);
    if (loc != null) {
      labels = AppLocalizations.of(context)!;
      setPreference(prefTheme, value).then((_) {
        _set(loc);
      });
    }
  }
}
