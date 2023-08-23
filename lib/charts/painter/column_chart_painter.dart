// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/charts/painter/abstract_painter.dart';
import 'package:flutter/material.dart';

class ColumnChartPainter extends AbstractPainter {
  final List<ChartData> data;

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
    size = this.size ?? size;
    for (int i = 0; i < data.length; i++) {
      _draw(canvas, size, data[i]);
    }
  }

  void _draw(Canvas canvas, Size size, ChartData scope) {
    for (int i = 0; i < scope.data.length; i++) {
      _drawRectangle(canvas, size, scope.data[i], i, scope.color);
    }
  }

  void _drawRectangle(Canvas canvas, Size size, Offset value, int shift, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    final time = value.dx.toDouble();
    final rect = Rect.fromPoints(
      getValue(Offset(time - msDay * shift * 6, value.dy), size),
      getValue(Offset(time - msDay * (shift + 1) * 6, 0.0), size),
    );
    canvas.drawRect(rect, paint);
  }
}
