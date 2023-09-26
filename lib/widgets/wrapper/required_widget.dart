// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/widgets/wrapper/row_widget.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class RequiredWidget extends StatelessWidget {
  final String title;
  final bool showError;

  const RequiredWidget({
    super.key,
    required this.title,
    required this.showError,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return LayoutBuilder(builder: (context, constraints) {
      return RowWidget(
        alignment: MainAxisAlignment.spaceBetween,
        indent: ThemeHelper.getIndent(),
        maxWidth: constraints.maxWidth,
        chunk: [null, showError ? null : 0, showError ? 12 : 0],
        children: [
          [
            TextWrapper(
              '$title*',
              style: textTheme.bodyLarge,
            ),
          ],
          [
            TextWrapper(
              showError ? AppLocale.labels.isRequired : '',
              style: TextStyle(
                color: context.colorScheme.error,
              ),
            ),
          ],
          [
            showError
                ? Icon(
                    Icons.error,
                    semanticLabel: '$title: ${AppLocale.labels.isRequired}',
                    color: context.colorScheme.error,
                  )
                : ThemeHelper.emptyBox,
          ],
        ],
      );
    });
  }
}
