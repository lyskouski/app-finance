// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/charts/bar_horizontal_single.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:app_finance/widgets/_wrappers/tap_widget.dart';
import 'package:flutter/material.dart';

class BudgetLineWidget extends StatelessWidget {
  final String uuid;
  final String title;
  final String details;
  final String description;
  final double progress;
  final Color color;
  final IconData icon;
  final double width;
  final String route;
  final bool hidden;

  const BudgetLineWidget({
    super.key,
    required this.uuid,
    required this.title,
    required this.details,
    required this.description,
    required this.color,
    required this.icon,
    required this.width,
    this.hidden = false,
    this.progress = 1,
    this.route = '',
  });

  @override
  Widget build(BuildContext context) {
    if (hidden) {
      return const SizedBox();
    }
    final indent = ThemeHelper.getIndent();
    final width = ThemeHelper.getWidth(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final sum = Text(
      details,
      maxLines: 1,
      style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
      overflow: TextOverflow.ellipsis,
    );

    return TapWidget(
      tooltip: title,
      route: AppMenu.uuid(route, uuid),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowWidget(
            chunk: [18, null, ThemeHelper.getTextWidth(sum)],
            indent: indent,
            maxWidth: width + indent,
            children: [
              [
                Icon(icon, color: color),
              ],
              if (description != '')
                [
                  Column(
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
                ]
              else
                [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, indent - 1, 0, indent - 1),
                    child: Text(
                      title,
                      style: textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              [
                sum,
              ]
            ],
          ),
          SizedBox(height: indent / 2),
          BarHorizontalSingle(value: progress, width: width, color: color),
          SizedBox(height: indent / 2),
        ],
      ),
    );
  }
}
