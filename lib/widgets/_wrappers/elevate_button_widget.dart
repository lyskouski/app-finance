// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:flutter/material.dart';

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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith((states) => const ContinuousRectangleBorder()),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.hovered)) {
                return hoveredColor ?? Theme.of(context).colorScheme.onSecondaryContainer;
              }
              return backgroundColor ?? Theme.of(context).colorScheme.secondary;
            },
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: textColor ?? Theme.of(context).colorScheme.inversePrimary,
            ),
            if (icon != null) ThemeHelper.wIndent,
            Text(
              text,
              style: TextStyle(
                color: textColor ?? Theme.of(context).colorScheme.inversePrimary,
                shadows: const [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
