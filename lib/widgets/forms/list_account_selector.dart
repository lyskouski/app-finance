// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/data.dart';
import 'package:app_finance/widgets/home/base_list_widget.dart';
import 'package:flutter/material.dart';

class ListAccountSelectorItem<T> {
  final String id;
  T item;

  ListAccountSelectorItem({required this.id, required this.item});
}

class ListAccountSelector<T extends ListAccountSelectorItem> extends StatelessWidget {
  AppData? state;
  Function setState;
  TextStyle? style;
  String? value;
  double indent;
  double width;

  ListAccountSelector({
    required this.state,
    required this.setState,
    required this.width,
    this.style,
    this.value,
    this.indent = 0.0,
  }) : super(key: UniqueKey());

  List<T> getList(BuildContext context) {
    return state
        ?.get(AppDataType.accounts)
        .list
        .map((item) => ListAccountSelectorItem(
              id: item.uuid ?? '',
              item: item,
            ))
        .cast<ListAccountSelectorItem>()
        .toList();
  }

  @override
  Widget build(context) {
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
      width: double.infinity,
      child: DropdownButton<String>(
        isExpanded: true,
        value: value,
        itemHeight: null,
        onChanged: (value) => setState(value),
        items: getList(context)
            .map<DropdownMenuItem<String>>((value) {
          value.item?.updateContext(context);
          return DropdownMenuItem<String>(
            value: value.id,
            child: Padding(
              padding: EdgeInsets.only(top: indent),
              child: BaseLineWidget(
                uuid: value.item?.uuid ?? '',
                title: value.item?.title ?? '',
                description: value.item?.description ?? '',
                details: value.item?.detailsFormatted ?? '',
                progress: value.item?.progress ?? 0.0,
                color: value.item?.color ?? Colors.transparent,
                hidden: value.item?.hidden ?? false,
                offset: width - indent * 3,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
