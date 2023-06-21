// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes.dart' as routes;
import 'package:app_finance/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

abstract class AbstractPage<T> extends StatefulWidget {
  int selectedMenu = 0;
  final AppData state;

  AbstractPage({
    required this.state,
  });
}

abstract class AbstractPageState<T extends AbstractPage> extends State<T> {

  String getTitle(BuildContext context);

  Widget buildButton(BuildContext context, BoxConstraints constraints);

  Widget buildContent(
      BuildContext context, BoxConstraints constraints, AppData state);

  AppBar buildBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      toolbarHeight: 40,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.6),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        getTitle(context),
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return routes.menuList.map((menuItem) {
              return PopupMenuItem(
                value: menuItem.route,
                child: Row(
                  children: [
                    Icon(menuItem.icon),
                    const SizedBox(width: 8),
                    Text(menuItem.name),
                  ],
                ),
              );
            }).toList();
          },
          onSelected: (value) {
            Navigator.pushNamed(context, value);
          },
          icon: Icon(
            Icons.more_vert,
            color:
                Theme.of(context).colorScheme.inversePrimary.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppData state = widget.state;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    double indent = ThemeHelper(windowType: getWindowType(context)).getIndent();

    return Scaffold(
        appBar: buildBar(context),
        drawer: Drawer(
          elevation: 0,
          shape: Border.all(width: 0),
          child: Container(
            color: colorScheme.onBackground,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: indent * 4),
              separatorBuilder: (context, index) =>
                  SizedBox(height: indent * 2),
              itemCount: routes.menuList.length,
              itemBuilder: (context, index) => MenuWidget(
                index: index,
                setState: () => setState(() => widget.selectedMenu = index),
                selectedIndex: widget.selectedMenu,
              ),
            ),
          ),
        ),
        body: Scaffold(
          body: SafeArea(
            child: LayoutBuilder(builder: (context, constraints) {
              return buildContent(context, constraints, state);
            }),
          ),
        ),
        floatingActionButton: LayoutBuilder(builder: (context, constraints) {
          return buildButton(context, constraints);
        }));
  }
}
