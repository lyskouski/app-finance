// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_menu.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/_wrappers/toolbar_button_widget.dart';
import 'package:app_finance/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';

abstract class AbstractPage<T> extends StatefulWidget {
  AbstractPage() : super(key: UniqueKey());
}

abstract class AbstractPageState<T extends AbstractPage> extends State<T> {
  late AppData state;
  int selectedMenu = 0;

  String getTitle(BuildContext context);

  Widget buildButton(BuildContext context, BoxConstraints constraints);

  Widget buildContent(BuildContext context, BoxConstraints constraints);

  AppBar buildBar(BuildContext context) {
    final helper = ThemeHelper(windowType: getWindowType(context));
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      toolbarHeight: 40,
      leading: ToolbarButtonWidget(
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color:
                Theme.of(context).colorScheme.inversePrimary.withOpacity(0.6),
          ),
          tooltip: AppLocalizations.of(context)!.backTooltip,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: Text(
        getTitle(context),
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return AppMenu(context: context).get().map((menuItem) {
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
          itemCount: AppMenu(context: context).get().length,
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
