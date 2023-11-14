// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/pages/budget/widgets/budget_line_widget.dart';
import 'package:app_finance/design/form/list_account_selector.dart';
import 'package:flutter/material.dart';

class ListBudgetSelectorItem extends ListAccountSelectorItem {
  ListBudgetSelectorItem({
    required BudgetAppData item,
  }) : super(item: item);
}

class ListBudgetSelector extends ListAccountSelector<ListBudgetSelectorItem> {
  const ListBudgetSelector({
    super.key,
    required super.state,
    required super.setState,
    required super.width,
    required super.hintText,
    super.value,
    super.tooltip,
    super.withLabel,
  }) : super();

  @override
  List<ListBudgetSelectorItem> get options =>
      state.getList(AppDataType.budgets).map((item) => ListBudgetSelectorItem(item: item)).toList();

  @override
  ListBudgetSelectorState createState() => ListBudgetSelectorState();
}

class ListBudgetSelectorState extends ListAccountSelectorState<ListBudgetSelectorItem> {
  @override
  Widget itemBuilder(context, item) {
    return BudgetLineWidget(
      uuid: item.item?.uuid ?? '',
      title: item.item?.title ?? '',
      description: item.item?.description ?? '',
      details: item.item?.detailsFormatted ?? '',
      amount: item.item?.amount.toString() ?? '',
      progress: 1.0,
      color: item.item?.color ?? Colors.transparent,
      icon: item.item?.icon ?? Icons.radio_button_unchecked_sharp,
      hidden: item.item?.hidden ?? false,
      width: widget.width,
      showDivider: false,
    );
  }
}
