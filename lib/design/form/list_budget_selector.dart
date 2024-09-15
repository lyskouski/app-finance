// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/form/list_selector.dart';
import 'package:app_finance/pages/budget/widgets/budget_line_widget.dart';
import 'package:app_finance/design/form/list_account_selector.dart';
import 'package:flutter/material.dart';

class ListBudgetSelectorItem extends ListAccountSelectorItem {
  @override
  Widget suggest(context) => LayoutBuilder(builder: (_, constraints) {
        return BudgetLineWidget(
          uuid: item.uuid ?? '',
          title: item.title ?? '',
          description: item.description ?? '',
          details: item.detailsFormatted ?? '',
          amount: item.amount.toString(),
          progress: 1.0,
          color: item.color ?? Colors.transparent,
          icon: item.icon ?? Icons.radio_button_unchecked_sharp,
          hidden: item.hidden ?? false,
          width: constraints.maxWidth - ThemeHelper.getIndent(),
          showDivider: false,
        );
      });

  ListBudgetSelectorItem({
    required BudgetAppData? super.item,
  });
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
  ListSelectorState createState() => ListSelectorState<ListBudgetSelector, ListBudgetSelectorItem>();
}
