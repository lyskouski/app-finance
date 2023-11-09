// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/bar_horizontal_single.dart';
import 'package:app_finance/design/generic/base_swipe_widget.dart';
import 'package:app_finance/design/wrapper/number_wrapper.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/tap_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class BudgetLineWidget extends StatelessWidget {
  final String uuid;
  final String title;
  final String details;
  final String description;
  final double progress;
  final String amount;
  final Color color;
  final IconData icon;
  final double width;
  final String route;
  final bool hidden;
  final bool showDivider;
  final int count;

  const BudgetLineWidget({
    super.key,
    required this.uuid,
    required this.title,
    required this.details,
    required this.description,
    required this.color,
    required this.amount,
    required this.icon,
    required this.width,
    this.count = 1,
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
            count > 2
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: indent),
                    child: RowWidget(
                      chunk: const [20, null, 0.3, 0.15, 0.1],
                      indent: indent,
                      maxWidth: width,
                      children: [
                        [
                          Icon(icon, color: color, size: iconSize),
                        ],
                        [
                          TextWrapper(title, style: textTheme.bodyMedium),
                        ],
                        [
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextWrapper(description, style: textTheme.numberMedium),
                          ),
                        ],
                        [
                          Align(
                            alignment: Alignment.centerRight,
                            child:
                                NumberWidget(amount, colorScheme: context.colorScheme, style: textTheme.numberMedium),
                          ),
                        ],
                        [
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: indent * 2),
                            child:
                                NumberWidget(details, colorScheme: context.colorScheme, style: textTheme.numberMedium),
                          ),
                        ],
                      ],
                    ),
                  )
                : RowWidget(
                    chunk: [
                      iconSize,
                      null,
                      ThemeHelper.getTextWidth(Text(details, style: textTheme.numberMedium)),
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
