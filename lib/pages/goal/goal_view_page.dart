// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/flow_state_machine.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/widgets/generic/base_line_widget.dart';
import 'package:app_finance/widgets/wrapper/confirmation_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class GoalViewPage extends StatefulWidget {
  final String uuid;

  const GoalViewPage({
    super.key,
    required this.uuid,
  });

  @override
  GoalViewPageState createState() => GoalViewPageState();
}

class GoalViewPageState extends AbstractPageState<GoalViewPage> {
  late String defaultAccount;

  @override
  void initState() {
    defaultAccount = AppPreferences.get(AppPreferences.prefAccount) ?? '';
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
    FlowStateMachine.deactivate(nav, store: super.state, data: data);
    nav.popAndPushNamed(AppRoute.billEditRoute, arguments: {routeArguments.uuid: newBill.uuid ?? ''});
  }

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    final data = super.state.getByUuid(widget.uuid) as GoalAppData;
    double indent = ThemeHelper.getIndent(4);
    NavigatorState nav = Navigator.of(context);
    return Container(
      margin: EdgeInsets.only(left: 2 * indent, right: 2 * indent),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        FloatingActionButton(
          heroTag: 'goal_view_page_edit',
          onPressed: () => nav.pushNamed(AppRoute.goalEditRoute, arguments: {routeArguments.uuid: widget.uuid}),
          tooltip: AppLocale.labels.editGoalTooltip,
          child: const Icon(Icons.edit),
        ),
        data.progress == 1.0
            ? FloatingActionButton(
                heroTag: 'goal_view_page_check',
                onPressed: () => completeGoal(data, nav),
                tooltip: AppLocale.labels.completeGoalTooltip,
                child: const Icon(Icons.check),
              )
            : FloatingActionButton(
                heroTag: 'goal_view_page_deactivate',
                onPressed: () => ConfirmationWrapper.show(
                  context,
                  () => FlowStateMachine.deactivate(nav, store: super.state, data: data),
                ),
                tooltip: AppLocale.labels.deleteGoalTooltip,
                child: const Icon(Icons.delete),
              ),
      ]),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final item = super.state.getByUuid(widget.uuid) as GoalAppData;
    return Padding(
      padding: EdgeInsets.only(top: ThemeHelper.getIndent()),
      child: Column(
        children: [
          BaseLineWidget(
            title: item.title,
            width: ThemeHelper.getWidth(context, 3),
            uuid: widget.uuid,
            details: (item.details as double).toCurrency(currency: item.currency, withPattern: false),
            description: item.closedAtFormatted,
            color: item.color ?? Colors.green.shade700,
            icon: item.icon ?? Icons.radio_button_unchecked_sharp,
            hidden: item.hidden,
            progress: item.progress,
            route: AppRoute.goalViewRoute,
          )
        ],
      ),
    );
  }
}
