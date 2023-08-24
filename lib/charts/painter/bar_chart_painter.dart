// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/charts/painter/abstract_painter.dart';
import 'package:flutter/material.dart';

class BarChartPainter extends AbstractPainter {
  final List<ChartData> data;

  BarChartPainter({
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
      for (int j = 0; j < data[i].data.length; j++) {
        final point = data[i].data[j];
        _draw(canvas, size, point, data[i].color);
        _paintText(canvas, getValue(Offset(xMin, _getY(point, 0.1)), size), data[i].helper.title, data[i].color);
      }
    }
  }

  _getY(Offset point, double shift) {
    return yMax - point.dx - 1 - shift;
  }

  void _draw(Canvas canvas, Size size, Offset point, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    final rect = Rect.fromPoints(
      getValue(Offset(xMin, _getY(point, 0.6)), size),
      getValue(Offset(point.dy, _getY(point, 0.9)), size),
    );
    canvas.drawRect(rect, paint);
  }

  void _paintText(Canvas canvas, Offset point, String text, Color color) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 11),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, point);
  }
}
