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

  List<dynamic> _bind(Offset data, Size size, double total) {
    return [
      total + data.dy,
      _getValue(data, size, total),
    ];
  }

  Offset _getValue(Offset data, Size size, [double dy = 0]) {
    return Offset(
      (data.dx - xMin) / (xMax - xMin) * size.width + indent,
      (1 - (data.dy + dy) / yMax) * size.height - indent,
    );
  }

  double _sumY(List<Offset> data) {
    return data.fold(0.0, (v, e) => v + e.dy);
  }

  Offset _getMedian(List<Offset> data) {
    return Offset(
      (data.last.dx + data.first.dx) / 2,
      _sumY(data.sublist(0, data.length ~/ 2)),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) {
      return;
    }
    size = this.size ?? size;
    double total = 0.0;
    Offset startPoint;
    [_, startPoint] = _bind(data.first, size, total);
    Offset point = const Offset(0, 0);
    int i = 0;
    for (i; i < data.length; i++) {
      [total, point] = _bind(data[i], size, total);
      _paintDot(canvas, point);
      if (point.dy < 0) {
        break;
      }
    }
    int third = i ~/ 3;
    Offset startBezier = _getValue(_getMedian(data.sublist(0, third)), size);
    total = _sumY(data.sublist(0, third));
    Offset middleBezier = _getValue(_getMedian(data.sublist(third, 2 * third)), size, total);
    total += _sumY(data.sublist(third, 2 * third));
    Offset endBezier = _getValue(_getMedian(data.sublist(2 * third, i)), size, total);
    _paintCurve(canvas, startPoint, startBezier, middleBezier);
    _paintCurve(canvas, middleBezier, endBezier, point);
  }

  void _paintDot(Canvas canvas, Offset point) {
    final dot = Paint()..color = color;
    canvas.drawCircle(point, 2.2, dot);
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
  }
}
