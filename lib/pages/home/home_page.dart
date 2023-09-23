// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/responsive_matrix.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/components/components_builder.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/pages/home/home_edit_page.dart';
import 'package:app_finance/pages/start/start_page.dart';
import 'package:app_finance/widgets/wrapper/grid_layer.dart';
import 'package:app_finance/pages/home/widgets/init_tab.dart';
import 'package:app_finance/widgets/wrapper/toolbar_button_widget.dart';
import 'package:app_finance/pages/home/widgets/account_widget.dart';
import 'package:app_finance/pages/home/widgets/bill_widget.dart';
import 'package:app_finance/pages/home/widgets/budget_widget.dart';
import 'package:app_finance/pages/home/widgets/goal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends AbstractPageState<HomePage> {
  String? toExpand;
  bool isEditMode = false;

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
  Widget? getBarLeading(NavigatorState nav) {
    return Builder(
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
    );
  }

  @override
  List<Widget> getBarActions(NavigatorState nav) {
    return [
      ToolbarButtonWidget(
        child: IconButton(
          icon: const Icon(
            Icons.app_registration_outlined,
            color: Colors.white70,
          ),
          tooltip: AppLocale.labels.customizeTooltip,
          onPressed: () => setState(() => isEditMode = true),
        ),
      ),
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
    ];
  }

  @override
  Widget getBarTitle(BuildContext context, [bool isBottom = false]) {
    return SvgPicture.asset(
      'assets/images/fingrom.svg',
      height: isBottom ? 20 : 40,
      alignment: Alignment.centerLeft,
      semanticsLabel: AppLocale.labels.appTitle,
    );
  }

  @override
  String getButtonName() => AppLocale.labels.addMainTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'home_page',
      onPressed: () => nav.pushNamed(AppRoute.billAddRoute),
      tooltip: getButtonName(),
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AppLocale>(context, listen: false).updateState(context);
    if (isEditMode) {
      return HomeEditPage(callback: () => setState(() => isEditMode = false));
    }
    if (AppPreferences.get(AppPreferences.prefPrivacyPolicy) == null) {
      return const StartPage();
    }
    return Consumer<AppData>(builder: (context, appState, _) {
      state = appState;
      if (appState.isLoading) {
        return const InitTab();
      }
      return super.build(context);
    });
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final data = ComponentsBuilder.getData(context);
    if (data != null) {
      return ComponentsBuilder(data, false);
    }
    double indent = ThemeHelper.getIndent();
    EdgeInsets margin = EdgeInsets.only(top: indent);
    final matrix = ResponsiveMatrix(getWindowType(context));
    final countWidth = matrix.getWidthCount(constraints);
    bool isVertical = countWidth == 1;
    double width = ThemeHelper.getWidth(context, 3);
    double partWidth = width / countWidth - indent * (countWidth - 1);

    final billWidget = BillWidget(
      margin: margin,
      title: '${AppLocale.labels.billHeadline}, ${DateFormat.MMMM(AppLocale.code).format(DateTime.now())}',
      state: super.state.get(AppDataType.bills),
      limit: 7,
      route: AppRoute.billRoute,
      tooltip: AppLocale.labels.billTooltip,
      width: isVertical ? width : partWidth,
      hasExpand: isVertical,
      toExpand: toExpand,
      callback: (v) => setState(() => toExpand = v),
    );
    final accountWidget = AccountWidget(
      margin: margin,
      title: '${AppLocale.labels.accountHeadline}, ${AppLocale.labels.total}',
      state: super.state.get(AppDataType.accounts),
      limit: 7,
      route: AppRoute.accountRoute,
      tooltip: AppLocale.labels.accountTooltip,
      width: isVertical ? width : partWidth,
      hasExpand: isVertical,
      toExpand: toExpand,
      callback: (v) => setState(() => toExpand = v),
    )..exchange = Exchange(store: super.state);
    final budgetWidget = BudgetWidget(
      margin: margin,
      title: '${AppLocale.labels.budgetHeadline}, ${AppLocale.labels.left}',
      state: super.state.get(AppDataType.budgets),
      limit: 7,
      route: AppRoute.budgetRoute,
      tooltip: AppLocale.labels.budgetTooltip,
      width: isVertical ? width : partWidth,
      hasExpand: isVertical,
      toExpand: toExpand,
      callback: (v) => setState(() => toExpand = v),
    )..exchange = Exchange(store: super.state);

    return GridLayer(
      padding: indent,
      crossAxisCount: countWidth,
      strategy: switch (countWidth) {
        4 => [
            [2],
            [3],
            [1],
            [0]
          ],
        3 => [
            [2],
            [3],
            [0, 1]
          ],
        2 => [
            [2, 3],
            [0, 1]
          ],
        _ => [
            [0, 1, 2, 3]
          ]
      },
      children: [
        matrix.getHeightCount(constraints) > 3
            ? GoalWidget(
                margin: EdgeInsets.zero,
                width: isVertical ? width : partWidth,
                state: super.state.getList(AppDataType.goals),
              )
            : ThemeHelper.emptyBox,
        billWidget,
        accountWidget,
        budgetWidget,
      ],
    );
  }
}
