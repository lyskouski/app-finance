// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final List<double> chunk;
  final List<List<Widget>> children;
  final double indent;
  final double maxWidth;

  const RowWidget({
    required this.chunk,
    required this.children,
    required this.indent,
    required this.maxWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double offset = maxWidth - indent * (chunk.length - 1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List<Widget>.generate(chunk.length + chunk.length - 1, (index) {
        if (index % 2 == 1) {
          return SizedBox(width: indent);
        } else {
          return Container(
            constraints: BoxConstraints(
              maxWidth: offset * chunk[index ~/ 2],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children[index ~/ 2],
            ),
          );
        }
      }),
    );
  }
}
