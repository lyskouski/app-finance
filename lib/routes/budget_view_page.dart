// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/data_handler.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_generic/base_line_widget.dart';
import 'package:app_finance/widgets/_generic/base_list_infinite_widget.dart';
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
  String getTitle() {
    final item = super.state.getByUuid(widget.uuid) as BudgetAppData;
    return item.title;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    String route = AppMenu.uuid(AppRoute.budgetEditRoute, widget.uuid);
    double indent = ThemeHelper.getIndent(4);
    NavigatorState nav = Navigator.of(context);
    return Container(
      margin: EdgeInsets.only(left: indent),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        FloatingActionButton(
          heroTag: 'budget_view_page_deactivate',
          onPressed: () => DataHandler.deactivate(nav, store: super.state, uuid: widget.uuid),
          tooltip: AppLocale.labels.deleteBudgetTooltip,
          child: const Icon(Icons.delete),
        ),
        FloatingActionButton(
          heroTag: 'budget_view_page_edit',
          onPressed: () => nav.pushNamed(route),
          tooltip: AppLocale.labels.editBudgetTooltip,
          child: const Icon(Icons.edit),
        ),
      ]),
    );
  }

  Widget buildListWidget(item, BuildContext context, double width) {
    return BaseLineWidget(
      uuid: '',
      title: '',
      description: item.getDateFormatted(item.timestamp),
      progress: 1.0,
      details: item.getNumberFormatted(item.changedTo - item.changedFrom),
      color: Colors.transparent,
      width: width,
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final item = super.state.getByUuid(widget.uuid) as BudgetAppData;
    double width = ThemeHelper.getWidth(context, 6);
    return Column(
      children: [
        BaseLineWidget(
          uuid: item.uuid ?? '',
          title: item.title,
          description: item.description,
          details: item.detailsFormatted,
          progress: item.progress,
          color: item.color ?? Colors.transparent,
          width: width,
          route: AppRoute.budgetViewRoute,
        ),
        Expanded(
          child: BaseListInfiniteWidget(
            state: super.state.getLog(widget.uuid),
            width: width,
            buildListWidget: buildListWidget,
          ),
        ),
        const SizedBox(height: 70),
      ],
    );
  }
}
