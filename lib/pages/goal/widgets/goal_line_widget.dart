// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
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
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class GoalLineWidget extends StatelessWidget {
  final String uuid;
  final String title;
  final double details;
  final String description;
  final double progress;
  final Color color;
  final IconData icon;
  final double width;
  final String route;
  final bool hidden;
  final bool showDivider;
  final int count;
  final Currency? currency;

  const GoalLineWidget({
    super.key,
    required this.uuid,
    required this.title,
    required this.details,
    required this.description,
    required this.color,
    required this.icon,
    required this.currency,
    required this.width,
    this.count = 2,
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
    final targetFormatted = details.toCurrency(currency: currency, withPattern: false);
    final curFormatted = (details * progress).toCurrency(currency: currency, withPattern: false);
    return BaseSwipeWidget(
      routePath: AppRoute.budgetEditRoute,
      uuid: uuid,
      child: TapWidget(
        tooltip: '',
        route: RouteSettings(name: route, arguments: {routeArguments.uuid: uuid}),
        child: Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            RowWidget(
              chunk: [
                iconSize,
                null,
                ...(count > 2 ? [0.2, 0.15, 0.1, 0.1] : [0, 0, 0, null])
              ],
              indent: indent,
              maxWidth: width + indent,
              children: [
                [
                  Padding(padding: EdgeInsets.only(top: indent), child: Icon(icon, color: color, size: iconSize)),
                ],
                if (description != '' && count < 2)
                  [
                    Column(
                      crossAxisAlignment: AppDesign.getAlignment(),
                      children: [
                        TextWrapper(title, style: textTheme.bodyMedium),
                        TextWrapper(AppLocale.labels.goalProfit(description), style: textTheme.numberSmall),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: NumberWidget(description, colorScheme: context.colorScheme, style: textTheme.numberMedium),
                  ),
                ],
                [
                  Align(
                    alignment: Alignment.centerRight,
                    child: NumberWidget(curFormatted, colorScheme: context.colorScheme, style: textTheme.numberMedium),
                  ),
                ],
                [
                  Align(
                    alignment: Alignment.centerRight,
                    child: NumberWidget('${(progress * 100).toStringAsFixed(2)}%',
                        colorScheme: context.colorScheme, style: textTheme.numberMedium),
                  ),
                ],
                [
                  Align(
                    alignment: Alignment.centerRight,
                    child:
                        NumberWidget(targetFormatted, colorScheme: context.colorScheme, style: textTheme.numberMedium),
                  ),
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
