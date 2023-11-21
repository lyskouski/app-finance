// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class NumberWidget extends TextWrapper {
  final ColorScheme colorScheme;

  const NumberWidget(
    super.text, {
    super.key,
    required this.colorScheme,
    required super.style,
    super.tooltip,
    super.maxLines,
  }) : super();

  @override
  TextStyle? get style => super.style?.copyWith(
        color: text.characters.firstOrNull == '-' || text.contains(AppLocale.labels.spent)
            ? Color.alphaBlend(Colors.red.withOpacity(0.4), colorScheme.secondary)
            : null,
      );
}
