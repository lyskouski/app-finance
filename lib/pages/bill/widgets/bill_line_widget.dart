// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
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
  final int count;

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
    this.count = 1,
    this.hidden = false,
    this.progress = 1,
    this.route = '',
  });

  @override
  Widget build(BuildContext context) {
    if (hidden) {
      return ThemeHelper.emptyBox;
    }
    final indent = ThemeHelper.getIndent(0.5);
    final textTheme = context.textTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(indent, indent, indent * 2, indent),
      child: TapWidget(
        tooltip: '',
        route: RouteSettings(name: route, arguments: {routeArguments.uuid: uuid}),
        child: count > 2
            ? RowWidget(
                maxWidth: width,
                indent: indent,
                chunk: const [24, null, 0.2, 0.2, 0.1],
                children: [
                  [
                    Padding(
                      padding: EdgeInsets.only(top: indent, left: indent),
                      child: Icon(icon, color: color, size: 20),
                    ),
                  ],
                  [
                    Padding(
                      padding: EdgeInsets.only(top: indent),
                      child: TextWrapper(title, style: textTheme.bodyMedium),
                    ),
                  ],
                  [
                    TextWrapper(AppLocale.labels.account, style: textTheme.bodySmall),
                    TextWrapper(
                      description,
                      style: textTheme.bodyMedium?.copyWith(
                        color: Color.alphaBlend(descriptionColor.withOpacity(0.4), context.colorScheme.secondary),
                      ),
                    ),
                  ],
                  [
                    TextWrapper(AppLocale.labels.budget, style: textTheme.bodySmall),
                    TextWrapper(
                      iconTooltip,
                      style: textTheme.bodyMedium?.copyWith(
                        color: Color.alphaBlend(color.withOpacity(0.4), context.colorScheme.secondary),
                      ),
                    ),
                  ],
                  [
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(top: indent, right: indent),
                      child: TextWrapper(details, style: textTheme.numberMedium),
                    ),
                  ]
                ],
              )
            : RowWidget(
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
                indent: indent * 2,
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
                      crossAxisAlignment: AppDesign.getAlignment(),
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
