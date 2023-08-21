// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class ForecastData {
  final List<Offset> data;
  final Color color;

  ForecastData(this.data, {this.color = Colors.red});
}
