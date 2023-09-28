// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/wrapper/tab_widget.dart';
import 'package:app_finance/pages/home/widgets/goal_line_widget.dart';
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
      return ThemeHelper.emptyBox;
    }
    return SizedBox(
      height: 70,
      child: Transform.translate(
        offset: const Offset(0, 18),
        child: TabWidget(
          asDots: true,
          maxWidth: width,
          children: state.map((e) => GoalLineWidget(goal: e, width: width)).toList(),
        ),
      ),
    );
  }
}
