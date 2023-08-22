// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  late final List<double> chunk;
  final List<List<Widget>> children;
  final double indent;
  final double maxWidth;
  final MainAxisAlignment alignment;

  RowWidget({
    required List<double?> chunk,
    required this.children,
    required this.indent,
    required this.maxWidth,
    this.alignment = MainAxisAlignment.spaceBetween,
    super.key,
  }) {
    int restCount = chunk.where((e) => e == null).length;
    double takenWidth = 0;
    double width = maxWidth - indent * (chunk.length - 2);
    for (int i = 0; i < chunk.length; i++) {
      if (chunk[i] == null) {
        continue;
      }
      double value = chunk[i]!;
      if (value < 1) {
        chunk[i] = value * width;
      }
      takenWidth += value;
    }
    if (takenWidth > width) {
      double cut = (width - takenWidth) / (chunk.length - restCount);
      chunk = chunk.map((value) => value != null ? value + cut : null).toList();
      takenWidth = width;
    }
    if (restCount > 0) {
      double rest = (width - takenWidth) / restCount;
      chunk = chunk.map((value) => value ?? rest).toList();
    }
    this.chunk = chunk.cast<double>();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: List<Widget>.generate(chunk.length + chunk.length - 1, (index) {
        if (index % 2 == 1) {
          return SizedBox(width: indent);
        } else if (chunk[index ~/ 2] > 0) {
          return Container(
            constraints: BoxConstraints(
              maxWidth: chunk[index ~/ 2],
              minWidth: chunk[index ~/ 2],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children[index ~/ 2],
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
