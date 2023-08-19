// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/data_handler.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_generic/base_line_widget.dart';
import 'package:flutter/material.dart';

class GoalViewPage extends AbstractPage {
  final String uuid;

  GoalViewPage({
    required this.uuid,
  }) : super();

  @override
  GoalViewPageState createState() => GoalViewPageState();
}

class GoalViewPageState extends AbstractPageState<GoalViewPage> with SharedPreferencesMixin {
  late String defaultAccount;

  @override
  void initState() {
    defaultAccount = getPreference(prefAccount) ?? '';
    super.initState();
  }

  @override
  String getTitle() {
    final data = super.state.getByUuid(widget.uuid) as GoalAppData;
    return data.title;
  }

  void completeGoal(GoalAppData data, NavigatorState nav) {
    var newBill = BillAppData(
      account: defaultAccount,
      category: '',
      title: '${AppLocale.labels.completeGoalTooltip}: ${data.title}',
      details: data.details,
      currency: data.currency,
    );
    newBill = super.state.add(newBill);
    DataHandler.deactivate(nav, store: super.state, data: data);
    String route = AppMenu.uuid(AppRoute.billEditRoute, newBill.uuid ?? '');
    nav.popAndPushNamed(route);
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    final data = super.state.getByUuid(widget.uuid) as GoalAppData;
    String route = AppMenu.uuid(AppRoute.goalEditRoute, widget.uuid);
    double indent = ThemeHelper.getIndent(4);
    NavigatorState nav = Navigator.of(context);
    return Container(
      margin: EdgeInsets.only(left: indent),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        data.progress == 1.0
            ? FloatingActionButton(
                heroTag: 'goal_view_page_check',
                onPressed: () => completeGoal(data, nav),
                tooltip: AppLocale.labels.completeGoalTooltip,
                child: const Icon(Icons.check),
              )
            : FloatingActionButton(
                heroTag: 'goal_view_page_deactivate',
                onPressed: () => DataHandler.deactivate(nav, store: super.state, data: data),
                tooltip: AppLocale.labels.deleteGoalTooltip,
                child: const Icon(Icons.delete),
              ),
        FloatingActionButton(
          heroTag: 'goal_view_page_edit',
          onPressed: () => nav.pushNamed(route),
          tooltip: AppLocale.labels.editGoalTooltip,
          child: const Icon(Icons.edit),
        ),
      ]),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final item = super.state.getByUuid(widget.uuid) as GoalAppData;
    return Column(
      children: [
        BaseLineWidget(
          title: item.title,
          width: ThemeHelper.getWidth(context, 6),
          uuid: widget.uuid,
          details: item.getNumberFormatted(item.details),
          description: item.closedAtFormatted,
          color: item.color ?? Colors.green.shade700,
          hidden: item.hidden,
          progress: item.progress,
          route: AppRoute.goalViewRoute,
        )
      ],
    );
  }
}
