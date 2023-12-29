// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/design/wrapper/number_wrapper.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class BudgetHeaderWidget extends StatelessWidget {
  final BudgetAppData item;
  final double width;

  const BudgetHeaderWidget({
    super.key,
    required this.item,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final indent = ThemeHelper.getIndent();
    final txtWidth = ThemeHelper.getTextWidth(Text(item.detailsFormatted, style: textTheme.numberMedium));
    return Column(
      children: [
        RowWidget(
          indent: indent,
          alignment: AppDesign.getAlignment<MainAxisAlignment>(),
          maxWidth: width,
          chunk: [null, txtWidth + 2 * indent, if (item.error != null) 22],
          children: [
            [
              Row(
                children: [
                  Icon(item.icon, color: item.color, size: 20),
                  ThemeHelper.wIndent,
                  TextWrapper(
                    item.title,
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
              if (item.description.isNotEmpty)
                TextWrapper(
                  item.description,
                  style: textTheme.numberSmall,
                ),
            ],
            [
              Align(
                alignment: Alignment.centerRight,
                child: NumberWidget(
                  item.detailsFormatted,
                  colorScheme: context.colorScheme,
                  style: textTheme.numberMedium,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
