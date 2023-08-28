// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/widgets/_forms/list_account_selector.dart';

class ListBudgetSelectorItem extends ListAccountSelectorItem {
  ListBudgetSelectorItem({
    required BudgetAppData item,
  }) : super(item: item);
}

class ListBudgetSelector extends ListAccountSelector<ListBudgetSelectorItem> {
  ListBudgetSelector({
    super.key,
    required super.state,
    required super.setState,
    required super.width,
    required super.hintText,
    super.value,
    super.indent = 0.0,
  }) : super();

  @override
  List<ListBudgetSelectorItem> get options {
    return state
        .get(AppDataType.budgets)
        .list
        .map((item) => ListBudgetSelectorItem(item: item))
        .cast<ListBudgetSelectorItem>()
        .toList();
  }
}
