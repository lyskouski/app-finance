// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

typedef OnPressedFunction = void Function();

class FullSizedButtonWidget extends StatelessWidget {
  final OnPressedFunction setState;
  final String title;
  final IconData icon;
  final BoxConstraints? constraints;
  final FocusController? controller;
  late final String heroTag;

  FullSizedButtonWidget({
    super.key,
    required this.setState,
    required this.title,
    required this.icon,
    this.constraints,
    this.controller,
  }) : heroTag = 'fz_button_${UniqueKey()}';

  @override
  Widget build(BuildContext context) {
    final isBottom = constraints != null ? ThemeHelper.isNavBottom(constraints!) : false;
    final bool isKeyboardVisible = ThemeHelper.isKeyboardVisible(context) || isBottom;
    final colorScheme = context.colorScheme;
    final width = constraints != null ? constraints!.maxWidth - ThemeHelper.getIndent(4) - 2 : double.infinity;
    return Semantics(
      attributedLabel: AttributedString(title),
      child: SizedBox(
        width: isKeyboardVisible ? null : width,
        child: FloatingActionButton(
          heroTag: heroTag,
          onPressed: setState,
          hoverColor: colorScheme.primary,
          focusColor: colorScheme.primary.withOpacity(0.8),
          tooltip: title,
          focusNode: controller?.bind(this, context: context),
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
                  child: TextWrapper(
                    title,
                    style: context.textTheme.bodyLarge?.copyWith(color: colorScheme.onSecondary),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
