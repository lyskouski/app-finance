// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/interface/chart_value.dart';
import 'package:app_finance/charts/painter/pie_radius_painter.dart';
import 'package:flutter/material.dart';

class PieRadiusChart extends StatelessWidget {
  final double width;
  final double indent;
  final List<ChartValue> data;

  const PieRadiusChart({
    super.key,
    required this.data,
    required this.width,
    this.indent = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    data.sort((a, b) => b.value.compareTo(a.value));
    return SizedBox(
      width: width,
      height: width,
      child: CustomPaint(
        painter: PieRadiusPainter(
          indent: 0.015,
          data: data,
        ),
      ),
    );
  }
}
