// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_forms/abstract_input.dart';
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
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: isKeyboardVisible ? null : constraints.maxWidth - ThemeHelper.getIndent(4),
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
              color: colorScheme.primary.withOpacity(0.5),
            ),
            if (!isKeyboardVisible)
              Padding(
                padding: EdgeInsets.only(left: ThemeHelper.getIndent()),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: colorScheme.primary.withOpacity(0.8)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
