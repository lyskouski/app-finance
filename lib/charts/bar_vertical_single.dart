// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/bar_vertical_group.dart';
import 'package:flutter/material.dart';

class BarVerticalSingle extends StatelessWidget {
  final Color color;
  final double value;
  final double height;
  final double width;

  const BarVerticalSingle({
    super.key,
    required this.color,
    required this.value,
    this.height = 32,
    this.width = 4,
  });

  @override
  Widget build(BuildContext context) {
    return BarVerticalGroup(
      color: [color],
      value: [value],
      height: height,
      width: width,
    );
  }
}
