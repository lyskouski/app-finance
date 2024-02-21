// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/interface/chart_value.dart';
import 'package:app_finance/charts/painter/abstract_painter.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class PieRadiusPainter extends AbstractPainter {
  final List<ChartValue> data;
  late final double max;
  double radius = 0;
  Offset center = const Offset(0, 0);

  PieRadiusPainter({
    required this.data,
    required super.indent,
  }) {
    int length = data.where((o) => o.value > 0).length;
    if (length == 1) {
      length = 0;
    }
    max = data.fold(0.0, (v, o) => v + o.value) * (1 + indent * length);
  }

  @override
  void paint(Canvas canvas, Size size) {
    center = Offset(size.width, size.height * 3 / 4);
    radius = size.width / 2;

    double startPoint = pi / 2;
    for (int i = 0; i < data.length; i++) {
      startPoint = _drawArc(canvas, size, startPoint, i);
    }
  }

  double _drawArc(Canvas canvas, Size size, double startPoint, int step) {
    final paint = Paint()
      ..color = data[step].color
      ..strokeWidth = size.width / 2
      ..style = PaintingStyle.stroke;
    final paintBorder = Paint()
      ..strokeWidth = size.width * 1.1 / 2
      ..color = data[step].color.withOpacity(0.3)
      ..style = PaintingStyle.stroke;
    const full = 2 * pi;
    final shift = indent * full;
    double endPoint = (data[step].value / max) * full;
    final arc = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(arc, startPoint - shift / 2, endPoint + shift, false, paintBorder);
    canvas.drawArc(arc, startPoint, endPoint, false, paint);
    return startPoint + endPoint + shift;
  }
}
