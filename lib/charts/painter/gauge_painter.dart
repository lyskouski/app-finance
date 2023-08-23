// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:math';

class GaugePainter extends CustomPainter {
  final double value;
  final double max;
  final double min;
  final Color color;
  late final intl.NumberFormat formatter;
  final double threshold = 80;

  GaugePainter({
    required this.value,
    required this.max,
    required this.min,
    this.color = Colors.grey,
  }) {
    formatter = intl.NumberFormat.compact(locale: AppLocale.code);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;

    _drawArc(canvas, size, radius, center);
    if (size.width > threshold) {
      for (double i = 0.15; i < 1; i += 0.33) {
        _drawValue(canvas, size, radius, center, i);
      }
    }
    _drawLine(canvas, size, radius, center);
  }

  void _paintText(Canvas canvas, Size size, Offset position, String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color.withOpacity(0.8),
          fontSize: size.width > threshold * 2 ? 12 : 9,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    double shift = cos(pi * position.dx / size.width);
    if (shift.toStringAsFixed(2) == '0.00') {
      shift = -textPainter.width / 2;
    } else if (position.dx >= size.width / 2) {
      shift = shift * textPainter.width * 1.5;
    } else {
      shift *= textPainter.width / 2;
    }
    textPainter.paint(canvas, Offset(position.dx + shift, position.dy));
  }

  void _drawValue(Canvas canvas, Size size, double radius, Offset center, double pos) {
    final line = Paint()
      ..color = color.withOpacity(0.5)
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    final position = _getTip(radius, center, pos, 15);
    canvas.drawCircle(position, 1.5, line);
    _paintText(canvas, size, position, formatter.format(min + max * pos));
  }

  void _drawArc(Canvas canvas, Size size, double radius, Offset center) {
    final paint = Paint()
      ..color = Colors.green.shade500
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    double startPoint = (1 / 2.4 - 1) * pi;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startPoint, -startPoint, false, paint);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startPoint - pi / 3.8, pi / 4, false,
        paint..color = Colors.orange);
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius), -pi, pi / 7.1, false, paint..color = Colors.red.shade900);
  }

  Offset _getTip(double radius, Offset center, double pos, [double needle = 20]) {
    final needleLength = radius - needle;
    final needleAngle = pi + pi * pos;
    return center.translate(needleLength * cos(needleAngle), needleLength * sin(needleAngle));
  }

  void _drawLine(Canvas canvas, Size size, double radius, Offset center) {
    final needleTip = _getTip(radius, center, value, size.width > threshold ? 20 : 0);
    final line = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;
    final rnd = size.width > threshold ? 6.0 : 3.0;
    final shift = rnd / 2 * (needleTip.dx > radius ? 1 : -1);
    final path = Path()
      ..moveTo(radius - shift, size.height - rnd)
      ..lineTo(needleTip.dx, needleTip.dy)
      ..lineTo(radius + shift, size.height + rnd);
    canvas.drawPath(path, line);
    canvas.drawCircle(center, rnd, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
