// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:math';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/bar_vertical_group.dart';
import 'package:app_finance/charts/bar_vertical_single.dart';
import 'package:app_finance/charts/radial_bar_chart.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/tap_widget.dart';
import 'package:flutter/material.dart';

class BaseGroupWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<dynamic> items;
  final List<double> progress;
  final List<Color> color;
  final double width;
  final double total;
  final String route;

  const BaseGroupWidget({
    super.key,
    required this.items,
    required this.title,
    required this.description,
    required this.color,
    required this.width,
    this.progress = const [],
    this.route = '',
    this.total = 0,
  });

  Widget buildCategory(BuildContext context, int index, bool toSwap) {
    final item = items[index];
    final tooltip = StringBuffer();
    tooltip.writeAll(
        ['${AppLocale.labels.title}: "${item.title}"\n', '${AppLocale.labels.details}: ${item.detailsFormatted}']);
    return TapWidget(
      tooltip: tooltip.toString(),
      route: RouteSettings(name: '$route/view', arguments: {routeArguments.uuid: item.uuid}),
      child: toSwap
          ? Column(
              children: [
                Icon(item.icon, size: 16.0, color: item.color),
                const SizedBox(height: 6.0),
                BarVerticalSingle(value: item.progress, height: 14.0, color: item.color ?? Colors.transparent),
              ],
            )
          : RadialBarChart(
              color: item.color,
              icon: item.icon,
              progress: progress[index],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent();
    final textTheme = context.textTheme;
    final titleText = Text(
      title,
      style: textTheme.bodyMedium,
      overflow: TextOverflow.ellipsis,
    );
    final subTitle = Text(
      description,
      style: textTheme.bodySmall,
      overflow: TextOverflow.ellipsis,
    );
    double titleWidth = [ThemeHelper.getTextWidth(titleText), ThemeHelper.getTextWidth(subTitle)].reduce(max);
    if (titleWidth > width / 2) {
      titleWidth = width / 2;
    }
    final toSwap = items.length * 36 + items.length * indent * 2 > width - titleWidth - indent * 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TapWidget(
          route: RouteSettings(name: '$route/search', arguments: {routeArguments.search: title}),
          tooltip: AppLocale.labels.search(title),
          child: RowWidget(
            indent: indent,
            alignment: MainAxisAlignment.start,
            maxWidth: width + indent,
            chunk: [indent * 1.5, titleWidth, null],
            children: [
              [
                Padding(
                  padding: EdgeInsets.only(left: indent),
                  child: BarVerticalGroup(value: progress, height: 32.0, width: indent / 2, color: color),
                ),
              ],
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [titleText, subTitle],
                ),
              ],
              [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(
                    items.length * 2,
                    (index) {
                      if (index % 2 != 0) {
                        return ThemeHelper.wIndent;
                      } else {
                        return buildCategory(context, index ~/ 2, toSwap);
                      }
                    },
                  ),
                ),
              ]
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
