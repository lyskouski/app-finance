// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:app_finance/widgets/_wrappers/tap_widget.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:flutter/material.dart';

class GoalLineWidget extends StatelessWidget {
  final GoalAppData goal;

  const GoalLineWidget({
    super.key,
    required this.goal,
  });

  @override
  Widget build(context) {
    final indent = ThemeHelper.getIndent();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = ThemeHelper.getWidth(context, 2);
    return TapWidget(
      tooltip: AppLocale.labels.goalTooltip,
      route: AppRoute.goalRoute,
      child: Container(
        height: 50 + indent * 2,
        color: colorScheme.inversePrimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedBox(
              widthFactor: 1.0,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(indent, indent, 0, 0),
                      child: Text(
                        AppLocale.labels.goalHeadline,
                        style: textTheme.headlineSmall,
                      ),
                    ),
                    RowWidget(
                      indent: indent,
                      maxWidth: screenWidth,
                      alignment: MainAxisAlignment.spaceBetween,
                      chunk: const [0.6, null],
                      children: [
                        [
                          Tooltip(
                            message: goal.title,
                            child: Padding(
                              padding: EdgeInsets.only(left: indent),
                              child: Text(
                                goal.title,
                                style: textTheme.headlineMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                        [
                          Padding(
                            padding: EdgeInsets.only(right: indent),
                            child: Text(
                              goal.closedAtFormatted,
                              style: textTheme.headlineMedium,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                    Container(
                      height: 8,
                      margin: EdgeInsets.fromLTRB(indent, indent / 2, indent, 0),
                      child: LinearProgressIndicator(
                        value: goal.progress,
                        backgroundColor: colorScheme.primary.withOpacity(0.3),
                        valueColor: AlwaysStoppedAnimation<Color>(colorScheme.onPrimaryContainer),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Transform.translate(
                  offset: Offset(indent * 1.5 + screenWidth * goal.state, -6),
                  child: Tooltip(
                    message: AppLocale.labels.currentDate,
                    child: Container(
                      width: 4.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: colorScheme.inversePrimary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
