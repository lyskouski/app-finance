// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/design/form/list_selector.dart';
import 'package:app_finance/design/generic/base_line_widget.dart';
import 'package:flutter/material.dart';

class ListAccountSelectorItem extends ListSelectorItem {
  dynamic item;

  @override
  Widget build(context) => BaseLineWidget(
        uuid: item.uuid ?? '',
        title: item.title ?? '',
        description: item.description ?? '',
        details: item.detailsFormatted ?? '',
        progress: 1.0,
        color: item.color ?? Colors.transparent,
        icon: item.icon ?? Icons.radio_button_unchecked_sharp,
        hidden: item.hidden ?? false,
        width: ThemeHelper.getWidth(context, 12),
        showDivider: false,
      );

  @override
  Widget suggest(context) => BaseLineWidget(
        uuid: item.uuid ?? '',
        title: item.title ?? '',
        description: item.description ?? '',
        details: item.detailsFormatted ?? '',
        progress: item.progress ?? 0.0,
        color: item.color ?? Colors.transparent,
        icon: item.icon ?? Icons.radio_button_unchecked_sharp,
        hidden: item.hidden ?? false,
        width: ThemeHelper.getWidth(context, 7),
        showDivider: false,
      );

  @override
  String get id => item.uuid;

  @override
  String get name => item.title;

  ListAccountSelectorItem({
    required this.item,
    super.name = '',
    super.id = '',
  });
}

class ListAccountSelector<K extends ListAccountSelectorItem> extends ListSelector<ListAccountSelectorItem> {
  final AppData state;
  final double width;

  const ListAccountSelector({
    super.key,
    required this.state,
    required super.setState,
    required this.width,
    required super.hintText,
    super.options = const [],
    super.value,
    super.tooltip,
    super.withLabel,
  }) : super();

  @override
  List<ListAccountSelectorItem> get options {
    return super.options.isNotEmpty
        ? super.options
        : state.getList(AppDataType.accounts).map((item) => ListAccountSelectorItem(item: item)).toList();
  }

  @override
  ListSelectorState createState() => ListSelectorState<ListAccountSelector, ListAccountSelectorItem>();
}
