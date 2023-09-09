// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_configs/responsive_matrix.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_generic/app_bar_widget.dart';
import 'package:app_finance/widgets/_generic/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class AbstractPage<T> extends StatefulWidget {
  AbstractPage() : super(key: UniqueKey());
}

abstract class AbstractPageState<T extends AbstractPage> extends State<T> {
  late AppData state;
  int selectedMenu = 0;

  String getTitle();

  Widget buildButton(BuildContext context, BoxConstraints constraints);

  Widget buildContent(BuildContext context, BoxConstraints constraints);

  AppBar buildBar(BuildContext context, [bool isBottom = false]) {
    final text = Text(getTitle(), style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary));
    return AppBarWidget(
      title: isBottom ? text : Center(child: text),
      colorScheme: Theme.of(context).colorScheme,
      nav: Navigator.of(context),
    );
  }

  Drawer? buildDrawer() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    double indent = ThemeHelper.getIndent();
    return Drawer(
      elevation: 0,
      shape: Border.all(width: 0),
      child: Container(
        color: colorScheme.background,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: indent * 4),
          separatorBuilder: (context, index) => ThemeHelper.hIndent2x,
          itemCount: AppMenu.get().length,
          itemBuilder: (context, index) => MenuWidget(
            index: index,
            setState: () => setState(() => selectedMenu = index),
            selectedIndex: selectedMenu,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FocusController.init();
    final matrix = ResponsiveMatrix(getWindowType(context));
    return LayoutBuilder(builder: (context, constraints) {
      final button = buildButton(context, constraints);
      final isBottom = matrix.getWidthCount(constraints) <= 2;
      return Consumer<AppData>(builder: (context, appState, _) {
        state = appState;
        final appBar = buildBar(context, isBottom);
        return Scaffold(
          appBar: isBottom ? null : appBar,
          bottomNavigationBar: isBottom
              ? BottomAppBar(
                  padding: EdgeInsets.zero,
                  notchMargin: CircularProgressIndicator.strokeAlignCenter,
                  height: appBar.toolbarHeight,
                  color: appBar.backgroundColor,
                  shape: button != ThemeHelper.emptyBox ? const CircularNotchedRectangle() : null,
                  child: Row(
                    children: appBar.leading != null
                        ? [
                            appBar.leading!,
                            appBar.title!,
                            const Spacer(),
                            ...appBar.actions!,
                          ]
                        : [],
                  ),
                )
              : null,
          drawer: buildDrawer(),
          body: Scaffold(
            body: SafeArea(
              child: buildContent(context, constraints),
            ),
          ),
          floatingActionButtonLocation: isBottom ? FloatingActionButtonLocation.centerDocked : null,
          floatingActionButton: button,
        );
      });
    });
  }
}
