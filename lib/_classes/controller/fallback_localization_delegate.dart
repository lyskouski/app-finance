// Source: https://stackoverflow.com/questions/57902361/flutter-app-crashes-building-the-appbar-with-multi-language-using-i18n-jetbrains

import 'package:flutter/material.dart';

class FallbackLocalizationDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<MaterialLocalizations> load(Locale locale) async => const DefaultMaterialLocalizations();

  @override
  bool shouldReload(old) => false;
}
