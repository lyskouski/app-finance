// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_forms/abstract_input.dart';
import 'package:flutter/material.dart';

typedef OnPressedFunction = void Function();

class FullSizedButton extends AbstractInput {
  final OnPressedFunction setState;
  final String title;
  final IconData? icon;
  final BoxConstraints constraints;
  late final String heroTag;

  FullSizedButton({
    super.key,
    required this.setState,
    required this.constraints,
    required this.title,
    this.icon,
  }) : super(value: null) {
    heroTag = 'fz_button_${UniqueKey()}';
  }

  @override
  Widget buildContent(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth - ThemeHelper.getIndent(4),
      child: FloatingActionButton(
        heroTag: heroTag,
        onPressed: setState,
        tooltip: title,
        focusNode: FocusController.getFocusNode(),
        child: Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                semanticLabel: title,
                size: 32,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
              ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
