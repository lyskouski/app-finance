// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

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
    return Container(
      width: height,
      height: width,
      child: Transform.rotate(
        angle: -90 * 3.14 / 180,
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}
