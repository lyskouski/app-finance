// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

typedef OnPressedFunction = Function();

class ElevatedButtonWidget extends StatelessWidget {
  final OnPressedFunction onPressed;
  final String text;
  final Color? hoveredColor;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;

  const ElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.hoveredColor,
    this.backgroundColor,
    this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Semantics(
      button: true,
      label: text,
      attributedHint: AttributedString(text),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.resolveWith((states) => const ContinuousRectangleBorder()),
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (states) {
                if (states.contains(WidgetState.hovered)) {
                  return hoveredColor ?? colorScheme.onSecondaryContainer;
                }
                return backgroundColor ?? colorScheme.secondary;
              },
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: textColor ?? colorScheme.inversePrimary,
                ),
                ThemeHelper.wIndent,
              ],
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? colorScheme.inversePrimary,
                  shadows: const [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
