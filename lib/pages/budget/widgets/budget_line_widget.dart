// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/bar_horizontal_single.dart';
import 'package:app_finance/widgets/generic/base_swipe_widget.dart';
import 'package:app_finance/widgets/wrapper/number_wrapper.dart';
import 'package:app_finance/widgets/wrapper/row_widget.dart';
import 'package:app_finance/widgets/wrapper/tap_widget.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
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
  final bool showDivider;

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
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    if (hidden) {
      return ThemeHelper.emptyBox;
    }
    final indent = ThemeHelper.getIndent();
    final textTheme = context.textTheme;
    const iconSize = 18.0;
    return BaseSwipeWidget(
      routePath: AppRoute.budgetEditRoute,
      uuid: uuid,
      child: TapWidget(
        tooltip: '',
        route: RouteSettings(name: route, arguments: {routeArguments.uuid: uuid}),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowWidget(
              chunk: [
                iconSize,
                null,
                ThemeHelper.getTextWidth(Text(
                  details,
                  maxLines: 1,
                  style: textTheme.numberMedium,
                  overflow: TextOverflow.ellipsis,
                )),
              ],
              indent: indent,
              maxWidth: width + indent,
              children: [
                [
                  Icon(icon, color: color, size: iconSize),
                ],
                if (description != '')
                  [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWrapper(title, style: textTheme.bodyMedium),
                        TextWrapper(description, style: textTheme.numberSmall),
                      ],
                    ),
                  ]
                else
                  [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, indent - 1, 0, indent - 1),
                      child: TextWrapper(title, style: textTheme.bodyMedium),
                    ),
                  ],
                [
                  NumberWidget(details, colorScheme: context.colorScheme, style: textTheme.numberMedium),
                ]
              ],
            ),
            if (showDivider) ...[
              ThemeHelper.hIndent05,
              BarHorizontalSingle(value: progress, width: width, color: color),
              ThemeHelper.hIndent05,
            ],
          ],
        ),
      ),
    );
  }
}
