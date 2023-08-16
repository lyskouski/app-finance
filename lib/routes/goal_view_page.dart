// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_menu.dart';
import 'package:app_finance/_classes/data/bill_app_data.dart';
import 'package:app_finance/_classes/data/goal_app_data.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/home/base_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

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
  String getTitle(context) {
    final data = super.state.getByUuid(widget.uuid) as GoalAppData;
    return data.title;
  }

  void deactivateGoal(GoalAppData data, BuildContext context) {
    data.hidden = true;
    super.state.update(AppDataType.goals, widget.uuid, data);
    Navigator.pop(context);
  }

  void completeGoal(GoalAppData data, BuildContext context) {
    var newBill = BillAppData(
        account: defaultAccount,
        category: '',
        title: '${AppLocalizations.of(context)!.completeGoalTooltip}: ${data.title}',
        details: data.details,
        currency: data.currency);
    newBill = super.state.add(AppDataType.bills, newBill);
    deactivateGoal(data, context);
    String route = AppMenu(context: context).uuid(AppRoute.billEditRoute, newBill.uuid ?? '');
    Navigator.popAndPushNamed(context, route);
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    final data = super.state.getByUuid(widget.uuid) as GoalAppData;
    String route = AppMenu(context: context).uuid(AppRoute.goalEditRoute, widget.uuid);
    double indent = ThemeHelper(windowType: getWindowType(context)).getIndent() * 4;
    return Container(
      margin: EdgeInsets.only(left: indent),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        data.progress == 1.0
            ? FloatingActionButton(
                heroTag: 'goal_view_page_check',
                onPressed: () => completeGoal(data, context),
                tooltip: AppLocalizations.of(context)!.completeGoalTooltip,
                child: const Icon(Icons.check),
              )
            : FloatingActionButton(
                heroTag: 'goal_view_page_deactivate',
                onPressed: () => deactivateGoal(data, context),
                tooltip: AppLocalizations.of(context)!.deleteGoalTooltip,
                child: const Icon(Icons.delete),
              ),
        FloatingActionButton(
          heroTag: 'goal_view_page_edit',
          onPressed: () => Navigator.pushNamed(context, route),
          tooltip: AppLocalizations.of(context)!.editGoalTooltip,
          child: const Icon(Icons.edit),
        ),
      ]),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final item = super.state.getByUuid(widget.uuid) as GoalAppData;
    item.setContext(context);
    double indent = ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 3;
    return Column(
      children: [
        BaseLineWidget(
          title: item.title,
          offset: offset,
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
