// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/gauge_chart.dart';
import 'package:app_finance/charts/painter/gauge_linear_painter.dart';
import 'package:flutter/material.dart';

class GaugeLinearChart extends GaugeChart {
  const GaugeLinearChart({
    super.key,
    required super.value,
    required super.valueMax,
    required super.width,
    required super.height,
    super.indent = 0.0,
    super.valueMin = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final data = value / valueMax;
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: GaugeLinearPainter(
          value: data.clamp(0, 1),
          color: context.colorScheme.onBackground,
          max: valueMax,
          min: valueMin,
        ),
      ),
    );
  }
}
