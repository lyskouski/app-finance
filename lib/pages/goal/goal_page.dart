// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/gauge_chart.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
import 'package:app_finance/pages/budget/widgets/budget_line_widget.dart';
import 'package:app_finance/widgets/wrapper/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({super.key});

  @override
  GoalPageState createState() => GoalPageState();
}

class GoalPageState extends AbstractPageState<GoalPage> {
  @override
  String getTitle() {
    return AppLocale.labels.goalHeadline;
  }

  @override
  String getButtonName() => AppLocale.labels.addGoalTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'goal_view_page',
      onPressed: () => nav.pushNamed(AppRoute.goalAddRoute),
      tooltip: getButtonName(),
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
    final goals = super.state.getList(AppDataType.goals);
    final maxValue = _getMaxValue(goals.cast<GoalAppData>());
    final valInvoice = _getValue(AppDataType.invoice);
    final valBill = _getValue(AppDataType.bills);
    final value = valInvoice - valBill;
    final textStyle = context.textTheme.numberSmall;

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
                  TextWrapper(AppLocale.labels.goalProfitTooltip, style: context.textTheme.bodyLarge),
                  TextWrapper(
                    AppLocale.labels.goalProfit(maxValue.toCurrency(withPattern: false)),
                    style: textStyle,
                    maxLines: 2,
                  ),
                  TextWrapper(
                    AppLocale.labels.invoiceSum(valInvoice.toCurrency(withPattern: false)),
                    style: textStyle,
                    maxLines: 2,
                  ),
                  TextWrapper(
                    AppLocale.labels.billSum(valBill.toCurrency(withPattern: false)),
                    style: textStyle,
                    maxLines: 2,
                  ),
                  TextWrapper(
                    AppLocale.labels.netProfit(value.toCurrency(withPattern: false)),
                    style: textStyle,
                    maxLines: 2,
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
                details: (goal.details as double).toCurrency(currency: goal.currency, withPattern: false),
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
