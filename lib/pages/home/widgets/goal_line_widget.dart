// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/widgets/wrapper/tap_widget.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_layout/flutter_grid_layout.dart';

class GoalLineWidget extends StatelessWidget {
  final GoalAppData goal;
  final double? width;

  const GoalLineWidget({
    super.key,
    required this.goal,
    this.width,
  });

  @override
  Widget build(context) {
    final indent = ThemeHelper.getIndent();
    final ColorScheme colorScheme = context.colorScheme;
    final TextTheme textTheme = context.textTheme;
    double screenWidth = (width ?? ThemeHelper.getWidth(context, 2)) - indent * 1.5;
    return TapWidget(
      tooltip: AppLocale.labels.goalTooltip,
      route: const RouteSettings(name: AppRoute.goalRoute),
      child: Container(
        color: colorScheme.inversePrimary,
        height: 20,
        child: GridContainer(
          rows: [indent, null, null, indent],
          columns: [indent, 18, 24, indent, indent, indent / 2],
          children: [
            if (goal.progress == 1)
              GridItem(
                start: const Size(2, 0),
                end: const Size(4, 4),
                order: 3,
                child: Banner(
                  message: AppLocale.labels.processIsFinished,
                  location: BannerLocation.topEnd,
                  textStyle: textTheme.numberSmall,
                ),
              ),
            GridItem(
              start: const Size(1, 1),
              end: const Size(2, 2),
              child: Text(
                AppLocale.labels.goalHeadline,
                style: textTheme.headlineSmall,
              ),
            ),
            GridItem(
              start: const Size(1, 2),
              end: const Size(3, 3),
              child: Text(
                goal.title,
                style: textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GridItem(
              start: const Size(2, 2),
              end: const Size(3, 3),
              child: Padding(
                padding: EdgeInsets.only(top: ThemeHelper.getIndent(0.7)),
                child: Text(
                  goal.closedAtFormatted,
                  style: textTheme.headlineSmall,
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridItem(
              start: const Size(1, 3),
              end: const Size(3, 4),
              child: LinearProgressIndicator(
                value: goal.progress,
                backgroundColor: colorScheme.primary.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.onPrimaryContainer),
              ),
            ),
            GridItem(
              start: const Size(1, 3),
              end: const Size(3, 4),
              order: 2,
              child: Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: screenWidth * goal.state),
                height: 5.0,
                child: Tooltip(
                  message: AppLocale.labels.currentDate,
                  child: Container(
                    width: 5.0,
                    decoration: BoxDecoration(
                      color: colorScheme.inversePrimary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
