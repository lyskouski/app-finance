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
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class AbstractPageState<T extends StatefulWidget> extends State<T> {
  late AppData state;
  int selectedMenu = 0;

  String getTitle();

  String getButtonName();

  Widget buildButton(BuildContext context, BoxConstraints constraints);

  Widget buildContent(BuildContext context, BoxConstraints constraints);

  AppBar buildBar(BuildContext context, [bool isBottom = false]) {
    final text = Text(
      getTitle(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
    );
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
    final indent = ThemeHelper.getIndent();
    return LayoutBuilder(builder: (context, constraints) {
      final button = buildButton(context, constraints);
      final isBottom = matrix.isNavBottom(constraints);
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
                  child: appBar.leading == null
                      ? ThemeHelper.emptyBox
                      : RowWidget(
                          maxWidth: constraints.maxWidth,
                          indent: 0,
                          chunk: [50, null, getButtonName().isNotEmpty ? 0.5 : 0, 50],
                          children: [
                            [appBar.leading!],
                            [Center(heightFactor: 2, child: appBar.title!)],
                            [
                              Padding(
                                padding: EdgeInsets.only(left: 84, top: indent / 2),
                                child: Text(getButtonName(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: Theme.of(context).colorScheme.inversePrimary,
                                        )),
                              ),
                            ],
                            appBar.actions!,
                          ],
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
