// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class BarVerticalGroup extends StatelessWidget {
  final List<Color> color;
  final List<double> value;
  final double height;
  final double width;

  const BarVerticalGroup({
    super.key,
    required this.color,
    required this.value,
    this.height = 32,
    this.width = 4,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: height,
      height: width,
      child: Transform.rotate(
        angle: -90 * 3.14 / 180,
        child: ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return LinearProgressIndicator(
                value: value[index],
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(color[index]),
              );
            }),
      ),
    );
  }
}
