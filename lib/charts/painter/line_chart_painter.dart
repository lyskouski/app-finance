// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/charts/painter/abstract_painter.dart';
import 'package:flutter/material.dart';

class LineChartPainter extends AbstractPainter {
  final List<ChartData> data;

  LineChartPainter({
    required super.indent,
    required this.data,
    super.size,
    super.xMin = 0.0,
    super.xMax = 1.0,
    super.yMin = 1.0,
    super.yMax = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) {
      return;
    }
    size = this.size ?? size;
    for (final scope in data) {
      _paint(canvas, scope.data, size, scope.color, scope.strokeWidth);
    }
  }

  void _paint(Canvas canvas, List<Offset> scope, Size size, Color color, [double strokeWidth = 2]) {
    for (int i = 1; i < scope.length; i++) {
      _paintLine(canvas, getValue(scope[i - 1], size), getValue(scope[i], size), color, strokeWidth);
    }
  }

  _paintLine(Canvas canvas, Offset startPoint, Offset endPoint, Color color, double strokeWidth) {
    final line = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawLine(startPoint, endPoint, line);
  }
}
