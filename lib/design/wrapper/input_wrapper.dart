// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/design/form/currency_selector_code.dart';
import 'package:app_finance/design/form/date_input.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/color_selector.dart';
import 'package:app_finance/design/form/currency_selector.dart';
import 'package:app_finance/design/form/icon_selector.dart';
import 'package:app_finance/design/form/list_account_selector.dart';
import 'package:app_finance/design/form/list_budget_selector.dart';
import 'package:app_finance/design/form/list_selector.dart';
import 'package:app_finance/design/form/month_year_input.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/wrapper/required_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum NamedInputType {
  accountSelector,
  budgetSelector,
  colorSelector,
  currencySelector,
  currencyShort,
  iconSelector,
  listSelector,
  textInput,
  ymSelector,
  dateSelector,
}

class InputWrapper extends StatelessWidget {
  final NamedInputType type;
  final bool isRequired;
  final bool isDisabled;
  final bool showError;
  final String title;
  final List<dynamic>? options;
  final Function? onChange;
  final String? tooltip;
  final TextEditingController? controller;
  final dynamic value;
  final List<TextInputFormatter>? formatter;
  final AppData? state;
  final double? width;
  final TextInputType? inputType;

  Key getKey() => ValueKey(key?.hashCode ?? '$title $tooltip');

  ({bool min, String? hint, Color? hintColor}) getHintState(BuildContext context) {
    final screenState = ScreenHelper.state();
    final min = screenState.isRight || screenState.isWearable;
    String? hint = min ? title : tooltip;
    Color? hintColor;
    if (isRequired && min) {
      if (showError) {
        hint = '$hint [!] ${AppLocale.labels.isRequired}';
        hintColor = context.colorScheme.primary;
      } else {
        hint = '$hint*';
      }
    }

    return (min: min, hint: hint, hintColor: hintColor);
  }

  const InputWrapper({
    super.key,
    required this.type,
    required this.title,
    this.tooltip,
    this.controller,
    this.onChange,
    this.options,
    this.value,
    this.formatter,
    this.isRequired = false,
    this.isDisabled = false,
    this.showError = false,
    this.state,
    this.width,
    this.inputType,
  });

  const InputWrapper.text({
    super.key,
    this.type = NamedInputType.textInput,
    required this.title,
    required this.controller,
    this.tooltip,
    this.isRequired = false,
    this.isDisabled = false,
    this.showError = false,
    this.onChange,
    this.options,
    this.value,
    this.formatter,
    this.state,
    this.width,
    this.inputType,
  });

  const InputWrapper.select({
    super.key,
    this.type = NamedInputType.listSelector,
    required this.title,
    required this.options,
    required this.onChange,
    required this.value,
    this.tooltip,
    this.isRequired = false,
    this.isDisabled = false,
    this.showError = false,
    this.controller,
    this.formatter,
    this.state,
    this.width,
    this.inputType,
  });

  const InputWrapper.icon({
    super.key,
    this.type = NamedInputType.iconSelector,
    required this.title,
    required this.onChange,
    this.controller,
    this.tooltip,
    this.isRequired = false,
    this.isDisabled = false,
    this.showError = false,
    this.options,
    this.value,
    this.formatter,
    this.state,
    this.width,
    this.inputType,
  });

  const InputWrapper.color({
    super.key,
    this.type = NamedInputType.colorSelector,
    required this.title,
    required this.onChange,
    this.controller,
    this.tooltip,
    this.isRequired = false,
    this.isDisabled = false,
    this.showError = false,
    this.options,
    this.value,
    this.formatter,
    this.state,
    this.width,
    this.inputType,
  });

  const InputWrapper.currency({
    super.key,
    this.type = NamedInputType.currencySelector,
    required this.value,
    required this.title,
    required this.onChange,
    this.controller,
    this.tooltip,
    this.isRequired = false,
    this.isDisabled = false,
    this.showError = false,
    this.options,
    this.formatter,
    this.state,
    this.width,
    this.inputType,
  });

  Widget buildTextInput({required bool min, required String? hint, Color? hintColor}) => SimpleInput(
        key: getKey(),
        controller: controller!,
        tooltip: hint,
        withLabel: min,
        hintColor: hintColor,
        formatter: formatter,
        type: inputType ?? TextInputType.text,
        obscure: inputType == TextInputType.visiblePassword,
      );

  Widget buildListSelector({required bool min, required String? hint, Color? hintColor}) =>
      ListSelector<ListSelectorItem>(
        key: getKey(),
        value: value != null ? ListSelectorItem(id: value, name: '') : null,
        tooltip: tooltip,
        hintText: hint,
        hintColor: hintColor,
        options: options as List<ListSelectorItem>,
        setState: (ListSelectorItem? v) => onChange?.call(v?.id),
        withLabel: min,
        isDisabled: isDisabled,
      );

  Widget buildIconSelector({required bool min, required String? hint}) => IconSelector(
        key: getKey(),
        value: value != null ? IconSelectorItem(value, name: value.toString()) : null,
        setState: (v) => onChange?.call((v as IconSelectorItem?)?.value),
        hintText: hint,
        withLabel: min,
      );

  Widget buildColorSelector({required bool min}) => ColorSelector(
        key: getKey(),
        value: value,
        setState: (v) => onChange?.call(v),
        withLabel: min,
      );

  Widget buildCurrencySelector({required bool min, required String? hint}) => BaseCurrencySelector(
        key: getKey(),
        value: value != null ? BaseListSelectorItem(value) : null,
        setState: (v) => onChange?.call((v as BaseListSelectorItem?)?.item),
        withLabel: min,
        tooltip: tooltip,
        hintText: hint,
      );

  Widget buildCurrencyShortSelector({required bool min, required String? hint}) => CodeCurrencySelector(
        key: getKey(),
        value: value != null ? CodeCurrencySelectorItem(value) : null,
        setState: (v) => onChange?.call((v as CodeCurrencySelectorItem?)?.item),
        withLabel: min,
        tooltip: tooltip,
        hintText: hint,
      );

  Widget buildMonthYearSelector({required bool min}) => MonthYearInput(
        key: getKey(),
        value: value,
        setState: onChange!,
        withLabel: min,
        labelText: title,
      );

  Widget buildDateSelector({required bool min}) => DateInput(
        value: value,
        setState: onChange!,
        withLabel: min,
      );

  Widget buildAccountSelector({required bool min, required String? hint}) => ListAccountSelector(
        key: getKey(),
        value: value != null ? ListAccountSelectorItem(item: value) : null,
        hintText: hint,
        tooltip: tooltip,
        state: state!,
        setState: (v) => onChange?.call((v as ListAccountSelectorItem?)?.item),
        width: width!,
        withLabel: min,
        options: options?.cast() ?? [],
      );

  Widget buildBudgetSelector({required bool min, required String? hint}) => ListBudgetSelector(
        key: getKey(),
        value: value != null ? ListBudgetSelectorItem(item: value) : null,
        hintText: hint,
        tooltip: tooltip,
        state: state!,
        setState: (v) => onChange?.call((v as ListBudgetSelectorItem?)?.item),
        width: width!,
        withLabel: min,
      );

  Widget buildInput({required bool min, required String? hint, Color? hintColor}) {
    return switch (type) {
      NamedInputType.textInput => buildTextInput(min: min, hint: hint, hintColor: hintColor),
      NamedInputType.listSelector => buildListSelector(min: min, hint: hint, hintColor: hintColor),
      NamedInputType.iconSelector => buildIconSelector(min: min, hint: hint),
      NamedInputType.colorSelector => buildColorSelector(min: min),
      NamedInputType.currencySelector => buildCurrencySelector(min: min, hint: hint),
      NamedInputType.currencyShort => buildCurrencyShortSelector(min: min, hint: hint),
      NamedInputType.ymSelector => buildMonthYearSelector(min: min),
      NamedInputType.dateSelector => buildDateSelector(min: min),
      NamedInputType.accountSelector => buildAccountSelector(min: min, hint: hint),
      NamedInputType.budgetSelector => buildBudgetSelector(min: min, hint: hint),
    };
  }

  Widget buildTitle(BuildContext context, {required bool min}) {
    if (min) {
      return ThemeHelper.emptyBox;
    }

    return isRequired
        ? RequiredWidget(title: title, showError: showError)
        : TextWrapper(title, style: context.textTheme.bodyLarge);
  }

  @override
  Widget build(BuildContext context) {
    final hintState = getHintState(context);
    final min = hintState.min;
    return Column(
      mainAxisAlignment: AppDesign.getAlignment<MainAxisAlignment>(),
      crossAxisAlignment: AppDesign.getAlignment(),
      children: [
        if (!min) buildTitle(context, min: min),
        buildInput(min: min, hint: hintState.hint, hintColor: hintState.hintColor),
        ThemeHelper.hIndent2x,
      ],
    );
  }
}
