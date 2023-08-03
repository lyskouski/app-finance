// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/widgets/home/base_line_widget.dart';
import 'package:flutter/material.dart';

class ListAccountSelectorItem<T> {
  final String id;
  T item;

  ListAccountSelectorItem({required this.id, required this.item});
}

class ListAccountSelector<T extends ListAccountSelectorItem> extends StatefulWidget {
  final AppData state;
  final Function setState;
  final TextStyle? style;
  final String? value;
  final double indent;
  final double width;
  final int focusOrder;

  ListAccountSelector({
    required this.state,
    required this.setState,
    required this.width,
    this.style,
    this.value,
    this.indent = 0.0,
    this.focusOrder = FocusController.DEFAULT,
  }) : super(key: UniqueKey());

  List<T> getList() {
    return state
        .get(AppDataType.accounts)
        .list
        .map((item) => ListAccountSelectorItem(
              id: item.uuid ?? '',
              item: item,
            ))
        .cast<ListAccountSelectorItem>()
        .toList();
  }

  @override
  ListAccountSelectorState createState() => ListAccountSelectorState();
}

class ListAccountSelectorState extends State<ListAccountSelector> {
  List<DropdownMenuItem<String>>? scope;

  List<DropdownMenuItem<String>> generateList(context) {
    return widget.getList().map<DropdownMenuItem<String>>((value) {
      if (value.item?.getContext() == null) {
        value.item?.updateContext(context);
      }
      return DropdownMenuItem<String>(
        value: value.id,
        child: Padding(
          padding: EdgeInsets.only(top: widget.indent),
          child: BaseLineWidget(
            uuid: value.item?.uuid ?? '',
            title: value.item?.title ?? '',
            description: value.item?.description ?? '',
            details: value.item?.detailsFormatted ?? '',
            progress: value.item?.progress ?? 0.0,
            color: value.item?.color ?? Colors.transparent,
            hidden: value.item?.hidden ?? false,
            offset: widget.width - widget.indent * 3,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(context) {
    scope ??= generateList(context);
    FocusController.init(widget.focusOrder, widget.value);

    return Container(
      color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
      width: double.infinity,
      child: DropdownButton<String>(
        isExpanded: true,
        value: widget.value,
        itemHeight: null,
        focusNode: FocusController.getFocusNode(),
        autofocus: FocusController.isFocused(),
        onChanged: (value) {
          widget.setState(value);
          FocusController.resetFocus();
        },
        items: scope,
      ),
    );
  }
}
