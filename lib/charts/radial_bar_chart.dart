// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class RadialBarChart extends StatelessWidget {
  final Color? color;
  final IconData? icon;
  final double progress;

  const RadialBarChart({
    super.key,
    required this.progress,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
          value: progress,
          strokeWidth: 4,
          color: color,
          backgroundColor: Colors.grey.withOpacity(0.5),
        ),
        Icon(
          icon,
          color: color,
        ),
      ],
    );
  }
}
