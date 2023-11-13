// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class CodeCurrencySelectorItem extends CurrencySelectorItem {
  @override
  CurrencyViewPattern? get selectionView => (input) => input.code;

  @override
  Widget? build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 42,
          child: item.flag != null ? Text(item.flag!) : null,
        ),
        Expanded(
          child: Column(
            children: [
              Align(alignment: Alignment.topLeft, child: Text(item.code)),
              Align(alignment: Alignment.topLeft, child: Text(item.name)),
            ],
          ),
        ),
        SizedBox(
          width: 32,
          child: Center(child: Text(item.symbol)),
        ),
      ],
    );
  }

  factory CodeCurrencySelectorItem.fromCurrency(Currency item) => CodeCurrencySelectorItem(item);

  CodeCurrencySelectorItem(super.item);
}

class BaseCurrencySelector<T extends CurrencySelectorItem> extends CurrencySelector<T> {
  @override
  String get hintText => AppLocale.labels.currencyTooltip;

  late final TextStyle? _hintStyle;
  @override
  TextStyle? get hintStyle => _hintStyle;

  @override
  TextStyle? get headerHintStyle => _hintStyle;

  late final TextStyle? _textStyle;
  @override
  TextStyle? get textStyle => _textStyle;

  late final Color? _fieldBackground;
  @override
  Color? get fieldBackground => _fieldBackground;

  late final Color? _tileColor;
  @override
  Color? get tileColor => _tileColor;

  late final TextStyle? _labelStyle;
  @override
  TextStyle? get labelStyle => _labelStyle;

  @override
  EdgeInsets get indent => EdgeInsets.fromLTRB(
        ThemeHelper.getIndent(),
        withLabel && value != null ? 1 : ThemeHelper.getIndent(1.6),
        0,
        withLabel && value != null ? ThemeHelper.getIndent() : ThemeHelper.getIndent(1.6),
      );

  BaseCurrencySelector({
    super.key,
    required super.update,
    required TextTheme textTheme,
    required ColorScheme colorScheme,
    super.value,
    super.labelText,
    super.withLabel,
  }) {
    CurrencyItemRegistry.list[CodeCurrencySelectorItem] = CodeCurrencySelectorItem.fromCurrency;
    _hintStyle = textTheme.tooltipMedium.copyWith(overflow: TextOverflow.ellipsis);
    _textStyle = textTheme.numberMedium.copyWith(overflow: TextOverflow.ellipsis);
    _labelStyle = textTheme.tooltipSmall.copyWith(overflow: TextOverflow.ellipsis);
    _fieldBackground = colorScheme.fieldBackground;
    _tileColor = colorScheme.primary;
  }
}

class CodeCurrencySelector extends BaseCurrencySelector<CodeCurrencySelectorItem> {
  CodeCurrencySelector({
    super.key,
    required super.update,
    required TextTheme textTheme,
    required ColorScheme colorScheme,
    super.value,
    super.labelText,
    super.withLabel,
  }) : super(
          textTheme: textTheme,
          colorScheme: colorScheme,
        );
}
