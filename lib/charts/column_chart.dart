// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/charts/painter/column_chart_painter.dart';
import 'package:app_finance/charts/painter/foreground_chart_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ColumnChart extends StatelessWidget {
  final double width;
  final double height;
  final double indent;
  final String tooltip;
  final List<ChartData> data;
  final double yMax;

  const ColumnChart({
    super.key,
    required this.data,
    required this.yMax,
    required this.width,
    required this.height,
    this.indent = 0.0,
    this.tooltip = '',
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final size = Size(width, height);
    final bgColor = Theme.of(context).colorScheme.onBackground;
    final xMin = DateTime(now.year);
    final xMax = DateTime(now.year + 1);
    final bg = ForegroundChartPainter(
      size: size,
      color: bgColor,
      lineColor: bgColor,
      background: bgColor.withOpacity(0.1),
      yMin: 0.0,
      yMax: yMax,
      yTpl: NumberFormat.compact(locale: AppLocale.code),
      xType: DateTime,
      xMin: xMin.millisecondsSinceEpoch.toDouble(),
      xMax: xMax.millisecondsSinceEpoch.toDouble(),
      xTpl: DateFormat.MMM(AppLocale.code),
    );
    return SizedBox(
      height: size.height,
      width: size.width,
      child: CustomPaint(
        size: size,
        painter: ColumnChartPainter(
          indent: bg.shift,
          size: size,
          data: data,
          yMax: yMax,
          xMin: bg.xMin,
          xMax: bg.xMax,
        ),
        foregroundPainter: bg,
        willChange: false,
        child: Padding(
          padding: EdgeInsets.only(top: indent / 4),
          child: Text(tooltip),
        ),
      ),
    );
  }
}
