// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveMatrix {
  final AdaptiveWindowType windowType;

  const ResponsiveMatrix(this.windowType);

  bool isLower(AdaptiveWindowType size) => windowType <= size;

  AdaptiveWindowType _getHighest(double size) {
    final matrix = {
      AdaptiveWindowType.xlarge: size >= 1440, // AdaptiveWindowType.xlarge.widthRangeValues.start,
      AdaptiveWindowType.large: size >= 1024, // AdaptiveWindowType.large.widthRangeValues.start,
      AdaptiveWindowType.medium: size >= 640, // AdaptiveWindowType.medium.widthRangeValues.start,
      AdaptiveWindowType.small: size >= 320, // AdaptiveWindowType.small.widthRangeValues.start,
      AdaptiveWindowType.xsmall: true,
    };
    matrix.removeWhere((_, value) => value == false);
    return matrix.keys.first;
  }

  int getWidthCount(BoxConstraints constraints) {
    return switch (_getHighest(constraints.maxWidth)) {
      AdaptiveWindowType.xlarge => 4,
      AdaptiveWindowType.large => 3,
      AdaptiveWindowType.medium => 2,
      _ => 1,
    };
  }

  int getHeightCount(BoxConstraints constraints) {
    return switch (_getHighest(constraints.maxHeight)) {
      AdaptiveWindowType.xlarge => 7,
      AdaptiveWindowType.xsmall => 3,
      _ => 4,
    };
  }

  int getCount(BoxConstraints constraints) {
    return getWidthCount(constraints) * getHeightCount(constraints);
  }
}
