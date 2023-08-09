// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_classes/data/exchange.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/home/init_page.dart';
import 'package:app_finance/widgets/_wrappers/toolbar_button_widget.dart';
import 'package:app_finance/widgets/home/account_widget.dart';
import 'package:app_finance/widgets/home/bill_widget.dart';
import 'package:app_finance/widgets/home/budget_widget.dart';
import 'package:app_finance/widgets/home/goal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends AbstractPage {
  HomePage() : super();

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends AbstractPageState<HomePage> with SharedPreferencesMixin {
  String? toExpand;

  @override
  initState() {
    super.initState();
    toExpand = getPreference(prefExpand);
    if (getPreference(prefPrivacyPolicy) == null) {
      Future.delayed(Duration.zero, () => Navigator.popAndPushNamed(context, AppRoute.startRoute));
    }
  }

  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.appTitle;
  }

  @override
  AppBar buildBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: 40,
      leading: Builder(
        builder: (BuildContext context) {
          return ToolbarButtonWidget(
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
              ),
              tooltip: AppLocalizations.of(context)!.navigationTooltip,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
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
        ToolbarButtonWidget(
          child: IconButton(
            icon: Icon(
              Icons.switch_access_shortcut_add_outlined,
              color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
            ),
            tooltip: AppLocalizations.of(context)!.subscriptionTooltip,
            onPressed: () => Navigator.pushNamed(context, AppRoute.subscriptionRoute),
          ),
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
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (context, appState, _) {
      state = appState;
      if (appState.isLoading) {
        return InitPage();
      }
      return super.build(context);
    });
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
    bool isVertical = helper.isVertical(constraints);

    final goalWidget = GoalWidget(
      margin: EdgeInsets.fromLTRB(indent, 0, indent, 0),
      state: super.state.getList(AppDataType.goals),
    );
    final billWidget = BillWidget(
      margin: helper.isVertical(constraints) ? single : middleRight,
      title: '${AppLocalizations.of(context)!.billHeadline}, ${formatterDate.format(DateTime.now())}',
      state: super.state.get(AppDataType.bills),
      limit: 5,
      route: AppRoute.billRoute,
      tooltip: AppLocalizations.of(context)!.billTooltip,
      offset: helper.isVertical(constraints) ? width : halfWidth,
      hasExpand: isVertical,
      toExpand: toExpand,
      callback: (v) => setState(() => toExpand = v),
    );
    final accountWidget = AccountWidget(
      margin: helper.isVertical(constraints) ? single : middleLeft,
      title: '${AppLocalizations.of(context)!.accountHeadline}, ${AppLocalizations.of(context)!.total}',
      state: super.state.get(AppDataType.accounts),
      limit: 5,
      route: AppRoute.accountRoute,
      tooltip: AppLocalizations.of(context)!.accountTooltip,
      offset: helper.isVertical(constraints) ? width : halfWidth,
      hasExpand: isVertical,
      toExpand: toExpand,
      callback: (v) => setState(() => toExpand = v),
    )..exchange = Exchange(store: super.state);
    final budgetWidget = BudgetWidget(
      margin: bottom,
      title: '${AppLocalizations.of(context)!.budgetHeadline}, ${AppLocalizations.of(context)!.left}',
      state: super.state.get(AppDataType.budgets),
      limit: 5,
      route: AppRoute.budgetRoute,
      tooltip: AppLocalizations.of(context)!.budgetTooltip,
      offset: width,
      hasExpand: isVertical,
      toExpand: toExpand,
      callback: (v) => setState(() => toExpand = v),
    )..exchange = Exchange(store: super.state);

    if (isVertical) {
      return Column(
        children: [
          goalWidget,
          billWidget,
          accountWidget,
          budgetWidget,
        ],
      );
    } else {
      return Column(
        children: [
          goalWidget,
          Expanded(
            child: Row(
              children: [
                accountWidget,
                billWidget,
              ],
            ),
          ),
          budgetWidget,
        ],
      );
    }
  }
}
