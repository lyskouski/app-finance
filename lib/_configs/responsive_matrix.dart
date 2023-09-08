// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveMatrix {
  final AdaptiveWindowType windowType;

  const ResponsiveMatrix(this.windowType);

  bool isLower(AdaptiveWindowType size) => windowType <= size;

  int getWidthCount(BoxConstraints constraints) {
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

  int getHeightCount(BoxConstraints constraints) {
    final matrix = {
      AdaptiveWindowType.xlarge: constraints.maxHeight >= 1440,
      AdaptiveWindowType.large: constraints.maxHeight >= 800,
      AdaptiveWindowType.medium: constraints.maxHeight >= 480,
      AdaptiveWindowType.small: constraints.maxHeight >= 240,
      AdaptiveWindowType.xsmall: true,
    };
    matrix.removeWhere((_, value) => value == false);
    return switch (matrix.keys.first) {
      AdaptiveWindowType.xlarge => 7,
      AdaptiveWindowType.small => 3,
      AdaptiveWindowType.xsmall => 3,
      _ => 4,
    };
  }

  int getCount(BoxConstraints constraints) {
    return getWidthCount(constraints) * getHeightCount(constraints);
  }
}
