// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_palette.dart';
import 'package:app_finance/_classes/herald/app_theme.dart';
import 'package:app_finance/_classes/herald/app_zoom.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/design_type.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/color_ext.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/l10n/index.dart';
import 'package:app_finance/design/button/link_widget.dart';
import 'package:app_finance/design/form/color_selector.dart';
import 'package:app_finance/pages/start/widgets/abstract_tab.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:app_finance/design/wrapper/table_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SettingTab extends AbstractTab {
  const SettingTab({
    super.key,
    required super.setState,
    required super.setButton,
    super.isFirstBoot = true,
  });

  @override
  SettingTabState createState() => SettingTabState();
}

class SettingTabState<T extends SettingTab> extends AbstractTabState<T> {
  late FocusController controller;

  late AppTheme theme;
  late AppZoom zoom;
  late AppPalette palette;
  late AppLocale locale;
  late AppDesign design;
  late AppData state;

  Currency? currency;
  bool isEncrypted = false;
  bool hasEncrypted = false;
  String brightness = '0';
  String colorMode = AppPalette.state;

  var paletteState = (
    light: AppDefaultColors.fromString(AppPalette.light),
    dark: AppDefaultColors.fromString(AppPalette.dark),
  );

  final languages = languageList.map((e) => ListSelectorItem(id: e.id, name: e.name)).toList();

  @override
  void initState() {
    super.initState();
    controller = FocusController();
    final doEncrypt = AppPreferences.get(AppPreferences.prefDoEncrypt);
    hasEncrypted = doEncrypt != null;
    isEncrypted = doEncrypt == 'true' || doEncrypt == null;
    AppPreferences.set(AppPreferences.prefDoEncrypt, isEncrypted ? 'true' : 'false');
    brightness = AppPreferences.get(AppPreferences.prefTheme) ?? brightness;
    colorMode = AppPreferences.get(AppPreferences.prefColor) ?? colorMode;
    currency = CurrencyProvider.find(AppPreferences.get(AppPreferences.prefCurrency) ?? '');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void saveEncryption(newValue) {
    if (hasEncrypted) {
      return;
    }
    setState(() => isEncrypted = newValue);
    AppPreferences.set(AppPreferences.prefDoEncrypt, isEncrypted ? 'true' : 'false');
  }

  Future<void> saveCurrency(Currency? value) async {
    if (value != null) {
      await AppPreferences.set(AppPreferences.prefCurrency, value.code);
      Exchange.defaultCurrency = value;
      CurrencyDefaults.defaultCurrency = value;
      await state.restate();
      setState(() => currency = value);
    }
  }

  Future<void> saveTheme(String value) async {
    await theme.setTheme(value);
    setState(() => brightness = value);
  }

  Future<void> saveColor(String value) async {
    await palette.setMode(value);
    setState(() => colorMode = value);
  }

  Future<void> saveLocale(String value) async {
    await locale.set(value);
    await design.set(AppDesign.fromLocale(AppLocale.fromCode(value)));
    setState(() {});
  }

  Future<void> saveDesign(String value) async {
    await design.set(value);
    setState(() {});
  }

  Future<void> changePalette(_) async {
    await palette.set(paletteState.light, paletteState.dark);
    setState(() => paletteState);
  }

  Future<void> initCurrencyFromLocale(String locale) async {
    final format = NumberFormat.simpleCurrency(locale: locale);
    final code = format.currencyName ?? 'EUR';
    await AppPreferences.set(AppPreferences.prefCurrency, code);
    setState(() => currency = CurrencyProvider.find(code));
    Exchange.defaultCurrency = currency;
    CurrencyDefaults.defaultCurrency = currency;
  }

  @override
  String getButtonTitle() => AppLocale.labels.saveSettingsTooltip;

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    theme = Provider.of<AppTheme>(context, listen: false);
    zoom = Provider.of<AppZoom>(context, listen: false);
    palette = Provider.of<AppPalette>(context, listen: false);
    locale = Provider.of<AppLocale>(context, listen: false);
    design = Provider.of<AppDesign>(context, listen: false);
    state = Provider.of<AppData>(context, listen: true);
    final textTheme = context.textTheme;
    final indent = ThemeHelper.getIndent(2);
    final width = ThemeHelper.getMaxWidth(context, constraints) - 2 * indent;
    if (currency == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => initCurrencyFromLocale(AppLocale.code));
      return ThemeHelper.emptyBox;
    }
    return SingleScrollWrapper(
      controller: controller,
      child: Column(
        crossAxisAlignment: AppDesign.getAlignment(),
        children: [
          ThemeHelper.hIndent2x,
          InputWrapper.select(
            title: AppLocale.labels.language,
            tooltip: AppLocale.labels.language,
            value: AppLocale.code,
            options: languages,
            onChange: (v) => saveLocale(v ?? AppLocale.code),
          ),
          InputWrapper.select(
            title: AppLocale.labels.design,
            tooltip: AppLocale.labels.design,
            value: AppDesign.get().name,
            options: [
              ListSelectorItem(id: AppDesignType.global.name, name: AppLocale.labels.designGlobal),
              ListSelectorItem(id: AppDesignType.asiaGeneral.name, name: AppLocale.labels.designAsiaGeneral),
              ListSelectorItem(id: AppDesignType.rtlGeneral.name, name: AppLocale.labels.designRtlGeneral),
              ListSelectorItem(id: AppDesignType.germany.name, name: AppLocale.labels.designGermany),
            ].cast<ListSelectorItem>(),
            onChange: (v) => saveDesign(AppDesign.find(v)?.name ?? AppDesignType.global.name),
          ),
          InputWrapper.currency(
            title: AppLocale.labels.currencyDefault,
            tooltip: AppLocale.labels.currencyDefault,
            value: currency,
            onChange: saveCurrency,
          ),
          if (kDebugMode) ...[
            Row(
              mainAxisAlignment: AppDesign.getAlignment<MainAxisAlignment>(),
              children: [
                Text(
                  AppLocale.labels.encryptionMode,
                  style: textTheme.bodyLarge,
                ),
                Switch(
                  value: isEncrypted,
                  onChanged: saveEncryption,
                ),
                Expanded(
                  child: hasEncrypted ? Text(AppLocale.labels.hasEncrypted) : ThemeHelper.emptyBox,
                ),
              ],
            ),
            ThemeHelper.hIndent2x,
          ],
          InputWrapper.select(
            title: AppLocale.labels.brightnessTheme,
            value: brightness,
            tooltip: AppLocale.labels.brightnessTheme,
            options: [
              ListSelectorItem(id: '0', name: AppLocale.labels.systemMode),
              ListSelectorItem(id: '1', name: AppLocale.labels.lightMode),
              ListSelectorItem(id: '2', name: AppLocale.labels.darkMode),
            ].cast<ListSelectorItem>(),
            onChange: (v) => saveTheme(v ?? '0'),
          ),
          InputWrapper.select(
            title: AppLocale.labels.colorTheme,
            value: colorMode,
            tooltip: AppLocale.labels.colorTheme,
            options: [
              ListSelectorItem(id: AppColors.colorApp, name: AppLocale.labels.colorApp),
              ListSelectorItem(id: AppColors.colorSystem, name: AppLocale.labels.colorSystem),
              ListSelectorItem(id: AppColors.colorUser, name: AppLocale.labels.colorUser),
            ].cast<ListSelectorItem>(),
            onChange: (v) => saveColor(v ?? AppColors.colorApp),
          ),
          if (colorMode == AppColors.colorUser) ...[
            TableWidget(
              width: width,
              shadowColor: context.colorScheme.onSurface.withOpacity(0.05),
              chunk: const [120, null, null],
              data: [
                [
                  Text(AppLocale.labels.colorType),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocale.labels.colorLight),
                      IconButton(
                        onPressed: () =>
                            changePalette(paletteState = (light: AppDefaultColors(), dark: paletteState.dark)),
                        icon: const Icon(Icons.restore),
                        tooltip: AppLocale.labels.colorRestore,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocale.labels.colorDark),
                      IconButton(
                        onPressed: () =>
                            changePalette(paletteState = (light: paletteState.light, dark: AppDarkColors())),
                        icon: const Icon(Icons.restore),
                        tooltip: AppLocale.labels.colorRestore,
                      ),
                    ],
                  ),
                ],
                [
                  Text(AppLocale.labels.colorBackground),
                  ColorSelector(
                      value: paletteState.light.background.toMaterialColor,
                      setState: (v) => changePalette(paletteState.light.background = v)),
                  ColorSelector(
                      value: paletteState.dark.background.toMaterialColor,
                      setState: (v) => changePalette(paletteState.dark.background = v)),
                ],
                [
                  Text(AppLocale.labels.colorPrimary),
                  ColorSelector(
                      value: paletteState.light.primary.toMaterialColor,
                      setState: (v) => changePalette(paletteState.light.primary = v)),
                  ColorSelector(
                      value: paletteState.dark.primary.toMaterialColor,
                      setState: (v) => changePalette(paletteState.dark.primary = v)),
                ],
                [
                  Text(AppLocale.labels.colorInversePrimary),
                  ColorSelector(
                      value: paletteState.light.inversePrimary.toMaterialColor,
                      setState: (v) => changePalette(paletteState.light.inversePrimary = v)),
                  ColorSelector(
                      value: paletteState.dark.inversePrimary.toMaterialColor,
                      setState: (v) => changePalette(paletteState.dark.inversePrimary = v)),
                ],
                [
                  Text(AppLocale.labels.colorInverseSurface),
                  ColorSelector(
                      value: paletteState.light.inverseSurface.toMaterialColor,
                      setState: (v) => changePalette(paletteState.light.inverseSurface = v)),
                  ColorSelector(
                      value: paletteState.dark.inverseSurface.toMaterialColor,
                      setState: (v) => changePalette(paletteState.dark.inverseSurface = v)),
                ],
                [
                  Text(AppLocale.labels.colorOnInverseSurface),
                  ColorSelector(
                      value: paletteState.light.onInverseSurface.toMaterialColor,
                      setState: (v) => changePalette(paletteState.light.onInverseSurface = v)),
                  ColorSelector(
                      value: paletteState.dark.onInverseSurface.toMaterialColor,
                      setState: (v) => changePalette(paletteState.dark.onInverseSurface = v)),
                ],
                [
                  Text(AppLocale.labels.colorSecondary),
                  ColorSelector(
                      value: paletteState.light.secondary.toMaterialColor,
                      setState: (v) => changePalette(paletteState.light.secondary = v)),
                  ColorSelector(
                      value: paletteState.dark.secondary.toMaterialColor,
                      setState: (v) => changePalette(paletteState.dark.secondary = v)),
                ],
                [
                  Text(AppLocale.labels.colorOnSecondary),
                  ColorSelector(
                      value: paletteState.light.onSecondary.toMaterialColor,
                      setState: (v) => changePalette(paletteState.light.onSecondary = v)),
                  ColorSelector(
                      value: paletteState.dark.onSecondary.toMaterialColor,
                      setState: (v) => changePalette(paletteState.dark.onSecondary = v)),
                ],
                [
                  Text(AppLocale.labels.colorOnSecondaryContainer),
                  ColorSelector(
                      value: paletteState.light.onSecondaryContainer.toMaterialColor,
                      setState: (v) => changePalette(paletteState.light.onSecondaryContainer = v)),
                  ColorSelector(
                      value: paletteState.dark.onSecondaryContainer.toMaterialColor,
                      setState: (v) => changePalette(paletteState.dark.onSecondaryContainer = v)),
                ],
              ],
            ),
            ThemeHelper.hIndent4x,
          ],
          RowWidget(
            indent: indent,
            maxWidth: width,
            chunk: [null, indent + ThemeHelper.getTextWidth(Text(AppLocale.labels.reset))],
            children: [
              [
                Text(
                  AppLocale.labels.zoomState,
                  style: textTheme.bodyLarge,
                ),
              ],
              [
                Align(
                  alignment: Alignment.centerRight,
                  child: LinkWidget(AppLocale.labels.reset, onTap: () => zoom.set(1)),
                ),
              ],
            ],
          ),
          Container(
            color: context.colorScheme.fieldBackground,
            child: Slider(
              value: zoom.value,
              onChanged: zoom.set,
              min: AppZoom.min,
              max: AppZoom.max,
              divisions: 15,
              label: zoom.value.toStringAsFixed(2),
            ),
          ),
          ThemeHelper.hIndent2x,
        ],
      ),
    );
  }
}
