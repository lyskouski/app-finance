// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/widgets/wrapper/number_wrapper.dart';
import 'package:app_finance/widgets/wrapper/row_widget.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class AccountHeaderWidget extends StatelessWidget {
  final AccountAppData item;

  const AccountHeaderWidget({
    super.key,
    required this.item,
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
    return Column(
      children: [
        RowWidget(
          indent: indent,
          alignment: MainAxisAlignment.start,
          maxWidth: ThemeHelper.getWidth(context, 2),
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
          alignment: MainAxisAlignment.start,
          maxWidth: ThemeHelper.getWidth(context, 2),
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
                )
              ],
            ]
          ],
        ),
      ],
    );
  }
}
