// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_wrappers/tab_widget.dart';
import 'package:app_finance/widgets/home/goal_line_widget.dart';
import 'package:flutter/material.dart';

class GoalWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final List<dynamic> state;

  const GoalWidget({
    super.key,
    required this.margin,
    required this.state,
  });

  @override
  Widget build(context) {
    if (state.isEmpty) {
      return ThemeHelper.emptyBox;
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Transform.translate(
      offset: const Offset(0, 18),
      child: Container(
        margin: margin,
        height: 50 + ThemeHelper.getIndent(3),
        color: colorScheme.inversePrimary,
        child: TabWidget(
          asDots: true,
          children: state.map((e) => GoalLineWidget(goal: e)).toList(),
        ),
      ),
    );
  }
}
