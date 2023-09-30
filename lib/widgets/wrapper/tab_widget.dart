// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/widgets/wrapper/dots_tab_bar_widget.dart';
import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget {
  final List<Tab>? tabs;
  final List<Widget> children;
  final double? maxWidth;
  final int focus;
  final bool asDots;
  final Function? callback;

  const TabWidget({
    super.key,
    required this.children,
    this.maxWidth,
    this.callback,
    this.tabs,
    this.focus = 0,
    this.asDots = false,
  });

  @override
  TabWidgetState createState() => TabWidgetState();
}

class TabWidgetState extends State<TabWidget> with TickerProviderStateMixin {
  late PageController pageController;
  late TabController tabController;
  late int tabCount;
  late int tabIndex;
  late int initIndex;

  @override
  void initState() {
    super.initState();
    initControllers();
  }

  void initControllers() {
    tabCount = widget.children.length;
    tabIndex = widget.focus;
    initIndex = widget.focus;
    pageController = PageController(initialPage: tabIndex);
    tabController = TabController(
      length: tabCount,
      vsync: this,
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
      tabController.animateTo(newIndex);
      pageController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: delay),
        curve: Curves.ease,
      );
      if ((currIndex - newIndex).abs() > 1) {
        delaySwitchTab(delay, newIndex);
      } else {
        tabIndex = newIndex;
        if (widget.callback != null) {
          widget.callback!(newIndex);
        }
      }
    });
  }

  PreferredSizeWidget? getAppBar(BuildContext context) {
    if (widget.asDots) {
      return DotsTabBarWidget(
        tabController: tabController,
        pageController: pageController,
        onTap: switchTab,
        tabList: widget.children,
        indent: ThemeHelper.getIndent(),
        width: widget.maxWidth ?? ThemeHelper.getWidth(context, 2),
        color: context.colorScheme.primary,
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
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() => initControllers()));
    }
    if (initIndex != widget.focus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => initIndex = widget.focus);
        switchTab(widget.focus);
      });
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
