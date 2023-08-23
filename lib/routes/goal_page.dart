// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_generic/base_line_widget.dart';
import 'package:flutter/material.dart';

class GoalPage extends AbstractPage {
  GoalPage() : super();

  @override
  GoalPageState createState() => GoalPageState();
}

class GoalPageState extends AbstractPageState<GoalPage> {
  @override
  String getTitle() {
    return AppLocale.labels.goalHeadline;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'goal_view_page',
      onPressed: () => nav.pushNamed(AppRoute.goalAddRoute),
      tooltip: AppLocale.labels.addGoalTooltip,
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(ThemeHelper.getIndent()),
        child: Column(
          children: super.state.getList(AppDataType.goals).map((goal) {
            return BaseLineWidget(
              title: goal.title ?? '',
              width: ThemeHelper.getWidth(context, 4),
              uuid: goal.uuid,
              details: goal.getNumberFormatted(goal.details),
              description: goal.closedAtFormatted,
              color: goal.color ?? Colors.green.shade700,
              hidden: goal.hidden,
              progress: goal.progress,
              route: AppRoute.goalViewRoute,
            );
          }).toList(),
        ),
      ),
    );
  }
}
