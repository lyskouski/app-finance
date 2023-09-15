// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/widgets/budget/budget_widget.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  final String? search;
  const BudgetPage({
    super.key,
    this.search,
  });

  @override
  BudgetPageState createState() => BudgetPageState();
}

class BudgetPageState extends AbstractPageState<BudgetPage> {
  dynamic items;

  dynamic _getItems() {
    dynamic items;
    if (widget.search != null) {
      final scope =
          super.state.getList(AppDataType.budgets).where((e) => e.title.toString().startsWith(widget.search!)).toList();
      final ex = Exchange(store: super.state);
      items = (
        total: scope.fold(0.0, (v, e) => v + ex.reform(e.details, e.currency, ex.getDefaultCurrency())),
        list: scope
      );
    } else {
      items = super.state.get(AppDataType.budgets);
    }
    return items;
  }

  @override
  String getTitle() {
    if (widget.search != null) {
      return AppLocale.labels.search(widget.search!);
    }
    return AppLocale.labels.budgetHeadline;
  }

  @override
  String getButtonName() => AppLocale.labels.addBudgetTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'budget_page',
      onPressed: () => nav.pushNamed(AppRoute.budgetAddRoute),
      tooltip: getButtonName(),
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    if (items == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() => items = _getItems()));
      return ThemeHelper.emptyBox;
    }
    return Column(
      children: [
        BudgetWidget(
          margin: EdgeInsets.all(ThemeHelper.getIndent()),
          title: AppLocale.labels.budgetHeadline,
          state: items,
          width: ThemeHelper.getWidth(context),
        )
      ],
    );
  }
}
