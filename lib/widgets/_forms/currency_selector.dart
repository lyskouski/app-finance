// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_forms/list_selector.dart';
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
  Widget selectorBuilder(context, CurrencySelectorItem item) {
    return Text(item.toString(), style: style);
  }

  @override
  onChange(CurrencySelectorItem? value) {
    setState(value!.item);
    FocusController.onEditingComplete(focusOrder);
  }

  @override
  Widget itemBuilder(context, CurrencySelectorItem item, bool isSelected) {
    final indent = ThemeHelper.getIndent();
    if (setView != null) {
      return Tooltip(
        message: item.name,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: indent, horizontal: indent),
          child: selectorBuilder(context, item),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: indent, horizontal: indent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                SizedBox(width: indent * 2),
                if (item.item.flag != null) ...[
                  Text(CurrencyUtils.currencyToEmoji(item.item)),
                  SizedBox(width: indent * 2),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.item.code),
                      Text(item.item.name),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: indent * 2),
            child: Text(item.item.symbol),
          ),
        ],
      ),
    );
  }
}
