// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/l10n/app_localization.dart';
import 'package:app_finance/l10n/app_localization_en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class AppLocale extends ValueNotifier<Locale?> {
  static String code = 'en';
  static AppLocalizations labels = AppLocalizationsEn();

  AppLocale() : super(_initialLocale());

  static Locale? _initialLocale() {
    final prefCode = AppPreferences.get(AppPreferences.prefLocale);
    if (prefCode != null && prefCode.isNotEmpty) {
      code = prefCode;
    }
    return AppLocale.fromCode(code);
  }

  static Locale? fromCode(String value) {
    try {
      final keys = value.split('_');
      return Locale.fromSubtags(languageCode: keys.first, countryCode: keys.length > 1 ? keys.last : null);
    } catch (e) {
      return null;
    }
  }

  Future<void> set(String newValue, [Function? callback]) async {
    final loc = fromCode(newValue);
    if (loc != null && loc != value && AppLocalizations.supportedLocales.contains(loc)) {
      value = loc;
      code = value.toString();
      await AppPreferences.set(AppPreferences.prefLocale, newValue);
      CurrencyDefaults.defaultLocale = loc;
      if (callback != null) {
        callback();
      }
      notifyListeners();
    }
  }

  void updateState(BuildContext context) {
    final value = Localizations.localeOf(context).toString();
    labels = AppLocalizations.of(context) ?? AppLocalizationsEn();
    CurrencyProvider.initFromContext(context, locale: super.value);
    if (AppPreferences.get(AppPreferences.prefDesign) == null) {
      AppPreferences.set(AppPreferences.prefDesign, AppDesign.fromLocale(fromCode(value)));
    }
    set(value);
  }
}
