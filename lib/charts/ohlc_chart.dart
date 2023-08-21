// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/charts/painter/foreground_chart_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OhlcData {
  final DateTime date;
  final double open;
  final double high;
  final double low;
  final double close;

  OhlcData({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });
}

class OhlcChart extends StatefulWidget {
  final double width;
  final double height;
  final double indent;
  final String tooltip;
  final List<OhlcData> data;

  const OhlcChart({
    super.key,
    required this.data,
    required this.width,
    required this.height,
    this.indent = 0.0,
    this.tooltip = '',
  });

  @override
  OhlcChartState createState() => OhlcChartState();
}

class OhlcChartState extends State<OhlcChart> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final size = Size(widget.width, widget.height);
    final bgColor = Theme.of(context).colorScheme.onBackground;
    final xMin = DateTime(now.year, now.month - 5);
    final xMax = DateTime(now.year, now.month + 1);
    final bg = ForegroundChartPainter(
      size: size,
      color: bgColor,
      lineColor: bgColor,
      background: bgColor.withOpacity(0.1),
      yMin: 0.0, //tbd
      yMax: 1.4, //tbd
      xType: DateTime,
      xMin: xMin,
      xMax: xMax,
      xDivider: 6,
      xTpl: DateFormat.Md(AppLocale.code),
    );
    return SizedBox(
      height: size.height,
      width: size.width,
      child: CustomPaint(
        size: size,
        /* painter: OhlcChartPainter(
          indent: bg.shift,
          size: size,
          data: widget.data,
          yMax: widget.yMax,
          xMin: xMin.microsecondsSinceEpoch.toDouble(),
          xMax: xMax.microsecondsSinceEpoch.toDouble(),
        ),*/
        foregroundPainter: bg,
        willChange: false,
        child: Padding(
          padding: EdgeInsets.only(top: widget.indent / 4),
          child: Text(widget.tooltip),
        ),
      ),
    );
  }
}
