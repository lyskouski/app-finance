// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_locale.dart';
import 'package:app_finance/_classes/app_menu.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/_wrappers/toolbar_button_widget.dart';
import 'package:app_finance/widgets/menu_widget.dart';
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

  AppBar buildBar(BuildContext context) {
    final helper = ThemeHelper(windowType: getWindowType(context));
    NavigatorState nav = Navigator.of(context);
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: 40,
      leading: ToolbarButtonWidget(
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
          tooltip: AppLocale.labels.backTooltip,
          onPressed: () => nav.pop(),
        ),
      ),
      title: Text(
        getTitle(),
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return AppMenu.get().map((menuItem) {
              return PopupMenuItem(
                value: menuItem.route,
                child: Row(
                  children: [
                    Icon(menuItem.icon),
                    SizedBox(width: helper.getIndent()),
                    Text(menuItem.name),
                  ],
                ),
              );
            }).toList();
          },
          onSelected: (value) => nav.pushNamed(value),
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Drawer? buildDrawer() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    double indent = ThemeHelper(windowType: getWindowType(context)).getIndent();
    return Drawer(
      elevation: 0,
      shape: Border.all(width: 0),
      child: Container(
        color: colorScheme.background,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: indent * 4),
          separatorBuilder: (context, index) => SizedBox(height: indent * 2),
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
    return Consumer<AppData>(builder: (context, appState, _) {
      state = appState;
      return Scaffold(
          appBar: buildBar(context),
          drawer: buildDrawer(),
          body: Scaffold(
            body: SafeArea(
              child: LayoutBuilder(builder: (context, constraints) {
                return buildContent(context, constraints);
              }),
            ),
          ),
          floatingActionButton: LayoutBuilder(builder: (context, constraints) {
            return buildButton(context, constraints);
          }));
    });
  }
}
