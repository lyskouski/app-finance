// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/math/monte_carlo_simulation.dart';
import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/charts/painter/abstract_painter.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ForecastChartPainter extends AbstractPainter {
  final List<ChartData> data;

  ForecastChartPainter({
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
    for (final scope in data) {
      _paint(canvas, scope.data, size, scope.color);
      final dx = scope.data.last.dx;
      final total = _sumY(scope.data);
      if (scope.data.length > 2 && dx < xMax && total < yMax) {
        final cycles = (xMax - dx) ~/ usDay;
        final forecast = [scope.data.last];
        forecast.addAll(MonteCarloSimulation(cycles: cycles).generate(scope.data, usDay, xMax - 2 * usDay));
        _paint(canvas, forecast, size, scope.color.withBlue(200).withOpacity(0.4), total);
      }
    }
  }

  List<dynamic> _bind(Offset point, Size size, double total) {
    return [
      total + point.dy,
      getValue(point, size, total),
    ];
  }

  double _sumY(List<Offset> scope) {
    return scope.fold(0.0, (v, e) => v + e.dy);
  }

  Offset _getMedian(List<Offset> scope) {
    return Offset((scope.last.dx + scope.first.dx) / 2, _sumY(scope));
  }

  void _paint(Canvas canvas, List<Offset> scope, Size size, Color color, [double total = 0.0]) {
    if (scope.isEmpty) {
      return;
    }
    Offset startPoint;
    [_, startPoint] = _bind(scope.first, size, total);
    int count = 0;
    Offset endPoint;
    [count, endPoint] = _paintDots(canvas, scope, size, color, total);
    int half = count ~/ 2;
    if (half > 0) {
      Offset startBezier = getValue(_getMedian(scope.sublist(0, half)), size, total);
      total += _sumY(scope.sublist(0, half));
      Offset endBezier = getValue(_getMedian(scope.sublist(half, count)), size, total);
      _paintCurve(canvas, startPoint, startBezier, endBezier, endPoint, color);
    }
  }

  List<dynamic> _paintDots(Canvas canvas, List<Offset> scope, Size size, Color color, double total) {
    Offset point = const Offset(0, 0);
    int i = 0;
    for (i; i < scope.length; i++) {
      [total, point] = _bind(scope[i], size, total);
      if (point.dy < 0) {
        point = Offset(point.dx, 0);
        _paintDot(canvas, point, color);
        break;
      }
      _paintDot(canvas, point, color);
    }
    return [i, point];
  }

  void _paintDot(Canvas canvas, Offset point, Color color) {
    final dot = Paint()..color = color;
    canvas.drawCircle(point, 2.2, dot);
  }

  _paintCurve(Canvas canvas, Offset p0, Offset k1, Offset k2, Offset p1, Color color) {
    final line = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final path = Path()..moveTo(p0.dx, p0.dy);
    path.cubicTo(k1.dx, k1.dy, k2.dx, k2.dy, p1.dx, p1.dy);
    canvas.drawPath(path, line);
  }
}
