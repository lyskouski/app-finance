// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_mixins/formatter_mixin.dart';
import 'package:app_finance/charts/gauge_chart.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/budget/budget_line_widget.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:flutter/material.dart';

class GoalPage extends AbstractPage {
  GoalPage() : super();

  @override
  GoalPageState createState() => GoalPageState();
}

class GoalPageState extends AbstractPageState<GoalPage> with FormatterMixin {
  @override
  String getTitle() {
    return AppLocale.labels.goalHeadline;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'goal_view_page',
      onPressed: () => nav.pushNamed(AppRoute.goalAddRoute),
      tooltip: AppLocale.labels.addGoalTooltip,
      child: const Icon(Icons.add),
    );
  }

  double _getMaxValue(List<GoalAppData> goals) {
    final exchange = Exchange(store: super.state);
    final now = DateTime.now();
    return goals.fold(0.0, (prev, e) {
      double left = e.closedAt.difference(now).inDays / 30;
      if (left < 1) {
        left = 1;
      }
      double value = (1 - e.progress) * exchange.reform(e.details, e.currency, Exchange.defaultCurrency);
      return prev + value / left;
    });
  }

  double _getValue(AppDataType type) {
    final exchange = Exchange(store: super.state);
    return super
        .state
        .getActualList(type)
        .fold(0.0, (prev, e) => prev + exchange.reform(e.details, e.currency, Exchange.defaultCurrency));
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final indent = ThemeHelper.getIndent();
    final width = ThemeHelper.getWidth(context, 4);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final goals = super.state.getList(AppDataType.goals);
    final maxValue = _getMaxValue(goals.cast<GoalAppData>());
    final valInvoice = _getValue(AppDataType.invoice);
    final valBill = _getValue(AppDataType.bills);
    final value = valInvoice - valBill;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(ThemeHelper.getIndent()),
        child: Column(
          children: [
            ThemeHelper.hIndent,
            RowWidget(
              alignment: MainAxisAlignment.start,
              indent: indent,
              maxWidth: width,
              chunk: const [null, null],
              children: [
                [
                  Text(
                    AppLocale.labels.goalProfitTooltip,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    AppLocale.labels.goalProfit(getNumberFormatted(maxValue, Exchange.defaultCurrency?.symbol)),
                    style: Theme.of(context).textTheme.numberSmall.copyWith(color: textTheme.headlineSmall?.color),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    AppLocale.labels.invoiceSum(getNumberFormatted(valInvoice, Exchange.defaultCurrency?.symbol)),
                    style: Theme.of(context).textTheme.numberSmall.copyWith(color: textTheme.headlineSmall?.color),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    AppLocale.labels.billSum(getNumberFormatted(valBill, Exchange.defaultCurrency?.symbol)),
                    style: Theme.of(context).textTheme.numberSmall.copyWith(color: textTheme.headlineSmall?.color),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    AppLocale.labels.netProfit(getNumberFormatted(value, Exchange.defaultCurrency?.symbol)),
                    style: Theme.of(context).textTheme.numberSmall.copyWith(color: textTheme.headlineSmall?.color),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ThemeHelper.hIndent,
                ],
                [
                  GaugeChart(
                    value: value,
                    valueMin: maxValue,
                    valueMax: maxValue,
                    width: width > 200 ? 200 : width,
                    height: 100,
                  ),
                ]
              ],
            ),
            ThemeHelper.hIndent,
            const Divider(),
            ...goals.map((goal) {
              return BudgetLineWidget(
                title: goal.title ?? '',
                width: width,
                uuid: goal.uuid,
                details: goal.getNumberFormatted(goal.details),
                description: AppLocale.labels.goalProfit(goal.closedAtFormatted),
                color: goal.color ?? Colors.green.shade700,
                icon: goal.icon ?? Icons.star,
                hidden: goal.hidden,
                progress: goal.progress,
                route: AppRoute.goalViewRoute,
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
