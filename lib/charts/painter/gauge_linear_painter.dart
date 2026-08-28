// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/painter/gauge_painter.dart';
import 'package:flutter/material.dart';

class GaugeLinearPainter extends GaugePainter {
  GaugeLinearPainter({
    required super.value,
    required super.max,
    required super.min,
    super.color = Colors.grey,
  }) : super(fontSize: 9);

  @override
  void paint(Canvas canvas, Size size) {
    const indent = 2.0;
    final height = size.height / 2;
    final xStart = 0.10 * size.width;
    _drawRect(canvas, size, const Offset(0, indent), Offset(xStart, height), Colors.red.shade900);
    final xMiddle = 0.35 * size.width;
    _drawRect(canvas, size, Offset(xStart + indent, indent), Offset(xMiddle, height), Colors.orange);
    _drawRect(canvas, size, Offset(xMiddle + indent, indent), Offset(size.width, height), Colors.green.shade500);

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;
    final spread = size.width / threshold - 1;
    final step = (max - min) / spread;
    fnZero(double _, TextPainter __) => 0.0;
    for (double i = 0; i < spread; i += 1) {
      final pos = Offset(i * threshold + 3, size.height - 3);
      canvas.drawCircle(pos, 2.0, paint);
      paintText(
          canvas, size, fnZero, Offset(pos.dx + 6, size.height / 2 + 2), '${(min + step * i).toStringAsFixed(2)}%');
    }

    final pos = value * size.width;
    final strokePath = Path()
      ..moveTo(pos - 6, 0)
      ..lineTo(pos, size.height / 2 + 2)
      ..lineTo(pos + 6, 0);
    canvas.drawPath(strokePath, paint..invertColors = true);
    final path = Path()
      ..moveTo(pos - 3, 0)
      ..lineTo(pos, size.height / 3)
      ..lineTo(pos + 3, 0);
    canvas.drawPath(path, paint..invertColors = false);
  }

  void _drawRect(Canvas canvas, Size size, Offset start, Offset end, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromPoints(start, end), paint);
  }
}
