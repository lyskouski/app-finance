// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/wrapper/row_widget.dart';
import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  final List<List<Widget>> data;
  final List<double?> chunk;
  final Color shadowColor;
  final double width;

  const TableWidget({
    super.key,
    required this.data,
    required this.width,
    required this.chunk,
    required this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    final length = data.isNotEmpty ? data.length + 1 : 0;
    double height = ThemeHelper.getMaxHeight(data.firstOrNull ?? [const Text('*')]) + ThemeHelper.getIndent();
    return SizedBox(
      width: width,
      height: length * height,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: length,
        itemBuilder: (context, index) {
          if (index == 1) {
            return const Divider(thickness: 1);
          }
          final idx = index == 0 ? 0 : index - 1;
          return Container(
            color: idx > 0 && idx % 2 == 0 ? shadowColor : Colors.transparent,
            child: RowWidget(
              chunk: chunk,
              alignment: MainAxisAlignment.end,
              indent: ThemeHelper.getIndent(),
              maxWidth: width,
              children: data[idx].map((o) => [o]).toList(),
            ),
          );
        },
      ),
    );
  }
}
