// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
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

  late final Color? _fieldBackground;
  @override
  Color? get fieldBackground => _fieldBackground;

  @override
  EdgeInsets get indent => EdgeInsets.fromLTRB(
        ThemeHelper.getIndent(),
        ThemeHelper.getIndent() * 3 / 2,
        0,
        ThemeHelper.getIndent() * 3 / 2,
      );

  BaseCurrencySelector({
    super.key,
    required super.update,
    required BuildContext context,
    super.value,
  }) {
    CurrencyItemRegistry.list[CodeCurrencySelectorItem] = CodeCurrencySelectorItem.fromCurrency;
    _hintStyle = context.textTheme.numberMedium.copyWith(
      color: context.textTheme.headlineSmall?.color!.withOpacity(0.4),
      overflow: TextOverflow.ellipsis,
    );
    _fieldBackground = context.colorScheme.fieldBackground;
  }
}

class CodeCurrencySelector extends BaseCurrencySelector<CodeCurrencySelectorItem> {
  CodeCurrencySelector({
    super.key,
    required super.update,
    required BuildContext context,
    super.value,
  }) : super(context: context);
}
