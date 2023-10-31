// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/def/list_selector_item.dart';
import 'package:app_finance/pages/_widgets/form/list_selector.dart';
import 'package:app_finance/pages/_widgets/generic/base_line_widget.dart';
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

  const ListAccountSelector({
    super.key,
    required this.state,
    required super.setState,
    required this.width,
    required super.hintText,
    super.options = const [],
    super.value,
  }) : super();

  @override
  List<ListAccountSelectorItem> get options {
    return super.options.isNotEmpty
        ? super.options
        : state.getList(AppDataType.accounts).map((item) => ListAccountSelectorItem(item: item)).toList();
  }

  @override
  ListAccountSelectorState createState() => ListAccountSelectorState();
}

class ListAccountSelectorState<K extends ListAccountSelectorItem> extends ListSelectorState<ListAccountSelector, K> {
  @override
  Widget itemBuilder(context, item) {
    return BaseLineWidget(
      uuid: item.item?.uuid ?? '',
      title: item.item?.title ?? '',
      description: item.item?.description ?? '',
      details: item.item?.detailsFormatted ?? '',
      progress: 1.0,
      color: item.item?.color ?? Colors.transparent,
      icon: item.item?.icon ?? Icons.radio_button_unchecked_sharp,
      hidden: item.item?.hidden ?? false,
      width: widget.width,
      showDivider: false,
    );
  }

  @override
  Widget selectorBuilder(context, item) {
    return BaseLineWidget(
      uuid: item.item?.uuid ?? '',
      title: item.item?.title ?? '',
      description: item.item?.description ?? '',
      details: item.item?.detailsFormatted ?? '',
      progress: item.item?.progress ?? 0.0,
      color: item.item?.color ?? Colors.transparent,
      icon: item.item?.icon ?? Icons.radio_button_unchecked_sharp,
      hidden: item.item?.hidden ?? false,
      width: widget.width - 40,
      showDivider: false,
    );
  }
}
