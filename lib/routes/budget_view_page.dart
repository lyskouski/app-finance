// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/flow_state_machine.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/history_data.dart';
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

  const BudgetViewPage({
    super.key,
    required this.uuid,
  });

  @override
  BudgetViewPageState createState() => BudgetViewPageState();
}

class BudgetViewPageState extends AbstractPageState<BudgetViewPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  String getTitle() {
    final item = super.state.getByUuid(widget.uuid) as BudgetAppData;
    return item.title;
  }

  @override
  String getButtonName() => '';

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
          onPressed: () => FlowStateMachine.deactivate(nav, store: super.state, uuid: widget.uuid),
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

  Widget buildListWidget(item, BuildContext context) {
    return BaseLineWidget(
      uuid: '',
      title: '',
      description: item.getDateFormatted(item.timestamp),
      progress: 1.0,
      details: item.getNumberFormatted(item.delta),
      color: Colors.transparent,
      width: ThemeHelper.getWidth(context, 3),
    );
  }

  Widget buildLineWidget(item, BuildContext context) {
    return BaseLineWidget(
      uuid: item.uuid ?? '',
      title: item.title ?? '',
      description: item.description ?? '',
      details: item.detailsFormatted,
      progress: item.progress,
      color: item.color ?? Colors.transparent,
      hidden: item.hidden,
      width: ThemeHelper.getWidth(context, 3),
      route: AppRoute.billViewRoute,
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final item = super.state.getByUuid(widget.uuid) as BudgetAppData;
    final indent = ThemeHelper.getIndent();
    double width = ThemeHelper.getWidth(context, 3);
    return Padding(
      padding: EdgeInsets.only(top: indent),
      child: Column(
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
          TabBar.secondary(
            controller: _tabController,
            tabs: <Widget>[
              Tab(text: AppLocale.labels.billHeadline),
              Tab(text: AppLocale.labels.budgetLimitHeadline),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(indent, 0, indent, 0),
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  BaseListInfiniteWidget(
                    state: state.getActualList(AppDataType.bills).where((o) => o.category == widget.uuid).toList(),
                    width: width - indent,
                    buildListWidget: buildLineWidget,
                  ),
                  BaseListInfiniteWidget(
                    state: HistoryData.getLog(widget.uuid),
                    width: width - indent,
                    buildListWidget: buildListWidget,
                  ),
                ],
              ),
            ),
          ),
          ThemeHelper.formEndBox,
        ],
      ),
    );
  }
}
