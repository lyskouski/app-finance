// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/transaction_log_data.dart';
import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/charts/painter/foreground_chart_painter.dart';
import 'package:app_finance/charts/painter/line_chart_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TradeChart extends StatelessWidget {
  final double width;
  final double height;
  final double indent;
  final String tooltip;
  final List<TransactionLogData> data;

  const TradeChart({
    super.key,
    required this.data,
    required this.width,
    required this.height,
    this.indent = 0.0,
    this.tooltip = '',
  });

  List<ChartData> _getData(double initial, double timestamp) {
    final scope = data
        .map((e) => Offset(
              e.timestamp.microsecondsSinceEpoch.toDouble(),
              initial + (e.changedTo ?? 0.0) - (e.changedFrom ?? 0.0),
            ))
        .toList();
    if (scope.isNotEmpty) {
      scope.replaceRange(0, 1, [Offset(timestamp, initial)]);
    }
    return [
      ChartData(scope, color: data.isNotEmpty && initial > data.last.changedTo ? Colors.orange : Colors.blue),
      if (scope.isNotEmpty)
        ChartData([
          Offset(timestamp, initial),
          Offset(DateTime.now().microsecondsSinceEpoch.toDouble(), initial),
        ], color: Colors.grey, strokeWidth: 1)
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = Size(width, height);
    final bgColor = Theme.of(context).colorScheme.onBackground;
    final xMin = data.firstOrNull?.timestamp ?? DateTime.now();
    final xMax = DateTime.now();
    final initial = data.firstOrNull?.changedTo ?? 0.0;
    double yMin = initial * 0.2;
    double yMax = initial * 2.2;

    final bg = ForegroundChartPainter(
      size: size,
      color: bgColor,
      lineColor: bgColor,
      background: Colors.white.withOpacity(0.0),
      yMin: yMin,
      yMax: yMax,
      xType: DateTime,
      xMin: xMin.microsecondsSinceEpoch.toDouble(),
      xMax: xMax.microsecondsSinceEpoch.toDouble(),
      xDivider: 16,
      xTpl: DateFormat.Md(AppLocale.code),
    );

    return SizedBox(
      height: size.height,
      width: size.width,
      child: CustomPaint(
        size: size,
        painter: LineChartPainter(
          indent: bg.shift,
          size: size,
          data: _getData(initial, bg.xMin),
          yMin: yMin,
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
