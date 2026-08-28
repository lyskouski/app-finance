// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final int count;
  final double width;

  const HeaderWidget({
    super.key,
    required this.count,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final indent = ThemeHelper.getIndent();
    final textStyle = context.textTheme.headlineSmall?.copyWith(color: context.colorScheme.primary);
    return Container(
      padding: EdgeInsets.fromLTRB(0, indent / 2, 0, 0),
      height: 30,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.secondary.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: RowWidget(
        indent: ThemeHelper.getIndent(),
        maxWidth: width,
        chunk: [
          null,
          ...(count > 2 ? [0.3, 0.15, 0.1] : [0, 0, null])
        ],
        children: [
          [
            Padding(
              padding: EdgeInsets.only(left: indent * 3),
              child: TextWrapper(AppLocale.labels.title, style: textStyle),
            ),
          ],
          [
            Align(
              alignment: AppDesign.isRightToLeft() ? Alignment.centerRight : Alignment.centerLeft,
              child: TextWrapper(AppLocale.labels.details, style: textStyle),
            ),
          ],
          [
            Align(
              alignment: AppDesign.isRightToLeft() ? Alignment.centerRight : Alignment.centerLeft,
              child: TextWrapper(AppLocale.labels.accountType, style: textStyle),
            ),
          ],
          [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: indent),
              child: TextWrapper(AppLocale.labels.balance, style: textStyle),
            ),
          ],
        ],
      ),
    );
  }
}
