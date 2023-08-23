// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

abstract class AbstractPainter extends CustomPainter {
  final double indent;
  final Size? size;
  final double xMax;
  final double xMin;
  final double yMin;
  final double yMax;

  final double msDay = 86400000;

  AbstractPainter({
    required this.indent,
    this.size,
    this.xMin = 0.0,
    this.xMax = 1.0,
    this.yMin = 0.0,
    this.yMax = 1.0,
  });

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  Offset getValue(Offset point, Size size, [double dy = 0]) {
    double x = (point.dx - xMin) / (xMax - xMin) * size.width + indent;
    double y = (1 - (point.dy + dy - yMin) / (yMax - yMin)) * size.height - indent;
    return Offset(x > size.width ? size.width + 0.01 : x, y < 0 ? -0.01 : y);
  }
}
