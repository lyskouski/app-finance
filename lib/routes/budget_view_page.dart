// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_locale.dart';
import 'package:app_finance/_classes/app_menu.dart';
import 'package:app_finance/_classes/data/budget_app_data.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/home/base_line_widget.dart';
import 'package:app_finance/widgets/home/base_list_infinite_widget.dart';
import 'package:flutter/material.dart';

class BudgetViewPage extends AbstractPage {
  final String uuid;

  BudgetViewPage({
    required this.uuid,
  }) : super();

  @override
  BudgetViewPageState createState() => BudgetViewPageState();
}

class BudgetViewPageState extends AbstractPageState<BudgetViewPage> {
  @override
  String getTitle(context) {
    final item = super.state.getByUuid(widget.uuid) as BudgetAppData;
    return item.title;
  }

  void deactivateAccount(BuildContext context) {
    var data = super.state.getByUuid(widget.uuid) as BudgetAppData;
    data.hidden = true;
    super.state.update(AppDataType.budgets, widget.uuid, data);
    Navigator.pop(context);
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    String route = AppMenu.uuid(AppRoute.budgetEditRoute, widget.uuid);
    double indent = ThemeHelper(windowType: getWindowType(context)).getIndent() * 4;
    return Container(
      margin: EdgeInsets.only(left: indent),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        FloatingActionButton(
          heroTag: 'budget_view_page_deactivate',
          onPressed: () => deactivateAccount(context),
          tooltip: AppLocale.labels.deleteBudgetTooltip,
          child: const Icon(Icons.delete),
        ),
        FloatingActionButton(
          heroTag: 'budget_view_page_edit',
          onPressed: () => Navigator.pushNamed(context, route),
          tooltip: AppLocale.labels.editBudgetTooltip,
          child: const Icon(Icons.edit),
        ),
      ]),
    );
  }

  Widget buildListWidget(item, BuildContext context, double offset) {
    return BaseLineWidget(
      uuid: '',
      title: '',
      description: item.getDateFormatted(item.timestamp),
      progress: 1.0,
      details: item.getNumberFormatted(item.changedTo - item.changedFrom),
      color: Colors.transparent,
      offset: offset,
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final item = super.state.getByUuid(widget.uuid) as BudgetAppData;
    double indent = ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 3;
    return Column(
      children: [
        BaseLineWidget(
          uuid: item.uuid ?? '',
          title: item.title,
          description: item.description,
          details: item.detailsFormatted,
          progress: item.progress,
          color: item.color ?? Colors.transparent,
          offset: offset,
          route: AppRoute.budgetViewRoute,
        ),
        Expanded(
          child: BaseListInfiniteWidget(
            state: super.state.getLog(widget.uuid),
            offset: offset,
            buildListWidget: buildListWidget,
          ),
        ),
        const SizedBox(height: 70),
      ],
    );
  }
}
