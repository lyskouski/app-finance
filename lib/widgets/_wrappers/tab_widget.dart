// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/tab_controller_sync.dart';
import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget {
  final List<Tab> tabs;
  final List<Widget> children;
  final int focus;

  const TabWidget({
    super.key,
    required this.tabs,
    required this.children,
    this.focus = 0,
  });

  @override
  TabWidgetState createState() => TabWidgetState();
}

class TabWidgetState extends State<TabWidget> {
  late PageController pageController;
  late TabController tabController;
  late int tabCount;
  late int tabIndex;

  @override
  void initState() {
    super.initState();
    tabCount = widget.children.length;
    tabIndex = widget.focus;
    pageController = PageController(initialPage: tabIndex);
    tabController = TabController(
      length: tabCount,
      vsync: const TabControllerSync(),
      initialIndex: tabIndex,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    tabController.dispose();
    super.dispose();
  }

  Future<void> delaySwitchTab(int delay, int newIndex) async {
    await Future.delayed(Duration(milliseconds: delay));
    switchTab(newIndex);
  }

  void switchTab(int newIndex) {
    if (newIndex < 0 || newIndex >= tabCount) {
      return;
    }
    setState(() {
      const delay = 300;
      final currIndex = tabIndex;
      tabIndex = newIndex;
      tabController.animateTo(newIndex);
      pageController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: delay),
        curve: Curves.ease,
      );
      if ((currIndex - newIndex).abs() > 1) {
        delaySwitchTab(delay, newIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! > 0) {
          switchTab(tabIndex - 1);
        } else if (details.primaryVelocity! < 0) {
          switchTab(tabIndex + 1);
        }
      },
      child: Scaffold(
        appBar: TabBar(
          controller: tabController,
          onTap: switchTab,
          tabs: widget.tabs,
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: switchTab,
          children: widget.children,
        ),
      ),
    );
  }
}
