// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/goal/widgets/goal_line_widget.dart';
import 'package:app_finance/pages/goal/widgets/goals_header_delegate.dart';
import 'package:app_finance/pages/goal/widgets/profit_widget.dart';
import 'package:flutter/material.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({super.key});

  @override
  GoalPageState createState() => GoalPageState();
}

class GoalPageState extends AbstractPageState<GoalPage> {
  @override
  String getTitle() {
    return AppLocale.labels.goalHeadline;
  }

  @override
  String getButtonName() => AppLocale.labels.addGoalTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'goal_view_page',
      onPressed: () => nav.pushNamed(AppRoute.goalAddRoute),
      tooltip: getButtonName(),
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final width = ThemeHelper.getWidth(context, 4, constraints);
    final indent = ThemeHelper.getIndent();
    final goals = state.getStream(AppDataType.goals);
    final widthCount = ThemeHelper.getWidthCount(constraints, context);

    return Padding(
      padding: EdgeInsets.all(ThemeHelper.getIndent()),
      child: Column(
        children: [
          ThemeHelper.hIndent,
          Align(
            alignment: Alignment.centerRight,
            child: ProfitWidget(store: state, width: width / widthCount),
          ),
          ThemeHelper.hIndent,
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverMainAxisGroup(
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: GoalsHeaderDelegate(count: widthCount, width: width),
                    ),
                    SliverList.builder(
                      itemCount: goals.length,
                      itemBuilder: (_, int index) {
                        final goal = goals.next as GoalAppData;
                        return Container(
                          color: index % 2 == 0 ? context.colorScheme.onBackground.withOpacity(0.015) : null,
                          padding: EdgeInsets.only(top: indent),
                          child: GoalLineWidget(
                            title: goal.title,
                            width: width,
                            count: widthCount,
                            uuid: goal.uuid ?? '',
                            details: goal.details,
                            currency: goal.currency,
                            description: goal.closedAtFormatted,
                            color: goal.color ?? Colors.green.shade700,
                            icon: goal.icon ?? Icons.star,
                            hidden: goal.hidden,
                            progress: goal.progress,
                            route: AppRoute.goalViewRoute,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
