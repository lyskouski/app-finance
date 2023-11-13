// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class RequiredWidget extends StatelessWidget {
  final String title;
  final bool showError;

  const RequiredWidget({
    super.key,
    required this.title,
    required this.showError,
  });

  Widget _requiredText(TextTheme textTheme, ColorScheme colorScheme) => RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: textTheme.bodyLarge,
          children: [
            TextSpan(text: title),
            TextSpan(
              text: '*',
              semanticsLabel: AppLocale.labels.isRequired,
              style: textTheme.bodyLarge?.copyWith(color: colorScheme.primary),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    if (!showError) {
      return _requiredText(textTheme, colorScheme);
    }
    return LayoutBuilder(builder: (context, constraints) {
      final indent = ThemeHelper.getIndent();
      return RowWidget(
        alignment: MainAxisAlignment.spaceBetween,
        indent: indent,
        maxWidth: constraints.maxWidth - indent,
        chunk: [null, ThemeHelper.getTextWidth(Text(AppLocale.labels.isRequired)), 12],
        children: [
          [
            _requiredText(textTheme, colorScheme),
          ],
          [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 2),
              child: TextWrapper(
                AppLocale.labels.isRequired,
                style: TextStyle(
                  color: colorScheme.error,
                ),
              ),
            ),
          ],
          [
            Icon(
              Icons.error,
              semanticLabel: '$title: ${AppLocale.labels.isRequired}',
              color: colorScheme.error,
            ),
          ],
        ],
      );
    });
  }
}
