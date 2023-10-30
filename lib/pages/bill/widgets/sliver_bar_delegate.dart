// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class SliverBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  SliverBarDelegate({
    required this.child,
    this.height = 30,
  });

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(oldDelegate) => false;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => child;
}
