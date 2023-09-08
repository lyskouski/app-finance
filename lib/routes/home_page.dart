// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/init/init_tab.dart';
import 'package:app_finance/widgets/_wrappers/toolbar_button_widget.dart';
import 'package:app_finance/widgets/home/account_widget.dart';
import 'package:app_finance/widgets/home/bill_widget.dart';
import 'package:app_finance/widgets/home/budget_widget.dart';
import 'package:app_finance/widgets/home/goal_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends AbstractPage {
  HomePage() : super();

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends AbstractPageState<HomePage> {
  String? toExpand;

  @override
  initState() {
    super.initState();
    toExpand = AppPreferences.get(AppPreferences.prefExpand);
  }

  @override
  String getTitle() {
    return AppLocale.labels.appTitle;
  }

  @override
  AppBar buildBar(BuildContext context) {
    NavigatorState nav = Navigator.of(context);
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: 40,
      leading: Builder(
        builder: (BuildContext context) {
          return ToolbarButtonWidget(
            child: IconButton(
              hoverColor: Colors.transparent,
              icon: const Icon(
                Icons.menu,
                color: Colors.white70,
              ),
              tooltip: AppLocale.labels.navigationTooltip,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          );
        },
      ),
      title: Center(
        child: Image.asset('assets/images/fingrom.png'),
      ),
      actions: [
        ToolbarButtonWidget(
          child: IconButton(
            icon: const Icon(
              Icons.switch_access_shortcut_add_outlined,
              color: Colors.white70,
            ),
            tooltip: AppLocale.labels.subscriptionTooltip,
            onPressed: () => nav.pushNamed(AppRoute.subscriptionRoute),
          ),
        ),
      ],
    );
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'home_page',
      onPressed: () => nav.pushNamed(AppRoute.billAddRoute),
      tooltip: AppLocale.labels.addMainTooltip,
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    NavigatorState nav = Navigator.of(context);
    if (AppPreferences.get(AppPreferences.prefPrivacyPolicy) == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => nav.popAndPushNamed(AppRoute.startRoute));
    }
    Provider.of<AppLocale>(context, listen: false).updateState(context);
    return Consumer<AppData>(builder: (context, appState, _) {
      state = appState;
      if (appState.isLoading) {
        return InitTab();
      }
      return super.build(context);
    });
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    double indent = ThemeHelper.getIndent();
    EdgeInsets single = EdgeInsets.fromLTRB(indent, indent, indent, 0);
    EdgeInsets middleLeft = EdgeInsets.fromLTRB(indent, indent, 0, 0);
    EdgeInsets middleRight = EdgeInsets.fromLTRB(indent, indent, indent, 0);
    EdgeInsets bottom = EdgeInsets.fromLTRB(indent, indent, indent, indent);
    double width = ThemeHelper.getWidth(context, 3);
    double halfWidth = width / 2;
    final DateFormat formatterDate = DateFormat.MMMM(AppLocale.code);
    bool isVertical = ThemeHelper.isVertical(constraints);

    final goalWidget = GoalWidget(
      margin: EdgeInsets.fromLTRB(indent, 0, indent, 0),
      state: super.state.getList(AppDataType.goals),
    );
    final billWidget = BillWidget(
      margin: ThemeHelper.isVertical(constraints) ? single : middleRight,
      title: '${AppLocale.labels.billHeadline}, ${formatterDate.format(DateTime.now())}',
      state: super.state.get(AppDataType.bills),
      limit: 7,
      route: AppRoute.billRoute,
      tooltip: AppLocale.labels.billTooltip,
      width: ThemeHelper.isVertical(constraints) ? width : halfWidth - indent,
      hasExpand: isVertical,
      toExpand: toExpand,
      callback: (v) => setState(() => toExpand = v),
    );
    final accountWidget = AccountWidget(
      margin: ThemeHelper.isVertical(constraints) ? single : middleLeft,
      title: '${AppLocale.labels.accountHeadline}, ${AppLocale.labels.total}',
      state: super.state.get(AppDataType.accounts),
      limit: 7,
      route: AppRoute.accountRoute,
      tooltip: AppLocale.labels.accountTooltip,
      width: ThemeHelper.isVertical(constraints) ? width : halfWidth - indent,
      hasExpand: isVertical,
      toExpand: toExpand,
      callback: (v) => setState(() => toExpand = v),
    )..exchange = Exchange(store: super.state);
    final budgetWidget = BudgetWidget(
      margin: bottom,
      title: '${AppLocale.labels.budgetHeadline}, ${AppLocale.labels.left}',
      state: super.state.get(AppDataType.budgets),
      limit: 7,
      route: AppRoute.budgetRoute,
      tooltip: AppLocale.labels.budgetTooltip,
      width: ThemeHelper.isVertical(constraints) ? width : width + indent / 2,
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
