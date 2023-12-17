// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/wrapper/tab_widget.dart';
import 'package:app_finance/pages/home/widgets/goal_line_widget.dart';
import 'package:app_finance/design/wrapper/tap_widget.dart';
import 'package:flutter/material.dart';

class GoalWidget extends StatelessWidget {
  final double? width;
  final List<dynamic> state;

  const GoalWidget({
    super.key,
    required this.state,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (state.isEmpty) {
      return TapWidget(
        route: const RouteSettings(name: AppRoute.goalAddRoute),
        tooltip: AppLocale.labels.addGoalTooltip,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: ThemeHelper.getIndent()),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: context.colorScheme.primary.withOpacity(0.2),
              border: Border.all(color: context.colorScheme.inverseSurface.withOpacity(0.1), width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Center(
                child: Text(AppLocale.labels.addGoalTooltip, style: context.textTheme.headlineMedium),
              ),
            ),
          ),
        ),
      );
    }
    return SizedBox(
      height: 70,
      child: Transform.translate(
        offset: const Offset(0, 18),
        child: TabWidget(
          type: TabType.dots,
          maxWidth: width,
          children: state.map((e) => GoalLineWidget(goal: e, width: width)).toList(),
        ),
      ),
    );
  }
}
