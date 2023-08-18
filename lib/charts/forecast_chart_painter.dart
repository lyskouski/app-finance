// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class ForecastChartPainter extends CustomPainter {
  final double indent;
  final Color color;
  final Size? size;
  final List<Offset> data;
  final double xMax;
  final double xMin;
  final double yMax;

  ForecastChartPainter({
    required this.indent,
    required this.color,
    required this.data,
    this.size,
    this.xMax = 1.0,
    this.xMin = 0.0,
    this.yMax = 1.0,
  });

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    size = this.size ?? size;
    double total = 0.0;
    Offset startPoint;
    Offset controlPoint;
    Offset endPoint;
    for (int i = 0; i < data.length - 2; i += 2) {
      [total, startPoint] = _bind(data[i], size, total);
      [total, controlPoint] = _bind(data[i + 1], size, total);
      [_, endPoint] = _bind(data[i + 2], size, total);
      _paintCurve(canvas, startPoint, controlPoint, endPoint);
    }
  }

  List<dynamic> _bind(Offset data, Size size, double total) {
    double dy = total + data.dy;
    return [
      dy,
      Offset((data.dx - xMin) / (xMax - xMin) * size.width + indent, (1 - dy / yMax) * size.height - indent),
    ];
  }

  _paintCurve(Canvas canvas, Offset startPoint, Offset controlPoint, Offset endPoint) {
    final line = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final path = Path()
      ..moveTo(startPoint.dx, startPoint.dy)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    canvas.drawPath(path, line);

    final dot = Paint()..color = color;
    double r = 2.2;
    canvas.drawCircle(startPoint, r, dot);
    canvas.drawCircle(controlPoint, r, dot);
    canvas.drawCircle(endPoint, r, dot);
  }
}
