// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes.dart' as routes;
import 'package:app_finance/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

abstract class AbstractPage extends StatefulWidget {
  final AppData state;
  const AbstractPage({
    super.key,
    required this.state,
  });

  String getTitle(BuildContext context);

  FloatingActionButton buildButton(BuildContext context);

  Widget buildContent(
      BuildContext context, BoxConstraints constraints, AppData state);

  @override
  State<AbstractPage> createState() => _AbstractPageState();

  AppBar buildBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      toolbarHeight: 40,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
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
                child: Row(
                  children: [
                    Icon(menuItem.icon),
                    SizedBox(width: 8),
                    Text(menuItem.name),
                  ],
                ),
                value: menuItem.route,
              );
            }).toList();
          },
          onSelected: (value) {
            Navigator.pushNamed(context, value);
          },
          icon: Icon(Icons.more_vert),
        ),
      ],
    );
  }
}

class _AbstractPageState extends State<AbstractPage> {
  get tabBarView => null;
  int selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    final AppData state = widget.state;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    double indent = ThemeHelper(windowType: getWindowType(context)).getIndent();

    return Scaffold(
      appBar: widget.buildBar(context),
      drawer: Drawer(
        elevation: 0,
        shape: Border.all(width: 0),
        child: Container(
          color: colorScheme.onBackground,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: indent * 4),
            separatorBuilder: (context, index) => SizedBox(height: indent * 2),
            itemCount: routes.menuList.length,
            itemBuilder: (context, index) => MenuWidget(
              index: index,
              setState: () => setState(() => selectedMenu = index),
              selectedIndex: selectedMenu,
            ),
          ),
        ),
      ),
      body: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            return widget.buildContent(context, constraints, state);
          }),
        ),
      ),
      floatingActionButton: widget.buildButton(context),
    );
  }
}
