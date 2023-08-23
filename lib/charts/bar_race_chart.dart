// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';
import 'dart:math';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/charts/painter/bar_chart_painter.dart';
import 'package:app_finance/charts/painter/foreground_chart_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarRaceChart extends StatelessWidget {
  final double width;
  final double indent;
  final String tooltip;
  final List<InterfaceAppData> categories;
  final List<Offset> data;

  const BarRaceChart({
    super.key,
    required this.data,
    required this.categories,
    required this.width,
    this.indent = 0.0,
    this.tooltip = '',
  });

  List<ChartData> _getData() {
    final plot = SplayTreeMap<double, ChartData>();
    final rnd = Random();
    for (int i = 0; i < data.length; i++) {
      final key = data[i].dy + rnd.nextDouble();
      plot[key] = ChartData([data[i]], color: categories[i].color ?? Colors.grey, helper: categories[i]);
    }
    int idx = plot.values.length;
    return plot.values.map((e) {
      e.data.replaceRange(0, 1, [Offset(idx.toDouble(), e.data.first.dy)]);
      idx--;
      return e;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.onBackground;
    final xMax = data.reduce((max, item) => item.dy > max.dy ? item : max).dy;
    final plot = _getData();
    final size = Size(width, 36.0 * plot.length);
    final bg = ForegroundChartPainter(
      size: size,
      color: bgColor,
      lineColor: bgColor,
      background: bgColor.withOpacity(0.1),
      yMin: 0.0,
      yMax: 1.0 + plot.length,
      yType: IconData,
      yMap: plot.map((e) => e.helper.icon).toList(),
      xType: double,
      xMin: 0.0,
      xMax: (xMax * 1.2).ceilToDouble(),
      xTpl: NumberFormat.compact(locale: AppLocale.code),
    );
    return SizedBox(
      height: size.height,
      width: size.width,
      child: CustomPaint(
        size: size,
        painter: BarChartPainter(
          indent: bg.shift,
          size: size,
          data: plot,
          yMax: bg.yMax,
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
