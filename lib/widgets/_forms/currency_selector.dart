// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_forms/list_selector.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

typedef SetViewFunction = String Function(Currency input);

class CurrencySelectorItem extends ListSelectorItem {
  Currency item;
  Function? setView;

  @override
  String get id => item.code;

  @override
  String get name => '${item.symbol} - ${item.name} (${item.code})';

  @override
  String toString() => setView != null ? setView!(item) : name;

  CurrencySelectorItem({
    required this.item,
    super.name = '',
    super.id = '',
    this.setView,
  });
}

class CurrencySelector extends ListSelector<CurrencySelectorItem> {
  final SetViewFunction? setView;

  @override
  String get hintText => AppLocale.labels.currencyTooltip;

  CurrencySelector({
    super.key,
    required super.setState,
    required super.hintText,
    super.value,
    this.setView,
  }) : super(options: []);

  @override
  List<CurrencySelectorItem> get options {
    return CurrencyProvider.getAll()
        .map((item) => CurrencySelectorItem(
              item: item,
              setView: setView,
            ))
        .cast<CurrencySelectorItem>()
        .toList();
  }

  @override
  CurrencySelectorState createState() => CurrencySelectorState();
}

class CurrencySelectorState extends ListSelectorState<CurrencySelector, CurrencySelectorItem> {
  @override
  onChange(CurrencySelectorItem? value) {
    widget.setState(value!.item);
    textController.closeView(null);
    FocusController.onEditingComplete(focusOrder);
  }

  @override
  Widget itemBuilder(context, item, [bool isSelected = false]) {
    return RowWidget(
      indent: ThemeHelper.getIndent(),
      maxWidth: ThemeHelper.getWidth(context, 8),
      alignment: MainAxisAlignment.start,
      chunk: const [24, null, 32],
      children: [
        [
          if (item.item.flag != null) Text(CurrencyUtils.currencyToEmoji(item.item)),
        ],
        [
          Text(item.item.code),
          Text(item.item.name),
        ],
        [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.indent * 2),
            child: Text(item.item.symbol),
          ),
        ],
      ],
    );
  }
}
