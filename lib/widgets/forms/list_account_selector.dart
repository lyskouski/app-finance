// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/classes/account_app_data.dart';
import 'package:app_finance/widgets/home/base_list_widget.dart';
import 'package:flutter/material.dart';

class ListAccountSelectorItem {
  final String id;
  final AccountAppData account;

  ListAccountSelectorItem({required this.id, required this.account});
}

class ListAccountSelector extends StatelessWidget {
  List<ListAccountSelectorItem> options;
  Function setState;
  TextStyle? style;
  String? value;
  double indent;
  double width;

  ListAccountSelector({
    super.key,
    required this.options,
    required this.setState,
    required this.width,
    this.style,
    this.value,
    this.indent = 0.0,
  });

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
        items: options
            .map<DropdownMenuItem<String>>((ListAccountSelectorItem value) {
          value.account.updateContext(context);
          return DropdownMenuItem<String>(
            value: value.id,
            child: Padding(
              padding: EdgeInsets.only(top: indent),
              child: BaseLineWidget(
                uuid: value.account.uuid ?? '',
                title: value.account.title,
                description: value.account.description ?? '',
                details: value.account.detailsFormatted,
                progress: value.account.progress,
                color: value.account.color ?? Colors.transparent,
                hidden: value.account.hidden,
                offset: width - indent * 3,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
