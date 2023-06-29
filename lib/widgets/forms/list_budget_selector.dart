// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/budget_app_data.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/widgets/forms/list_account_selector.dart';
import 'package:flutter/material.dart';

class ListBudgetSelectorItem extends ListAccountSelectorItem<BudgetAppData> {
  ListBudgetSelectorItem({required String id, required BudgetAppData item})
      : super(id: id, item: item);
}

class ListBudgetSelector extends ListAccountSelector<ListBudgetSelectorItem> {
  ListBudgetSelector({
    required AppData? state,
    required Function setState,
    required double width,
    TextStyle? style,
    String? value,
    double indent = 0.0,
  }) : super(
          state: state,
          setState: setState,
          width: width,
          style: style,
          value: value,
          indent: indent,
        );

  @override
  List<ListBudgetSelectorItem> getList(BuildContext context) {
    return state
        ?.get(AppDataType.budgets)
        .list
        .map((item) => ListBudgetSelectorItem(
              id: item.uuid ?? '',
              item: item,
            ))
        .cast<ListBudgetSelectorItem>()
        .toList();
  }
}
