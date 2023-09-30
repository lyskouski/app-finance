// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/charts/painter/forecast_chart_painter.dart';
import 'package:app_finance/charts/painter/foreground_chart_painter.dart';
import 'package:app_finance/widgets/generic/empty_widget.dart';
import 'package:flutter/material.dart';

class ForecastChart extends StatelessWidget {
  final double width;
  final double height;
  final double indent;
  final String tooltip;
  final List<ChartData> data;
  final double yMax;

  const ForecastChart({
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
    if (data.isEmpty || data.first.data.isEmpty) {
      return const EmptyWidget();
    }
    final now = DateTime.now();
    final size = Size(width, height);
    final bgColor = context.colorScheme.onBackground;
    final xMin = DateTime(now.year, now.month);
    final xMax = DateTime(now.year, now.month + 1);
    final bg = ForegroundChartPainter(
      size: size,
      color: bgColor,
      lineColor: bgColor,
      background: bgColor.withOpacity(0.1),
      yMin: 0.0,
      yMax: 140,
      yArea: [80, 120],
      xType: DateTime,
      xMin: xMin.millisecondsSinceEpoch.toDouble(),
      xMax: xMax.millisecondsSinceEpoch.toDouble(),
    );
    return SizedBox(
      height: size.height,
      width: size.width,
      child: CustomPaint(
        size: size,
        painter: ForecastChartPainter(
          indent: bg.shift,
          size: size,
          data: data,
          yMax: yMax * bg.yMax / 100,
          xMin: xMin.millisecondsSinceEpoch.toDouble(),
          xMax: xMax.millisecondsSinceEpoch.toDouble(),
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
