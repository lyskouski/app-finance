// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class CheckboxInput extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool) onChanged;
  final BoxConstraints? constraints;

  const CheckboxInput({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final indent = ThemeHelper.getIndent();
    final width = ThemeHelper.getWidth(context, 6, constraints);
    return RowWidget(
      indent: indent,
      maxWidth: width,
      chunk: const [20, null],
      children: [
        [
          Center(
            heightFactor: 0.5,
            child: Checkbox(
              value: value,
              onChanged: (newValue) => onChanged(newValue ?? false),
            ),
          )
        ],
        [
          TextWrapper(label),
        ],
      ],
    );
  }
}
