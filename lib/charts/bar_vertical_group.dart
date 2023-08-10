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
    double left = value.fold(1.0, (v, e) => v - e);
    value.insert(0, left < 0 ? 0.0 : left);
    color.insert(0, Colors.grey);
    return SizedBox(
      width: width,
      height: height,
      child: ListView.builder(
        itemCount: value.length,
        itemBuilder: (context, index) {
          return Container(
            color: color[index],
            child: SizedBox(
              width: width,
              height: height * (value[index] > 0 ? value[index] : 0.0),
            ),
          );
        },
      ),
    );
  }
}
