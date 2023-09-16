// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_configs/responsive_matrix.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/widgets/form/abstract_input.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

typedef OnPressedFunction = void Function();

class FullSizedButtonWidget extends AbstractInput {
  final OnPressedFunction setState;
  final String title;
  final IconData icon;
  final BoxConstraints constraints;
  late final String heroTag;

  FullSizedButtonWidget({
    super.key,
    required this.setState,
    required this.constraints,
    required this.title,
    required this.icon,
  }) : super(value: null) {
    heroTag = 'fz_button_${UniqueKey()}';
  }

  @override
  Widget buildContent(BuildContext context) {
    final isBottom = ResponsiveMatrix(getWindowType(context)).isNavBottom(constraints);
    final bool isKeyboardVisible = ThemeHelper.isKeyboardVisible(context) || isBottom;
    final colorScheme = context.colorScheme;
    final width = constraints.maxWidth - ThemeHelper.getIndent(4) - 2;
    return SizedBox(
      width: isKeyboardVisible ? null : width,
      child: FloatingActionButton(
        heroTag: heroTag,
        onPressed: setState,
        tooltip: title,
        focusNode: FocusController.getFocusNode(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              semanticLabel: title,
              size: 32,
              color: colorScheme.onSecondary.withOpacity(0.8),
            ),
            if (!isKeyboardVisible)
              Container(
                padding: EdgeInsets.only(left: ThemeHelper.getIndent()),
                constraints: BoxConstraints(maxWidth: width - 34),
                child: TextWrapper(title, style: context.textTheme.bodyLarge?.copyWith(color: colorScheme.onSecondary)),
              ),
          ],
        ),
      ),
    );
  }
}
