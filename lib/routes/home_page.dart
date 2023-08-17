// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_classes/app_locale.dart';
import 'package:app_finance/_classes/currency/exchange.dart';
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
      WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.popAndPushNamed(context, AppRoute.startRoute));
    }
  }

  @override
  String getTitle(context) {
    return AppLocale.labels.appTitle;
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
            onPressed: () => Navigator.pushNamed(context, AppRoute.subscriptionRoute),
          ),
        ),
      ],
    );
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return FloatingActionButton(
      heroTag: 'home_page',
      onPressed: () => Navigator.pushNamed(context, AppRoute.billAddRoute),
      tooltip: AppLocale.labels.addMainTooltip,
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AppLocale>(context, listen: false).updateState(context);
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
      title: '${AppLocale.labels.billHeadline}, ${formatterDate.format(DateTime.now())}',
      state: super.state.get(AppDataType.bills),
      limit: 5,
      route: AppRoute.billRoute,
      tooltip: AppLocale.labels.billTooltip,
      offset: helper.isVertical(constraints) ? width : halfWidth,
      hasExpand: isVertical,
      toExpand: toExpand,
      callback: (v) => setState(() => toExpand = v),
    );
    final accountWidget = AccountWidget(
      margin: helper.isVertical(constraints) ? single : middleLeft,
      title: '${AppLocale.labels.accountHeadline}, ${AppLocale.labels.total}',
      state: super.state.get(AppDataType.accounts),
      limit: 5,
      route: AppRoute.accountRoute,
      tooltip: AppLocale.labels.accountTooltip,
      offset: helper.isVertical(constraints) ? width : halfWidth,
      hasExpand: isVertical,
      toExpand: toExpand,
      callback: (v) => setState(() => toExpand = v),
    )..exchange = Exchange(store: super.state);
    final budgetWidget = BudgetWidget(
      margin: bottom,
      title: '${AppLocale.labels.budgetHeadline}, ${AppLocale.labels.left}',
      state: super.state.get(AppDataType.budgets),
      limit: 5,
      route: AppRoute.budgetRoute,
      tooltip: AppLocale.labels.budgetTooltip,
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
