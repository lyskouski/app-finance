// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class BarHorizontalSingle extends StatelessWidget {
  final Color color;
  final double value;
  final double height;
  final double width;

  const BarHorizontalSingle({
    super.key,
    required this.width,
    required this.color,
    required this.value,
    this.height = 1,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: height,
      value: value,
      backgroundColor: Colors.grey,
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}
