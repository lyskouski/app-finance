// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:math' as math;

extension IntExt on double {
  double toFixed(int? digits) => (this * math.pow(10, digits ?? 8)).round() / math.pow(10, digits ?? 8);

  bool isEqual(double? value) => (this - (value ?? 0)).abs() < 1e-10;

  bool isNotEqual(double? value) => !isEqual(value);
}
