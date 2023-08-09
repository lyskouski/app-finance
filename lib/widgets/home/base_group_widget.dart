// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/charts/bar_vertical_group.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:flutter/material.dart';

class BaseGroupWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<double> progress;
  final List<Color> color;
  final double offset;
  final String route;

  const BaseGroupWidget({
    super.key,
    required this.title,
    required this.description,
    required this.color,
    required this.offset,
    this.progress = const [],
    this.route = '',
  });

  @override
  Widget build(BuildContext context) {
    var theme = ThemeHelper(windowType: getWindowType(context));
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BarVerticalGroup(value: progress, height: 24, color: color),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: offset * 0.6,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          description,
                          style: textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
