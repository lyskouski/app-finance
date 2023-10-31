// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/tap_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class BillLineWidget extends StatelessWidget {
  final String uuid;
  final String title;
  final String details;
  final String description;
  final Color descriptionColor;
  final double progress;
  final Color color;
  final IconData icon;
  final String iconTooltip;
  final String route;
  final bool hidden;
  final double width;

  const BillLineWidget({
    super.key,
    required this.uuid,
    required this.title,
    required this.details,
    required this.description,
    required this.descriptionColor,
    required this.color,
    required this.icon,
    required this.iconTooltip,
    required this.width,
    this.hidden = false,
    this.progress = 1,
    this.route = '',
  });

  @override
  Widget build(BuildContext context) {
    if (hidden) {
      return ThemeHelper.emptyBox;
    }
    final indent = ThemeHelper.getIndent();
    final textTheme = context.textTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(indent, indent / 2, indent, indent / 2),
      child: TapWidget(
        tooltip: '',
        route: RouteSettings(name: route, arguments: {routeArguments.uuid: uuid}),
        child: RowWidget(
          chunk: [
            20,
            null,
            ThemeHelper.getTextWidth(Text(
              details,
              maxLines: 1,
              style: textTheme.numberMedium,
              overflow: TextOverflow.ellipsis,
            )),
          ],
          indent: indent,
          maxWidth: width,
          children: [
            [
              Tooltip(
                message: iconTooltip,
                child: Icon(icon, color: color, size: 20),
              ),
            ],
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWrapper(title, style: textTheme.bodyMedium),
                  TextWrapper(
                    description,
                    style: textTheme.numberSmall.copyWith(
                      color: Color.alphaBlend(descriptionColor.withOpacity(0.4), context.colorScheme.secondary),
                    ),
                  ),
                ],
              ),
            ],
            [
              TextWrapper(details, style: textTheme.numberMedium),
            ]
          ],
        ),
      ),
    );
  }
}
