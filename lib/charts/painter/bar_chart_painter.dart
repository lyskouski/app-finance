// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/charts/painter/abstract_painter.dart';
import 'package:flutter/material.dart';

class BarChartPainter extends AbstractPainter {
  final List<ChartData> data;
  final Color lineColor;

  BarChartPainter({
    required super.indent,
    required this.data,
    required this.lineColor,
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
        final txtPoint = getValue(Offset(xMin, _getY(point, 0.1)), size);
        _paintText(canvas, txtPoint, data[i].helper.title);
        _paintIcon(canvas, Offset(0.0, txtPoint.dy), data[i].helper.icon);
      }
    }
  }

  _getY(Offset point, double shift) {
    return yMax - point.dx - shift;
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

  void _paintText(Canvas canvas, Offset point, String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: lineColor,
          fontSize: 11,
          fontFamily: 'Abel-Regular',
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, point);
  }

  void _paintIcon(Canvas canvas, Offset point, IconData? icon) {
    if (icon == null) {
      return;
    }
    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          color: lineColor,
          fontSize: 24,
          fontFamily: Icons.question_mark.fontFamily,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, point);
  }
}
