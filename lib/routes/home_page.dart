// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/home/account_widget.dart';
import 'package:app_finance/widgets/home/base_widget.dart';
import 'package:app_finance/widgets/home/bill_widget.dart';
import 'package:app_finance/widgets/home/budget_widget.dart';
import 'package:app_finance/widgets/home/goal_widget.dart';
import 'package:app_finance/routes.dart' as routes;
import 'package:app_finance/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class HomePage extends StatefulWidget {
  final AppData state;
  const HomePage({
    super.key,
    required this.state,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get tabBarView => null;
  int selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    final AppData state = widget.state;
    var theme = ThemeHelper(windowType: getWindowType(context));
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    double indent = theme.getIndent();
    EdgeInsets single = EdgeInsets.fromLTRB(indent, indent, indent, 0);
    EdgeInsets middleLeft = EdgeInsets.fromLTRB(indent, indent, 0, 0);
    EdgeInsets middleRight = EdgeInsets.fromLTRB(indent, indent, indent, 0);
    EdgeInsets bottom = EdgeInsets.fromLTRB(indent, indent, indent, indent);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        toolbarHeight: 40,
        title: Center(
          child: Text(
            AppLocalizations.of(context)!.title,
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.subscriptions),
            tooltip: AppLocalizations.of(context)!.subscriptionTooltip,
            onPressed: () => Navigator.pushNamed(context, routes.homeRoute),
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 0,
        shape: Border.all(width: 0),
        child: Container(
          color: colorScheme.onBackground,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: theme.getIndent() * 4),
            separatorBuilder: (context, index) =>
                SizedBox(height: theme.getIndent() * 2),
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
            if (theme.isLower(AdaptiveWindowType.small) &&
                constraints.maxWidth < constraints.maxHeight) {
              return Column(
                children: [
                  GoalWidget(
                    margin: single,
                    state: state.state['goals'],
                  ),
                  BillWidget(
                    margin: single,
                    title: AppLocalizations.of(context)!.billHeadline,
                    state: state.state['bills'],
                  ),
                  AccountWidget(
                    margin: single,
                    title: AppLocalizations.of(context)!.accountHeadline,
                    state: state.state['accounts'],
                  ),
                  BudgetWidget(
                    margin: bottom,
                    title: AppLocalizations.of(context)!.budgetHeadline,
                    state: state.state['budgets'],
                  ),
                ],
              );
            } else {
              double offsetWidth =
                  MediaQuery.of(context).size.width / 2 - indent * 4;
              return Column(
                children: [
                  GoalWidget(
                    margin: single,
                    state: state.state['goals'],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        AccountWidget(
                          margin: middleLeft,
                          offset: offsetWidth,
                          title: AppLocalizations.of(context)!.accountHeadline,
                          state: state.state['accounts'],
                        ),
                        BillWidget(
                          margin: middleRight,
                          offset: offsetWidth,
                          title: AppLocalizations.of(context)!.billHeadline,
                          state: state.state['bills'],
                        ),
                      ],
                    ),
                  ),
                  BudgetWidget(
                    margin: bottom,
                    title: AppLocalizations.of(context)!.budgetHeadline,
                    state: state.state['budgets'],
                  ),
                ],
              );
            }
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, routes.homeRoute),
        tooltip: AppLocalizations.of(context)!.addMainTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }
}
