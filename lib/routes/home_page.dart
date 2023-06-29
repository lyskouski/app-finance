// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/home/account_widget.dart';
import 'package:app_finance/widgets/home/bill_widget.dart';
import 'package:app_finance/widgets/home/budget_widget.dart';
import 'package:app_finance/widgets/home/goal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';

class HomePage extends AbstractPage {
  HomePage() : super();

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends AbstractPageState<HomePage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.appTitle;
  }

  @override
  AppBar buildBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      toolbarHeight: 40,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              color:
                  Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
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
          onPressed: () => Navigator.pushNamed(context, AppRoute.homeRoute),
        ),
      ],
    );
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, AppRoute.billAddRoute),
      tooltip: AppLocalizations.of(context)!.addMainTooltip,
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    double indent = helper.getIndent();
    EdgeInsets single = EdgeInsets.fromLTRB(indent, indent, indent, 0);
    EdgeInsets middleLeft = EdgeInsets.fromLTRB(indent, indent, 0, 0);
    EdgeInsets middleRight = EdgeInsets.fromLTRB(indent, indent, indent, 0);
    EdgeInsets bottom = EdgeInsets.fromLTRB(indent, indent, indent, indent);
    double width = MediaQuery.of(context).size.width - indent * 2;
    double halfWidth = width / 2 - indent;
    final locale = Localizations.localeOf(context).toString();
    final DateFormat formatterDate = DateFormat.MMMM(locale);

    if (helper.isVertical(constraints)) {
      return Column(
        children: [
          GoalWidget(
            margin: single,
            state: widget.state!.getList(AppDataType.goals),
          ),
          BillWidget(
            margin: single,
            title:
                '${AppLocalizations.of(context)!.billHeadline}, ${formatterDate.format(DateTime.now())}',
            state: widget.state?.get(AppDataType.bills),
            offset: width,
          ),
          AccountWidget(
            margin: single,
            title:
                '${AppLocalizations.of(context)!.accountHeadline}, ${AppLocalizations.of(context)!.total}',
            state: widget.state?.get(AppDataType.accounts),
            route: AppRoute.accountRoute,
            tooltip: AppLocalizations.of(context)!.accountTooltip,
            offset: width,
          ),
          BudgetWidget(
            margin: bottom,
            title:
                '${AppLocalizations.of(context)!.budgetHeadline}, ${AppLocalizations.of(context)!.left}',
            state: widget.state?.get(AppDataType.budgets),
            route: AppRoute.budgetRoute,
            tooltip: AppLocalizations.of(context)!.budgetTooltip,
            offset: width,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          GoalWidget(
            margin: single,
            state: widget.state?.get(AppDataType.goals).list,
          ),
          Expanded(
            child: Row(
              children: [
                AccountWidget(
                  margin: middleLeft,
                  offset: halfWidth,
                  title: AppLocalizations.of(context)!.accountHeadline,
                  state: widget.state?.get(AppDataType.accounts),
                  route: AppRoute.accountRoute,
                  tooltip: AppLocalizations.of(context)!.accountTooltip,
                ),
                BillWidget(
                  margin: middleRight,
                  offset: halfWidth,
                  title: AppLocalizations.of(context)!.billHeadline,
                  state: widget.state?.get(AppDataType.bills),
                ),
              ],
            ),
          ),
          BudgetWidget(
            margin: bottom,
            title: AppLocalizations.of(context)!.budgetHeadline,
            state: widget.state?.get(AppDataType.budgets),
            offset: width,
          ),
        ],
      );
    }
  }
}
