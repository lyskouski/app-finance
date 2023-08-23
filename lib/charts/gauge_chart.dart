// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/painter/gauge_painter.dart';
import 'package:flutter/material.dart';

class GaugeChart extends StatelessWidget {
  final double width;
  final double height;
  final double indent;
  final double value;
  final double valueMax;
  final double valueMin;

  const GaugeChart({
    super.key,
    required this.value,
    required this.valueMax,
    required this.width,
    required this.height,
    this.indent = 0.0,
    this.valueMin = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final data = value / valueMax;
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: GaugePainter(
          value: data < 0 ? 0 : (data > 1 ? 1.0 : data),
          max: valueMax,
          min: valueMin,
        ),
      ),
    );
  }
}
