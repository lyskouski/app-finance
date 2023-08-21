// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

abstract class AbstractPainter extends CustomPainter {
  final double indent;
  final Size? size;
  final double xMax;
  final double xMin;
  final double yMax;

  final double usDay = 86400000000;

  AbstractPainter({
    required this.indent,
    this.size,
    this.xMax = 1.0,
    this.xMin = 0.0,
    this.yMax = 1.0,
  });

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  Offset getValue(Offset point, Size size, [double dy = 0]) {
    return Offset(
      (point.dx - xMin) / (xMax - xMin) * size.width + indent,
      (1 - (point.dy + dy) / yMax) * size.height - indent,
    );
  }
}
