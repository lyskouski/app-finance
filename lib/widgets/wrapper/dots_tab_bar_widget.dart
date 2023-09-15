// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/widgets/wrapper/dots_indicator_decoration.dart';
import 'package:flutter/material.dart';

class DotsTabBarWidget extends TabBar {
  final TabController tabController;
  final PageController pageController;
  final List<Widget> tabList;
  final double indent;
  final double width;
  final Color color;

  const DotsTabBarWidget({
    super.key,
    required this.tabController,
    required this.pageController,
    required this.tabList,
    required this.indent,
    required this.width,
    required this.color,
    onTap,
  }) : super(
          controller: tabController,
          mouseCursor: SystemMouseCursors.click,
          onTap: onTap,
          tabs: tabList,
          dividerColor: Colors.transparent,
        );

  @override
  get tabs => tabList.map((tab) => SizedBox(width: indent, height: indent)).toList();

  @override
  get padding => EdgeInsets.symmetric(horizontal: (width - (tabList.length - 1) * 2 * indent) / 2);

  @override
  get indicator => DotsIndicatorDecoration(
        controller: pageController,
        itemCount: tabList.length,
        color: color,
        dotSize: indent,
      );
}
