// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_theme.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_forms/currency_selector.dart';
import 'package:app_finance/widgets/_forms/list_selector.dart';
import 'package:app_finance/widgets/_generic/abstract_tab.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SettingTab extends AbstractTab {
  SettingTab({
    required super.setState,
  }) : super();

  @override
  SettingTabState createState() => SettingTabState();
}

class SettingTabState<T extends SettingTab> extends AbstractTabState<T> with SharedPreferencesMixin {
  late AppTheme theme;
  Currency? currency;
  bool isEncrypted = false;
  bool hasEncrypted = false;
  String brightness = '0';

  @override
  void initState() {
    super.initState();
    final doEncrypt = getPreference(prefDoEncrypt);
    hasEncrypted = doEncrypt != null;
    isEncrypted = doEncrypt == 'true' || doEncrypt == null;
    setPreference(prefDoEncrypt, isEncrypted ? 'true' : 'false');
    brightness = getPreference(prefTheme) ?? brightness;
  }

  void saveEncryption(newValue) {
    if (hasEncrypted) {
      return;
    }
    setState(() => isEncrypted = newValue);
    setPreference(prefDoEncrypt, isEncrypted ? 'true' : 'false');
  }

  Future<void> saveCurrency(Currency? value) async {
    await setPreference(prefCurrency, value!.code);
    setState(() => currency = value);
  }

  void saveTheme(String value) {
    setState(() => brightness = value);
    theme.updateState(value);
  }

  Future<void> initCurrencyFromLocale(String locale) async {
    final format = NumberFormat.simpleCurrency(locale: locale);
    String? code = getPreference(prefCurrency);
    if (code == null && format.currencyName != null) {
      await setPreference(prefCurrency, format.currencyName!);
      code = format.currencyName!;
    }
    setState(() => currency = CurrencyProvider.findByCode(code));
  }

  @override
  Widget buildContent(BuildContext context) {
    String locale = Localizations.localeOf(context).toString();
    theme = Provider.of<AppTheme>(context, listen: false);
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent = ThemeHelper.getIndent(2);
    double width = ThemeHelper.getWidth(context, 4);
    if (currency == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => initCurrencyFromLocale(locale));
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: indent),
          Text(
            AppLocale.labels.currencyDefault,
            style: textTheme.bodyLarge,
          ),
          Container(
            color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
            width: double.infinity,
            child: CurrencySelector(
              value: currency?.code,
              setState: saveCurrency,
            ),
          ),
          SizedBox(height: indent),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppLocale.labels.encryptionMode,
                style: textTheme.bodyLarge,
              ),
              Switch(
                value: isEncrypted,
                onChanged: saveEncryption,
              ),
              hasEncrypted ? Text(AppLocale.labels.hasEncrypted) : const SizedBox(),
            ],
          ),
          SizedBox(height: indent),
          Text(
            AppLocale.labels.brightnessTheme,
            style: textTheme.bodyLarge,
          ),
          ListSelector(
            value: brightness,
            options: [
              ListSelectorItem(id: '0', name: AppLocale.labels.systemMode),
              ListSelectorItem(id: '1', name: AppLocale.labels.lightMode),
              ListSelectorItem(id: '2', name: AppLocale.labels.darkMode),
            ],
            setState: saveTheme,
            style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
            indent: indent,
          ),
        ],
      ),
    );
  }

  @override
  String getButtonTitle() {
    return AppLocale.labels.saveTooltip;
  }
}
