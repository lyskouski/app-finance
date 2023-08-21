// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/charts/painter/foreground_chart_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarRaceChart extends StatelessWidget {
  final double width;
  final double height;
  final double indent;
  final String tooltip;
  final List<InterfaceAppData> categories;
  final List<Offset> data;
  final double yMax;

  const BarRaceChart({
    super.key,
    required this.data,
    required this.categories,
    required this.yMax,
    required this.width,
    required this.height,
    this.indent = 0.0,
    this.tooltip = '',
  });

  @override
  Widget build(BuildContext context) {
    final size = Size(width, height);
    final bgColor = Theme.of(context).colorScheme.onBackground;
    final xMax = data.reduce((max, item) => item.dy > max.dy ? item : max).dy;
    final bg = ForegroundChartPainter(
      size: size,
      color: bgColor,
      lineColor: bgColor,
      background: bgColor.withOpacity(0.1),
      yMin: 0.0,
      yMax: yMax,
      yType: IconData,
      yMap: categories.map((e) => e.icon).toList(),
      xType: double,
      xMin: 0.0,
      xMax: (xMax * 1.2).ceilToDouble(),
      xTpl: DateFormat.M(AppLocale.code),
    );
    return SizedBox(
      height: size.height,
      width: size.width,
      child: CustomPaint(
        size: size,
        /*painter:  ColumnChartPainter(
          indent: bg.shift,
          size: size,
          data: data,
          yMax: yMax,
          xMin: xMin.microsecondsSinceEpoch.toDouble(),
          xMax: xMax.microsecondsSinceEpoch.toDouble(),
        ),*/
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
