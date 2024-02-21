// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/charts/painter/abstract_painter.dart';
import 'package:flutter/material.dart';

class ColumnChartPainter extends AbstractPainter {
  final List<ChartData> data;
  late Canvas canvas;

  ColumnChartPainter({
    required super.indent,
    required this.data,
    super.size,
    super.xMax = 1.0,
    super.xMin = 0.0,
    super.yMax = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) {
      return;
    }
    this.size ??= size;
    this.canvas = canvas;
    for (int i = 0; i < data.length; i++) {
      _draw(data[i], i / data.length);
    }
  }

  void _draw(ChartData scope, double shift) {
    for (int i = 0; i < scope.data.length; i++) {
      _drawRectangle(scope.data[i], i - shift - 1, scope.color, scope.strokeWidth);
    }
  }

  void _drawRectangle(Offset value, double shift, Color color, double stroke) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    final time = value.dx.toDouble();
    final rect = Rect.fromPoints(
      getValue(Offset(time - msDay * shift * 3 * stroke, value.dy), size!),
      getValue(Offset(time - msDay * (shift + 1) * 3 * stroke, 0.0), size!),
    );
    canvas.drawRect(rect, paint);
  }
}
