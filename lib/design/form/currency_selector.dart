// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/form/list_selector.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class BaseListSelectorItem extends ListSelectorItem {
  Currency item;

  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (_, constraints) {
        return Padding(
          padding: const EdgeInsets.all(2),
          child: RowWidget(
            chunk: const [32, null],
            indent: 0.0,
            maxWidth: constraints.maxWidth - ThemeHelper.getIndent(),
            alignment: AppDesign.getAlignment<MainAxisAlignment>(),
            children: [
              [
                item.flag != null ? Text(item.flag!) : ThemeHelper.emptyBox,
              ],
              [
                Align(
                  alignment: AppDesign.isRightToLeft() ? Alignment.centerRight : Alignment.centerLeft,
                  child: TextWrapper('${item.symbol} | ${item.name} (${item.code})'),
                ),
              ],
            ],
          ),
        );
      });

  void pinItem(BuildContext context, item) {
    final isPinned = CurrencyProvider.isPinned(item);
    if (isPinned) {
      CurrencyProvider.unpin(item);
    } else {
      CurrencyProvider.pin(item);
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(isPinned ? AppLocale.labels.orderUnpin : AppLocale.labels.orderPin)),
    );
  }

  @override
  Widget suggest(BuildContext context) => Row(
        mainAxisAlignment: AppDesign.getAlignment<MainAxisAlignment>(),
        children: [
          SizedBox(
            width: 42,
            child: item.flag != null ? Text(item.flag!) : null,
          ),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: AppDesign.isRightToLeft() ? Alignment.topRight : Alignment.topLeft,
                  child: TextWrapper(item.code),
                ),
                Align(
                  alignment: AppDesign.isRightToLeft() ? Alignment.topRight : Alignment.topLeft,
                  child: TextWrapper(item.name),
                ),
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
              onTap: () => pinItem(context, item),
              child: Icon(
                CurrencyProvider.isPinned(item) ? Icons.star : Icons.star_border,
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
              ),
            ),
          ),
        ],
      );

  @override
  bool match(String search) => '$item'.contains(search);

  @override
  bool equal(val) => val is String ? item.code == val : item.code == (val as BaseListSelectorItem).id;

  @override
  String get id => item.code;

  @override
  String get name => item.name;

  BaseListSelectorItem(this.item) : super(id: '', name: '');
}

class BaseCurrencySelector extends ListSelector<BaseListSelectorItem> {
  BaseCurrencySelector({
    super.key,
    required super.setState,
    super.value,
    super.withLabel,
    super.hintColor,
    super.hintStyle,
    super.hintText,
    super.tooltip,
  }) : super(options: CurrencyProvider.getAll().map((e) => BaseListSelectorItem(e)).toList());
}
