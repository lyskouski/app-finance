// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/charts/bar_vertical_single.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/decorators/tap_area.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:flutter/material.dart';

class BaseLineWidget extends StatelessWidget {
  final String uuid;
  final String title;
  final String details;
  final String description;
  final double progress;
  final Color color;
  final double offset;
  final String route;
  final bool hidden;

  const BaseLineWidget({
    super.key,
    required this.uuid,
    required this.title,
    required this.details,
    required this.description,
    required this.color,
    required this.offset,
    this.hidden = false,
    this.progress = 1,
    this.route = '',
  });

  @override
  Widget build(BuildContext context) {
    var theme = ThemeHelper(windowType: getWindowType(context));
    final TextTheme textTheme = Theme.of(context).textTheme;

    if (hidden) {
      return SizedBox();
    }

    return TapArea(
      tooltip: title,
      route: route.replaceAll('uuid:', 'uuid:$uuid'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BarVerticalSingle(
                        value: progress, height: 24, color: color),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: offset * 0.6,
                          ),
                          child: Text(
                            title,
                            style: textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          description,
                          style: textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(theme.getIndent()),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: offset * 0.4,
                  ),
                  child: Text(
                    details,
                    style: textTheme.numberMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
