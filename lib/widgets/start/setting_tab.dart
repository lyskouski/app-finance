// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/_forms/currency_selector.dart';
import 'package:app_finance/widgets/start/abstract_tab.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';

class SettingTab extends AbstractTab {
  SettingTab({
    required super.setState,
  }) : super();

  @override
  SettingTabState createState() => SettingTabState();
}

class SettingTabState extends AbstractTabState<SettingTab>
    with SharedPreferencesMixin {
  Currency? currency;

  Future<void> saveCurrency(Currency? value) async {
    await setPreference(prefCurrency, value!.code);
    setState(() {
      currency = value;
    });
  }

  Future<void> initCurrencyFromLocale(BuildContext context) async {
    Locale locale = Localizations.localeOf(context);
    final format = NumberFormat.simpleCurrency(locale: locale.toString());
    String? code = await getPreference(prefCurrency);
    if (code == null && format.currencyName != null) {
      await setPreference(prefCurrency, format.currencyName!);
      code = format.currencyName!;
    }
    setState(() {
      currency = CurrencyService().findByCode(code);
    });
  }

  @override
  Widget buildContent(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent =
        ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    if (currency == null) {
      initCurrencyFromLocale(context);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: indent),
        Text(
          AppLocalizations.of(context)!.currencyDefault,
          style: textTheme.bodyLarge,
        ),
        Container(
          color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
          width: double.infinity,
          child: CurrencySelector(
            value: currency,
            setState: saveCurrency,
          ),
        ),
      ],
    );
  }

  @override
  String getButtonTitle() {
    return AppLocalizations.of(context)!.saveTooltip;
  }
}
