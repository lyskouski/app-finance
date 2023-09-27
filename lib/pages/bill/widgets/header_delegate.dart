// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:flutter/material.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final key = GlobalKey();
  double closedHeight;
  double openHeight;
  String title;
  Function callback;

  HeaderDelegate(
    this.title, {
    this.closedHeight = 20,
    this.openHeight = 20,
    required this.callback,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final tmp = key.currentContext;
    try {
      if (tmp != null && tmp.mounted && tmp.findRenderObject() is RenderBox) {
        callback(title);
      }
    } catch (e) {
      // .. ignore inactive state
    }
    final indent = ThemeHelper.getIndent();
    return Container(
      padding: EdgeInsets.fromLTRB(indent, indent / 2, 0, 0),
      key: key,
      height: openHeight,
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.secondary.withOpacity(0.2),
          ),
        ),
      ),
      child: Text(title, style: context.textTheme.labelMedium),
    );
  }

  @override
  double get maxExtent => openHeight;

  @override
  double get minExtent => closedHeight;

  @override
  bool shouldRebuild(oldDelegate) => true;
}
