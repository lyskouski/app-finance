// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/interface/ohlc_data.dart';
import 'package:app_finance/charts/painter/abstract_painter.dart';
import 'package:flutter/material.dart';

class OhlcChartPainter extends AbstractPainter {
  final List<OhlcData> data;
  final Color color;

  OhlcChartPainter({
    required super.indent,
    required this.data,
    required this.color,
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
      _drawLine(canvas, size, data[i]);
      _drawRectangle(canvas, size, data[i]);
    }
  }

  _drawRectangle(Canvas canvas, Size size, OhlcData value) {
    final paint = Paint()
      ..color = value.open > value.close ? Colors.red : Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    final time = value.date.microsecondsSinceEpoch.toDouble();
    final rect = Rect.fromPoints(
      getValue(Offset(time - usDay * 1.5, value.open), size),
      getValue(Offset(time + usDay * 1.5, value.close), size),
    );
    canvas.drawRect(rect, paint);
  }

  _drawLine(Canvas canvas, Size size, OhlcData value) {
    final line = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final time = value.date.microsecondsSinceEpoch.toDouble();
    canvas.drawLine(getValue(Offset(time, value.low), size), getValue(Offset(time, value.high), size), line);
  }
}
