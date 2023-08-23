// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/interface/chart_data.dart';

class DataScope {
  final List<ChartData> data;
  final double xMin;
  final double xMax;
  final double yMin;
  final double yMax;

  DataScope({
    required this.data,
    required this.xMin,
    required this.xMax,
    required this.yMin,
    required this.yMax,
  });
}
