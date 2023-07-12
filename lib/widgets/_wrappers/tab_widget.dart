// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/tab_controller_sync.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/_wrappers/dots_tab_bar_widget.dart';
import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget {
  final List<Tab>? tabs;
  final List<Widget> children;
  final int focus;
  final bool asDots;

  const TabWidget({
    super.key,
    required this.children,
    this.tabs,
    this.focus = 0,
    this.asDots = false,
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
    initControllers();
  }

  void initControllers() {
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

  PreferredSizeWidget? getAppBar(BuildContext context) {
    if (widget.asDots) {
      var theme = ThemeHelper(windowType: getWindowType(context));
      double indent = theme.getIndent();
      return DotsTabBarWidget(
        tabController: tabController,
        pageController: pageController,
        onTap: switchTab,
        tabList: widget.children,
        indent: indent,
        width: MediaQuery.of(context).size.width - indent * 2,
        color: Theme.of(context).colorScheme.primary,
      );
    } else {
      return TabBar(
        controller: tabController,
        onTap: switchTab,
        tabs: widget.tabs!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (tabCount != widget.children.length) {
      initControllers();
    }
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! > 0) {
          switchTab(tabIndex - 1);
        } else if (details.primaryVelocity! < 0) {
          switchTab(tabIndex + 1);
        }
      },
      child: Scaffold(
        appBar: getAppBar(context),
        body: Transform.translate(
          offset: Offset(0, widget.asDots ? -20 : 0),
          child: PageView(
            controller: pageController,
            onPageChanged: switchTab,
            children: widget.children,
          ),
        ),
      ),
    );
  }
}
