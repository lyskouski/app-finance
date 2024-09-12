// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/design/wrapper/number_wrapper.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class AccountLineWidget extends StatelessWidget {
  final AccountAppData item;
  final double width;
  final int count;

  const AccountLineWidget({
    super.key,
    required this.item,
    required this.width,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final indent = ThemeHelper.getIndent();
    final txtWidth = ThemeHelper.getTextWidth(Text(item.detailsFormatted, style: textTheme.numberMedium));
    final labelWidth = ThemeHelper.getTextWidth(Text(AppLocale.labels.validTillDate, style: textTheme.bodySmall));
    final typeWidth = ThemeHelper.getTextWidth(Text(AccountType.getLabel(item.type), style: textTheme.bodySmall));
    final dateWidth = ThemeHelper.getTextWidth(Text(item.closedAtFormatted, style: textTheme.numberSmall));
    final showValidDate = !AccountType.contains(item.type, [AppAccountType.account, AppAccountType.cash]);
    if (count > 2) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: indent),
        child: RowWidget(
          indent: indent,
          alignment: AppDesign.getAlignment<MainAxisAlignment>(),
          maxWidth: width,
          chunk: const [20, null, 0.3, 0.15, 0.1],
          children: [
            [
              Icon(item.icon, color: item.color, size: 20),
            ],
            [
              TextWrapper(item.title, style: textTheme.headlineMedium),
            ],
            [
              NumberWidget(item.description ?? '', colorScheme: context.colorScheme, style: textTheme.headlineMedium),
            ],
            [
              TextWrapper(AccountType.getLabel(item.type), style: textTheme.headlineMedium),
            ],
            [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: NumberWidget(
                      item.detailsFormatted,
                      colorScheme: context.colorScheme,
                      style: textTheme.numberMedium,
                    ),
                  ),
                  if (item.error != null) item.error!,
                ],
              ),
            ],
          ],
        ),
      );
    }
    return Column(
      children: [
        RowWidget(
          indent: indent,
          alignment: AppDesign.getAlignment<MainAxisAlignment>(),
          maxWidth: width,
          chunk: [20, null, txtWidth + 2 * indent, if (item.error != null) 22],
          children: [
            [
              Icon(item.icon, color: item.color, size: 20),
            ],
            [
              TextWrapper(item.title, style: textTheme.headlineMedium),
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
            if (item.error != null) [item.error!],
          ],
        ),
        RowWidget(
          indent: indent,
          alignment: AppDesign.getAlignment<MainAxisAlignment>(),
          maxWidth: width,
          chunk: [
            typeWidth + indent / 2,
            null,
            if (showValidDate) ...[labelWidth + indent, dateWidth]
          ],
          children: [
            [
              TextWrapper(
                AccountType.getLabel(item.type),
                style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
              )
            ],
            [
              TextWrapper(
                item.description ?? '',
                style: textTheme.numberSmall,
              )
            ],
            if (showValidDate) ...[
              [
                TextWrapper(
                  AppLocale.labels.validTillDate,
                  style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
              [
                TextWrapper(
                  item.closedAtFormatted,
                  style: textTheme.numberSmall,
                ),
              ],
            ]
          ],
        ),
      ],
    );
  }
}
