// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
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

class ListAccountSelector<T extends ListAccountSelectorItem> extends ListSelector {
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
    super.focusOrder = FocusController.DEFAULT,
  }) : super();

  @override
  List<T> get options {
    return state
        .get(AppDataType.accounts)
        .list
        .map((item) => ListAccountSelectorItem(item: item))
        .cast<ListAccountSelectorItem>()
        .toList();
  }

  @override
  ListAccountSelectorState createState() => ListAccountSelectorState();
}

class ListAccountSelectorState<T extends ListAccountSelector, K extends ListAccountSelectorItem>
    extends ListSelectorState<T, K> {
  @override
  Widget itemBuilder(context, K item, bool isSelected) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.indent, 0, widget.indent, 0),
      child: selectorBuilder(context, item, true),
    );
  }

  @override
  Widget selectorBuilder(context, K item, [bool showDivider = false]) {
    item.item.updateContext(context);
    return BaseLineWidget(
      uuid: item.item?.uuid ?? '',
      title: item.item?.title ?? '',
      description: item.item?.description ?? '',
      details: item.item?.detailsFormatted ?? '',
      progress: item.item?.progress ?? 0.0,
      color: item.item?.color ?? Colors.transparent,
      hidden: item.item?.hidden ?? false,
      offset: widget.width - widget.indent * 3,
      showDivider: showDivider,
    );
  }
}
