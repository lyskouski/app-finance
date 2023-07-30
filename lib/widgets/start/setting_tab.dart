// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/app_theme.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/_forms/currency_selector.dart';
import 'package:app_finance/widgets/_forms/list_selector.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:app_finance/widgets/start/abstract_tab.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SettingTab extends AbstractTab {
  final String? title;

  SettingTab({
    required super.setState,
    this.title,
  }) : super();

  @override
  SettingTabState createState() => SettingTabState();
}

class SettingTabState extends AbstractTabState<SettingTab>
    with SharedPreferencesMixin {
  late AppTheme theme;
  Currency? currency;
  bool isEncrypted = false;
  bool hasEncrypted = false;
  String brightness = '0';

  @override
  void initState() {
    super.initState();
    final doEncrypt = getPreference(prefDoEncrypt);
    isEncrypted = doEncrypt == 'true' || doEncrypt == null;
    hasEncrypted = doEncrypt != null;
    brightness = getPreference(prefTheme) ?? brightness;
  }

  @override
  void updateState() {
    setPreference(prefDoEncrypt, isEncrypted ? 'true' : 'false');
    super.updateState();
  }

  Future<void> saveCurrency(Currency? value) async {
    await setPreference(prefCurrency, value!.code);
    setState(() => currency = value);
  }

  void saveTheme(String value) {
    setState(() => brightness = value);
    theme.updateState(value);
  }

  Future<void> initCurrencyFromLocale(BuildContext context) async {
    Locale locale = Localizations.localeOf(context);
    final format = NumberFormat.simpleCurrency(locale: locale.toString());
    String? code = getPreference(prefCurrency);
    if (code == null && format.currencyName != null) {
      await setPreference(prefCurrency, format.currencyName!);
      code = format.currencyName!;
    }
    setState(() => currency = CurrencyService().findByCode(code));
  }

  @override
  Widget buildContent(BuildContext context) {
    theme = Provider.of<AppTheme>(context, listen: false);
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent = ThemeHelper.getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 2;
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
        SizedBox(height: indent),
        RowWidget(
          indent: indent,
          maxWidth: offset,
          alignment: MainAxisAlignment.start,
          chunk: const [0.3, 0.1, 0.6],
          children: [
            [
              Text(
                AppLocalizations.of(context)!.encryptionMode,
                style: textTheme.bodyLarge,
              ),
            ],
            [
              Switch(
                value: isEncrypted,
                onChanged: (newValue) {
                  if (hasEncrypted) {
                    return;
                  }
                  setState(() => isEncrypted = newValue);
                },
              ),
            ],
            [
              hasEncrypted
                  ? Text(AppLocalizations.of(context)!.hasEncrypted)
                  : const SizedBox(),
            ],
          ],
        ),
        SizedBox(height: indent),
        Text(
          AppLocalizations.of(context)!.brightnessTheme,
          style: textTheme.bodyLarge,
        ),
        ListSelector(
          value: brightness,
          options: [
            ListSelectorItem(
                id: '0', name: AppLocalizations.of(context)!.systemMode),
            ListSelectorItem(
                id: '1', name: AppLocalizations.of(context)!.lightMode),
            ListSelectorItem(
                id: '2', name: AppLocalizations.of(context)!.darkMode),
          ],
          setState: saveTheme,
          style: textTheme.numberMedium
              .copyWith(color: textTheme.headlineSmall?.color),
          indent: indent,
        ),
      ],
    );
  }

  @override
  String getButtonTitle() {
    return widget.title ?? AppLocalizations.of(context)!.saveTooltip;
  }
}
