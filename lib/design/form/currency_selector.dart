// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/design/form/list_selector.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class BaseListSelectorItem extends ListSelectorItem {
  Currency item;

  @override
  Widget build(BuildContext context) => Row(
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
          SizedBox(
            width: 12,
            child: InkWell(
              onTap: () => CurrencyProvider.isPinned(item) ? CurrencyProvider.unpin(item) : CurrencyProvider.pin(item),
              child: Icon(
                CurrencyProvider.isPinned(item) ? Icons.star : Icons.star_border,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              ),
            ),
          ),
        ],
      );

  @override
  bool match(String search) => '$item'.contains(search);

  @override
  bool equal(val) => item.code == val.code;

  @override
  String get id => item.code;

  @override
  String get name => item.name;

  BaseListSelectorItem(this.item) : super(id: '', name: '');
}

class BaseCurrencySelector extends ListSelector<BaseListSelectorItem> {
  @override
  // ignore: overridden_fields
  final Currency? value;

  BaseCurrencySelector({
    super.key,
    required super.setState,
    this.value,
    super.withLabel,
    super.hintColor,
    super.hintStyle,
    super.hintText,
    super.tooltip,
  }) : super(options: CurrencyProvider.getAll().map((e) => BaseListSelectorItem(e)).toList());
}
