// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/widgets/_forms/list_selector.dart';
import 'package:app_finance/widgets/home/base_line_widget.dart';
import 'package:flutter/material.dart';

class ListAccountSelectorItem extends ListSelectorItem {
  dynamic item;

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

  ListAccountSelector({
    required this.state,
    required super.setState,
    required this.width,
    super.options = const [],
    super.style,
    super.value,
    super.indent = 0.0,
  }) : super();

  @override
  List<K> get options {
    return state
        .get(AppDataType.accounts)
        .list
        .map((item) => ListAccountSelectorItem(item: item))
        .cast<ListAccountSelectorItem>()
        .toList();
  }

  @override
  Widget itemBuilder(context, item, bool isSelected) {
    return Padding(
      padding: EdgeInsets.fromLTRB(indent, 0, indent, 0),
      child: selectorBuilder(context, item, true),
    );
  }

  @override
  Widget selectorBuilder(context, item, [bool showDivider = false]) {
    item.item.updateContext(context);
    return BaseLineWidget(
      uuid: item.item?.uuid ?? '',
      title: item.item?.title ?? '',
      description: item.item?.description ?? '',
      details: item.item?.detailsFormatted ?? '',
      progress: item.item?.progress ?? 0.0,
      color: item.item?.color ?? Colors.transparent,
      hidden: item.item?.hidden ?? false,
      offset: width - indent * 3,
      showDivider: showDivider,
    );
  }
}
