// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/design/form/currency_selector.dart';
import 'package:app_finance/design/form/list_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class CodeCurrencySelectorItem extends BaseListSelectorItem {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(2),
        child: Text(item.code),
      );

  @override
  Widget suggest(BuildContext context) {
    return Row(
      mainAxisAlignment: AppDesign.getAlignment<MainAxisAlignment>(),
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

  CodeCurrencySelectorItem(super.item);
}

class CodeCurrencySelector extends ListSelector<CodeCurrencySelectorItem> {
  CodeCurrencySelector({
    super.key,
    required super.setState,
    super.value,
    super.withLabel,
    super.hintColor,
    super.hintStyle,
    super.hintText,
    super.tooltip,
  }) : super(options: CurrencyProvider.getAll().map((e) => CodeCurrencySelectorItem(e)).toList());
}
