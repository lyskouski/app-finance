// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/math/monte_carlo_simulation.dart';
import 'package:app_finance/charts/interface/forecast_data.dart';
import 'package:app_finance/charts/painter/abstract_painter.dart';
import 'package:flutter/material.dart';

class ForecastChartPainter extends AbstractPainter {
  final List<ForecastData> data;

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
      final total = _paint(canvas, scope.data, size, scope.color);
      final dx = scope.data.last.dx;
      if (scope.data.length > 2 && dx < xMax) {
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
    return Offset(
      (scope.last.dx + scope.first.dx) / 2,
      _sumY(scope.sublist(0, scope.length ~/ 2)),
    );
  }

  double _paint(Canvas canvas, List<Offset> scope, Size size, Color color, [double total = 0.0]) {
    if (scope.isEmpty) {
      return 0.0;
    }
    Offset startPoint;
    [_, startPoint] = _bind(scope.first, size, total);
    int i = 0;
    Offset point;
    [i, point] = _paintDots(canvas, scope, size, color, total);
    int third = i ~/ 3;
    if (third > 0) {
      Offset startBezier = getValue(_getMedian(scope.sublist(0, third)), size, total);
      total += _sumY(scope.sublist(0, third));
      Offset middleBezier = getValue(_getMedian(scope.sublist(third, 2 * third)), size, total);
      total += _sumY(scope.sublist(third, 2 * third));
      Offset endBezier = getValue(_getMedian(scope.sublist(2 * third, i)), size, total);
      _paintCurve(canvas, startPoint, startBezier, middleBezier, color);
      _paintCurve(canvas, middleBezier, endBezier, point, color);
    }
    return total + point.dy;
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
    return [i - 1, point];
  }

  void _paintDot(Canvas canvas, Offset point, Color color) {
    final dot = Paint()..color = color;
    canvas.drawCircle(point, 2.2, dot);
  }

  _paintCurve(Canvas canvas, Offset startPoint, Offset controlPoint, Offset endPoint, Color color) {
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
