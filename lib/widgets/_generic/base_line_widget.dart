// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/charts/bar_vertical_single.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:app_finance/widgets/_wrappers/tap_widget.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:flutter/material.dart';

class BaseLineWidget extends StatelessWidget {
  final String uuid;
  final String title;
  final String details;
  final String description;
  final double progress;
  final Color color;
  final double width;
  final String route;
  final bool hidden;
  final bool showDivider;

  const BaseLineWidget({
    super.key,
    required this.uuid,
    required this.title,
    required this.details,
    required this.description,
    required this.color,
    required this.width,
    this.hidden = false,
    this.progress = 1,
    this.route = '',
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    if (hidden) {
      return const SizedBox();
    }
    final TextTheme textTheme = Theme.of(context).textTheme;
    final indent = ThemeHelper.getIndent();
    final detailsText = Text(
      details,
      style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
      overflow: TextOverflow.ellipsis,
    );

    return TapWidget(
      tooltip: title,
      toWrap: route != '',
      route: AppMenu.uuid(route, uuid),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowWidget(
            indent: indent,
            alignment: MainAxisAlignment.start,
            maxWidth: width,
            chunk: [indent * 1.5, null, ThemeHelper.getTextWidth(detailsText) + 2 * indent],
            children: [
              [
                Padding(
                  padding: EdgeInsets.only(left: indent),
                  child: BarVerticalSingle(value: progress, height: 32.0, width: indent / 2, color: color),
                ),
              ],
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
              ],
              [
                Align(
                  alignment: Alignment.centerRight,
                  child: detailsText,
                ),
              ],
            ],
          ),
          if (showDivider) ...[const Divider()],
        ],
      ),
    );
  }
}
