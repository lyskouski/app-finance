// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:flutter/material.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final key = GlobalKey();
  double closedHeight;
  double openHeight;
  String title;
  Function? callback;

  SliverHeaderDelegate(
    this.title, {
    this.closedHeight = 29,
    this.openHeight = 30,
    this.callback,
  });

  @override
  double get maxExtent => openHeight;

  @override
  double get minExtent => closedHeight;

  @override
  bool shouldRebuild(oldDelegate) => true;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final tmp = key.currentContext;
    try {
      if (tmp != null && tmp.mounted && tmp.findRenderObject() is RenderBox) {
        callback?.call(title);
      }
    } catch (e) {
      // .. ignore inactive state
    }
    final indent = ThemeHelper.getIndent();
    final isPinned = shrinkOffset == maxExtent;
    return Container(
      padding: EdgeInsets.fromLTRB(indent, indent / 2, 0, 0),
      key: key,
      height: openHeight,
      decoration: BoxDecoration(
        color: isPinned
            ? Color.alphaBlend(context.colorScheme.inverseSurface.withOpacity(0.1), context.colorScheme.background)
            : context.colorScheme.background,
        border: isPinned
            ? null
            : Border(
                bottom: BorderSide(
                  color: context.colorScheme.secondary.withOpacity(0.2),
                ),
              ),
      ),
      child: Align(
        alignment: AppDesign.isRightToLeft() ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(title, style: context.textTheme.bodySmall),
      ),
    );
  }
}
