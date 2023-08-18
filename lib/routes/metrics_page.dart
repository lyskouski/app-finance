// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_wrappers/tab_widget.dart';
import 'package:app_finance/widgets/metrics/budget_tab.dart';
import 'package:flutter/material.dart';

class MetricsPage extends AbstractPage {
  MetricsPage() : super();

  @override
  MetricsPageState createState() => MetricsPageState();
}

class MetricsPageState extends AbstractPageState<MetricsPage> {
  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return const SizedBox();
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return TabWidget(
      focus: 0,
      tabs: [
        Tab(
          icon: const Icon(Icons.graphic_eq),
          text: AppLocale.labels.budgetHeadline,
        ),
        Tab(
          icon: const Icon(Icons.incomplete_circle),
          text: AppLocale.labels.accountHeadline,
        ),
        Tab(
          icon: const Icon(Icons.bar_chart),
          text: AppLocale.labels.billHeadline,
        ),
      ],
      children: [
        BudgetTab(store: super.state),
        const SizedBox(),
        const SizedBox(),
      ],
    );
  }

  @override
  String getTitle() {
    return AppLocale.labels.metricsTooltip;
  }
}
