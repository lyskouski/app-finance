// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes.dart' as routes;
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/home/account_widget.dart';
import 'package:app_finance/widgets/home/bill_widget.dart';
import 'package:app_finance/widgets/home/budget_widget.dart';
import 'package:app_finance/widgets/home/goal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class HomePage extends AbstractPage {
  const HomePage({
    super.key,
    required AppData state,
  }) : super(
          state: state,
        );

  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.title;
  }

  @override
  AppBar buildBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      toolbarHeight: 40,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      title: Center(
        child: Text(
          getTitle(context),
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.subscriptions,
            color:
                Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
          ),
          tooltip: AppLocalizations.of(context)!.subscriptionTooltip,
          onPressed: () => Navigator.pushNamed(context, routes.homeRoute),
        ),
      ],
    );
  }

  @override
  FloatingActionButton buildButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, routes.homeRoute),
      tooltip: AppLocalizations.of(context)!.addMainTooltip,
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget buildContent(
      BuildContext context, BoxConstraints constraints, AppData state) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    double indent = helper.getIndent();
    EdgeInsets single = EdgeInsets.fromLTRB(indent, indent, indent, 0);
    EdgeInsets middleLeft = EdgeInsets.fromLTRB(indent, indent, 0, 0);
    EdgeInsets middleRight = EdgeInsets.fromLTRB(indent, indent, indent, 0);
    EdgeInsets bottom = EdgeInsets.fromLTRB(indent, indent, indent, indent);

    if (helper.isVertical(constraints)) {
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
            route: routes.accountRoute,
            tooltip: AppLocalizations.of(context)!.accountTooltip,
          ),
          BudgetWidget(
            margin: bottom,
            title: AppLocalizations.of(context)!.budgetHeadline,
            state: state.state['budgets'],
          ),
        ],
      );
    } else {
      double offsetWidth = MediaQuery.of(context).size.width / 2 - indent * 4;
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
                  route: routes.accountRoute,
                  tooltip: AppLocalizations.of(context)!.accountTooltip,
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
  }
}
