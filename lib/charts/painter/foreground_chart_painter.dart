// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/charts/painter/abstract_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class ForegroundChartPainter extends AbstractPainter {
  final Color color;
  final Color lineColor;
  final Color areaColor;
  final Color background;
  final List<double> yArea;
  final Type? xType;
  final Type? yType;
  final List<dynamic> yMap;
  late final double textArea;
  late final double shift;
  late final int yDiv;
  final int yDivider;
  late final int xDiv;
  final int xDivider;
  final dynamic xTpl;
  final dynamic yTpl;

  static const double coercion = 1.2;

  ForegroundChartPainter({
    required super.size,
    super.indent = 0.0,
    this.areaColor = Colors.green,
    this.background = Colors.grey,
    this.color = Colors.black,
    this.lineColor = Colors.black,
    this.xDivider = 12,
    super.xMin = 0.0,
    super.xMax = 1.0,
    this.xTpl,
    this.xType = double,
    this.yArea = const [],
    this.yMap = const [],
    this.yDivider = 12,
    super.yMin = 0.0,
    super.yMax = 1.0,
    this.yTpl,
    this.yType = double,
  }) {
    _setTextArea();
    shift = textArea * coercion;
    yDiv = yDivider * size!.height ~/ 400;
    xDiv = xDivider * size!.width ~/ 640;
  }

  void _setTextArea() {
    double tmp = size!.width / 20;
    if (tmp > 32) {
      textArea = 32.0;
    } else if (tmp < 20) {
      textArea = 20.0;
    } else {
      textArea = tmp;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    size = this.size ?? size;
    _paintAxisY(canvas, size);
    _paintAxisX(canvas, size);
    if (yArea.length == 2) {
      _plotAssert(canvas, size);
      _paintAssertLine(canvas, size, (yArea[0] + yArea[1]) / 2);
    } else if (yArea.length == 1) {
      _paintAssertLine(canvas, size, yArea[0]);
    }
  }

  void _paintAssertLine(Canvas canvas, Size size, double yPos) {
    final line = Paint()
      ..color = areaColor
      ..strokeWidth = 1;
    if (yMax == 0 || yDiv == 0) {
      return;
    }
    double y = _shiftStep(size.height, textArea, yDiv, (yPos - yMin) / (yMax / yDiv));
    canvas.drawLine(Offset(shift, y), Offset(size.width, y), line);
  }

  void _plotAssert(Canvas canvas, Size size) {
    final background = Paint()
      ..color = areaColor.withOpacity(0.1)
      ..style = PaintingStyle.fill;
    if (yMax == 0 || yDiv == 0) {
      return;
    }
    canvas.drawRect(
      Rect.fromPoints(
        Offset(shift, _shiftStep(size.height, textArea, yDiv, ((yArea[0] - yMin) / (yMax / yDiv)).round())),
        Offset(size.width, _shiftStep(size.height, textArea, yDiv, ((yArea[1] - yMin) / (yMax / yDiv)).round())),
      ),
      background,
    );
  }

  void _paintText(Canvas canvas, double x, double y, String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: textArea / 2.2,
          fontFamily: 'Abel-Regular',
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(x - textPainter.width, y));
  }

  void _paintIcon(Canvas canvas, double x, double y, IconData? icon) {
    if (icon == null) {
      return;
    }
    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          color: color,
          fontSize: textArea,
          fontFamily: Icons.question_mark.fontFamily,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(x - textPainter.width, y));
  }

  void _paintAxisY(Canvas canvas, Size size) {
    final lineColor = Paint()
      ..color = this.lineColor.withOpacity(0.4)
      ..strokeWidth = 0.5;
    double step = (yMax - yMin) / yDiv;
    for (int i = 0; i < yDiv; i++) {
      double delta = step * i;
      double y = _shiftStep(size.height, textArea, yDiv, i);
      if (yType != null || i == 0) {
        canvas.drawLine(Offset(shift, y), Offset(size.width, y), lineColor);
      }
      if (yType == double) {
        final formatter = yTpl ?? intl.NumberFormat.decimalPatternDigits(decimalDigits: 2, locale: AppLocale.code);
        _paintText(canvas, textArea, y - textArea / 3, formatter.format(yMin + delta));
      } else if (yType == IconData) {
        final code = i >= yMap.length ? null : yMap[i];
        _paintIcon(canvas, textArea, y - textArea, code);
      }
    }
  }

  double _shiftStep(total, shift, div, i) {
    return (total - shift) * (1 - i / div);
  }

  void _paintAxisX(Canvas canvas, Size size) {
    final lineColor = Paint()
      ..color = this.lineColor.withOpacity(0.4)
      ..strokeWidth = 0.5;
    final background = Paint()
      ..color = this.background.withOpacity(0.05)
      ..style = PaintingStyle.fill;
    double? step;
    if (xType == DateTime) {
      step = (xMax - xMin - 1) / xDiv;
    } else {
      step = (xMax - xMin) / xDiv;
    }
    double height = size.height - textArea;
    for (int i = 0; i <= xDiv; i++) {
      double delta = step * (xDiv - i);
      double x = _shiftStep(size.width, shift, xDiv, i);
      canvas.drawLine(Offset(x + shift, height), Offset(x + shift, height + 4), lineColor);
      if (i < xDiv) {
        dynamic value = xMin + delta;
        if (xType == DateTime) {
          final formatter = xTpl ?? intl.DateFormat('d');
          value = formatter.format(DateTime.fromMillisecondsSinceEpoch(value.toInt()));
        } else {
          final formatter = xTpl ?? intl.NumberFormat.decimalPatternDigits(decimalDigits: 1, locale: AppLocale.code);
          value = formatter.format(value as double);
        }
        if (xType != null) {
          _paintText(canvas, x + shift - 2, height + 1, value.toString());
        }
      }
      if (i % 2 != 0) {
        canvas.drawRect(
          Rect.fromPoints(
            Offset(x + shift, 0),
            Offset(_shiftStep(size.width, shift, xDiv, i - 1) + shift, height),
          ),
          background,
        );
      }
    }
  }
}
