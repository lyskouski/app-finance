// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/widgets/wrapper/dots_tab_bar_widget.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

enum TabType {
  primary,
  secondary,
  dots,
}

class TabWidget extends StatefulWidget {
  final List<Tab>? tabs;
  final List<Widget> children;
  final double? maxWidth;
  final int focus;
  final Function? callback;
  final TabType type;
  final bool isLeft;
  final bool hasIndent;

  const TabWidget({
    super.key,
    required this.children,
    this.maxWidth,
    this.callback,
    this.tabs,
    this.isLeft = false,
    this.hasIndent = true,
    this.focus = 0,
    this.type = TabType.primary,
  }) : assert(tabs != null || type == TabType.dots);

  @override
  // ignore: no_logic_in_create_state
  BasicTabWidgetState createState() => switch (type) {
        TabType.dots => DotsWidgetState(),
        TabType.secondary => TabSecondaryWidgetState(),
        _ => TabWidgetState(),
      };
}

abstract class BasicTabWidgetState extends State<TabWidget> with TickerProviderStateMixin {
  late PageController pageController;
  late TabController tabController;
  late int tabCount;
  late int tabIndex;
  late int initIndex;
  late bool hasIcons = widget.tabs?.first.icon != null;

  PreferredSizeWidget? getAppBar(BuildContext context);

  Widget buildContent(BuildContext context);

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
      if (pageController.hasClients) {
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
      } else {
        tabIndex = newIndex;
        if (widget.callback != null) {
          widget.callback!(newIndex);
        }
      }
    });
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
        body: buildContent(context),
      ),
    );
  }

  Widget getLeftAppBar(BuildContext context) {
    final color = context.colorScheme.onInverseSurface;
    final selected = context.textTheme.bodySmall!.copyWith(color: color);
    final style = context.textTheme.bodySmall!.copyWith(color: color.withOpacity(0.6));
    return SizedBox(
      width: AbstractPageState.barHeight,
      child: NavigationRail(
        selectedIndex: tabIndex,
        onDestinationSelected: switchTab,
        backgroundColor: context.colorScheme.primary,
        indicatorColor: Colors.transparent,
        labelType: hasIcons ? NavigationRailLabelType.all : NavigationRailLabelType.selected,
        selectedLabelTextStyle: selected,
        unselectedLabelTextStyle: style,
        indicatorShape: InputBorder.none,
        minWidth: AbstractPageState.barHeight,
        minExtendedWidth: AbstractPageState.barHeight,
        groupAlignment: BorderSide.strokeAlignCenter,
        destinations: widget.tabs!
            .asMap()
            .entries
            .map(
              hasIcons
                  ? (e) => NavigationRailDestination(
                        icon: RotatedBox(
                          quarterTurns: 3,
                          child: TextWrapper(
                            e.value.text ?? '',
                            style: tabIndex == e.key ? selected : style,
                          ),
                        ),
                        label: RotatedBox(
                          quarterTurns: 3,
                          child: e.value.icon != null
                              ? Icon(
                                  (e.value.icon as Icon).icon,
                                  color: tabIndex == e.key ? color : color.withOpacity(0.6),
                                )
                              : null,
                        ),
                      )
                  : (e) => NavigationRailDestination(
                        icon: RotatedBox(
                          quarterTurns: 3,
                          child: Container(
                            height: 20,
                            decoration: ShapeDecoration(
                              shape: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: color.withOpacity(tabIndex == e.key ? 1 : 0.2),
                                  width: 2,
                                ),
                              ),
                            ),
                            child: TextWrapper(e.value.text ?? '', style: style),
                          ),
                        ),
                        label: ThemeHelper.emptyBox,
                      ),
            )
            .toList(),
      ),
    );
  }

  Widget buildLeft(BuildContext context) {
    final indent = ThemeHelper.getIndent();
    return Row(
      children: [
        getLeftAppBar(context),
        Expanded(
          child: GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details) {
              if (details.primaryVelocity! > 0) {
                switchTab(tabIndex - 1);
              } else if (details.primaryVelocity! < 0) {
                switchTab(tabIndex + 1);
              }
            },
            child: Padding(
              padding: widget.hasIndent ? EdgeInsets.fromLTRB(indent, 0, indent, 0) : EdgeInsets.zero,
              child: TabBarView(
                controller: tabController,
                children: widget.children,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TabWidgetState extends BasicTabWidgetState {
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) {
    return TabBar(
      controller: tabController,
      onTap: switchTab,
      tabs: widget.tabs!,
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: switchTab,
      children: widget.children,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLeft) {
      return buildLeft(context);
    }
    return super.build(context);
  }
}

class DotsWidgetState extends BasicTabWidgetState {
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) {
    return DotsTabBarWidget(
      tabController: tabController,
      pageController: pageController,
      onTap: switchTab,
      tabList: widget.children,
      indent: ThemeHelper.getIndent(),
      width: widget.maxWidth ?? ThemeHelper.getWidth(context, 2),
      color: context.colorScheme.primary,
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -20),
      child: PageView(
        controller: pageController,
        onPageChanged: switchTab,
        children: widget.children,
      ),
    );
  }
}

class TabSecondaryWidgetState extends BasicTabWidgetState {
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) {
    return TabBar.secondary(
      controller: tabController,
      // onTap: switchTab,
      tabs: widget.tabs!,
    );
  }

  @override
  Widget buildContent(BuildContext context) => ThemeHelper.emptyBox;

  @override
  Widget build(BuildContext context) {
    final indent = ThemeHelper.getIndent();
    if (widget.isLeft) {
      return buildLeft(context);
    }
    return Column(
      children: [
        getAppBar(context)!,
        Expanded(
          child: Padding(
            padding: widget.hasIndent ? EdgeInsets.fromLTRB(indent, 0, indent, 0) : EdgeInsets.zero,
            child: TabBarView(
              controller: tabController,
              children: widget.children,
            ),
          ),
        ),
      ],
    );
  }
}
