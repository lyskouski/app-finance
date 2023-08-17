// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_classes/app_locale.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/home/base_line_widget.dart';
import 'package:flutter/material.dart';

class GoalPage extends AbstractPage {
  GoalPage() : super();

  @override
  GoalPageState createState() => GoalPageState();
}

class GoalPageState extends AbstractPageState<GoalPage> {
  @override
  String getTitle(context) {
    return AppLocale.labels.goalHeadline;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return FloatingActionButton(
      heroTag: 'goal_view_page',
      onPressed: () => Navigator.pushNamed(context, AppRoute.goalAddRoute),
      tooltip: AppLocale.labels.addGoalTooltip,
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    final double offset = MediaQuery.of(context).size.width - helper.getIndent() * 2;
    return Column(
        children: super.state.getList(AppDataType.goals).map((goal) {
      return BaseLineWidget(
        title: goal.title ?? '',
        offset: offset,
        uuid: goal.uuid,
        details: goal.getNumberFormatted(goal.details),
        description: goal.closedAtFormatted,
        color: goal.color ?? Colors.green.shade700,
        hidden: goal.hidden,
        progress: goal.progress,
        route: AppRoute.goalViewRoute,
      );
    }).toList());
  }
}
