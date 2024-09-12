// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/design_type.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/design/generic/base_header_widget.dart';
import 'package:app_finance/design/generic/base_swipe_widget.dart';
import 'package:app_finance/design/wrapper/background_wrapper.dart';
import 'package:app_finance/design/wrapper/tap_widget.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/budget/widgets/budget_line_widget.dart';
import 'package:app_finance/pages/budget/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:provider/provider.dart';

class BudgetPage extends StatefulWidget {
  final String? search;
  const BudgetPage({
    super.key,
    this.search,
  });

  @override
  BudgetPageState createState() => BudgetPageState();
}

class BudgetPageState extends AbstractPageState<BudgetPage> {
  AppDataGetter _getItems() {
    if (widget.search != null) {
      final scope =
          state.getList(AppDataType.budgets).where((e) => e.title.toString().startsWith(widget.search!)).toList();
      final ex = Exchange(store: super.state);
      return (
        total: scope.fold(0.0, (v, e) => v + ex.reform(e.details, e.currency, ex.getDefaultCurrency())),
        list: scope,
        stream: state.getStream(AppDataType.budgets, filter: (e) => !e.title.toString().startsWith(widget.search!)),
      );
    }
    return state.get(AppDataType.budgets);
  }

  @override
  String getTitle() {
    if (widget.search != null) {
      return AppLocale.labels.search(widget.search!);
    }
    return AppLocale.labels.budgetHeadline;
  }

  @override
  String getButtonName() => AppLocale.labels.addBudgetTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'budget_page',
      onPressed: () => nav.pushNamed(AppRoute.budgetAddRoute),
      tooltip: getButtonName(),
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final items = _getItems();
    final design = Provider.of<AppDesign>(context, listen: false);
    if (design.value == AppDesignType.germany) {
      items.list.sort((a, b) => a.title.compareTo(b.title));
    }
    final width = ThemeHelper.getWidth(context, 4, constraints);
    final indent = ThemeHelper.getIndent();
    final widthCount = ThemeHelper.getWidthCount(constraints, context);
    return Padding(
      padding: EdgeInsets.all(indent),
      child: Column(
        children: [
          BaseHeaderWidget(
            route: AppRoute.homeRoute,
            tooltip: AppLocale.labels.homeTooltip,
            width: width,
            total: items.total,
            title: '${AppLocale.labels.budgetHeadline}, ${AppLocale.labels.left}',
          ),
          ThemeHelper.hIndent,
          if (widthCount > 2) HeaderWidget(count: widthCount, width: width),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: items.list.length + 1,
              itemBuilder: (BuildContext context, index) {
                if (index >= items.list.length) {
                  return ThemeHelper.formEndBox;
                }
                BudgetAppData item = items.list[index];
                return BackgroundWrapper(
                  index: index,
                  child: BaseSwipeWidget(
                    routePath: AppRoute.budgetEditRoute,
                    uuid: item.uuid!,
                    child: TapWidget(
                      tooltip: '',
                      route: RouteSettings(name: AppRoute.budgetViewRoute, arguments: {routeArguments.uuid: item.uuid}),
                      child: BudgetLineWidget(
                        width: width,
                        count: widthCount,
                        uuid: item.uuid ?? '',
                        title: item.title,
                        amount: item.amount.toCurrency(currency: item.currency, withPattern: false),
                        details: item.detailsFormatted,
                        description: item.description,
                        color: item.color ?? Colors.transparent,
                        icon: item.icon ?? Icons.question_mark,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
