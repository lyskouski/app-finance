// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:math';

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:flutter/material.dart';

class ResponsiveMatrix {
  final AdaptiveWindowType windowType;

  const ResponsiveMatrix(this.windowType);

  bool isLower(AdaptiveWindowType size) => windowType <= size;

  bool isNavBottom(BoxConstraints constraints) => getWidthCount(constraints) <= 2;

  static int getWidthCount(BoxConstraints constraints) {
    final matrix = {
      AdaptiveWindowType.xlarge: constraints.maxWidth >= 1440, // AdaptiveWindowType.xlarge.widthRangeValues.start,
      AdaptiveWindowType.large: constraints.maxWidth >= 1024, // AdaptiveWindowType.large.widthRangeValues.start,
      AdaptiveWindowType.medium: constraints.maxWidth >= 640, // AdaptiveWindowType.medium.widthRangeValues.start,
      AdaptiveWindowType.small: constraints.maxWidth >= 320, // AdaptiveWindowType.small.widthRangeValues.start,
      AdaptiveWindowType.xsmall: true,
    };
    matrix.removeWhere((_, value) => value == false);
    return switch (matrix.keys.first) {
      AdaptiveWindowType.xlarge => 4,
      AdaptiveWindowType.large => 3,
      AdaptiveWindowType.medium => 2,
      _ => 1,
    };
  }

  static int getHeightCount(BuildContext context, [BoxConstraints? constraints]) {
    final height = [ThemeHelper.getHeight(context), constraints?.maxHeight ?? double.infinity].reduce(min);
    final matrix = {
      AdaptiveWindowType.xlarge: height >= 1440,
      AdaptiveWindowType.large: height >= 800,
      AdaptiveWindowType.medium: height >= 480,
      AdaptiveWindowType.small: height >= 240,
      AdaptiveWindowType.xsmall: true,
    };
    matrix.removeWhere((_, value) => value == false);
    return switch (matrix.keys.first) {
      AdaptiveWindowType.xlarge => 7,
      AdaptiveWindowType.large => 5,
      AdaptiveWindowType.medium => 4,
      AdaptiveWindowType.small => 3,
      _ => 1,
    };
  }
}
