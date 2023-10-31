// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/_widgets/wrapper/row_widget.dart';
import 'package:flutter/material.dart';

class GridLayer extends StatelessWidget {
  final double padding;
  final double? width;
  final int crossAxisCount;
  final List<dynamic> children;
  final List<dynamic> strategy;

  const GridLayer({
    super.key,
    required this.padding,
    required this.crossAxisCount,
    required this.children,
    required this.strategy,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    fnItem(int index) => children[index] is Function ? children[index]() : children[index];
    fnList(List<dynamic> scope) => scope.map((e) => e is List ? fnList(e).cast<Widget>().toList() : fnItem(e));
    return Padding(
      padding: EdgeInsets.only(left: padding, right: padding),
      child: strategy.length > 1
          ? RowWidget(
              indent: padding,
              maxWidth: width ?? ThemeHelper.getWidth(context, 2),
              chunk: List.generate(crossAxisCount, (_) => null),
              children: fnList(strategy).cast<List<Widget>>().toList(),
            )
          : Column(
              children: fnList(strategy.first).cast<Widget>().toList(),
            ),
    );
  }
}
