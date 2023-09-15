// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
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
    List<double?> scope = [...chunk];
    int restCount = scope.where((e) => e == null).length;
    double takenWidth = 0;
    double width = maxWidth - indent * (scope.length - 1);
    for (int i = 0; i < scope.length; i++) {
      if (scope[i] == null) {
        continue;
      }
      double value = scope[i]!;
      if (value > 0 && value < 1) {
        scope[i] = value * width;
        takenWidth += scope[i]!;
      } else {
        takenWidth += value;
      }
    }
    if (takenWidth > width) {
      double cut = (width - takenWidth) / (scope.length - restCount);
      scope = scope.map((value) => value != null ? value + cut : null).toList();
      takenWidth = width;
    }
    if (restCount > 0) {
      double rest = (width - takenWidth) / restCount;
      scope = scope.map((value) => value ?? rest).toList();
    }
    this.chunk = scope.cast<double>();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: Row(
        mainAxisAlignment: alignment,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: List<Widget>.generate(2 * chunk.length - 1, (index) {
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
            return ThemeHelper.emptyBox;
          }
        }),
      ),
    );
  }
}
