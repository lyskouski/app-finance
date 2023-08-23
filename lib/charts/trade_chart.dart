// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/transaction_log_data.dart';
import 'package:app_finance/charts/interface/chart_data.dart';
import 'package:app_finance/charts/interface/data_scope.dart';
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

  DataScope _prepareData() {
    final result = SplayTreeMap<double, Offset>();
    final xMax = DateTime.now().microsecondsSinceEpoch.toDouble();
    double yMin = data.firstOrNull?.changedTo ?? 0.0;
    double yMax = 0.0;
    for (int i = 0; i < data.length; i++) {
      final time = data[i].timestamp;
      final x = DateTime(time.year, time.month, time.day).microsecondsSinceEpoch.toDouble();
      if (!result.containsKey(x) || result[x]!.dy < data[i].changedTo) {
        result[x] = Offset(x, data[i].changedTo ?? 0.0);
      }
      if (data[i].changedTo > yMax) {
        yMax = data[i].changedTo;
      }
      if (data[i].changedTo < yMin) {
        yMin = data[i].changedTo;
      }
    }
    final scope = result.values.toList();
    return DataScope(
      xMax: xMax,
      xMin: scope.firstOrNull?.dx ?? xMax,
      yMin: yMin * 0.8,
      yMax: yMax * 1.2,
      data: [
        ChartData(
          scope,
          color: scope.isNotEmpty && scope.first.dy > scope.last.dy ? Colors.orange : Colors.blue,
        ),
        if (scope.isNotEmpty)
          ChartData([
            scope.first,
            Offset(DateTime.now().microsecondsSinceEpoch.toDouble(), scope.first.dy),
          ], color: Colors.grey, strokeWidth: 1)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = Size(width, height);
    final bgColor = Theme.of(context).colorScheme.onBackground;
    final scope = _prepareData();

    final bg = ForegroundChartPainter(
      size: size,
      color: bgColor,
      lineColor: bgColor,
      background: Colors.white.withOpacity(0.0),
      yMin: scope.yMin,
      yMax: scope.yMax,
      xType: DateTime,
      xMin: scope.xMin,
      xMax: scope.xMax,
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
          data: scope.data,
          yMin: scope.yMin,
          yMax: scope.yMax,
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
