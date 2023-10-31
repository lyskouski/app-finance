// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/design/wrapper/tab_widget.dart';
import 'package:app_finance/pages/metrics/widgets/account_tab.dart';
import 'package:app_finance/pages/metrics/widgets/bill_tab.dart';
import 'package:app_finance/pages/metrics/widgets/budget_tab.dart';
import 'package:flutter/material.dart';

class MetricsPage extends StatefulWidget {
  final String? search;

  const MetricsPage({
    super.key,
    this.search,
  });

  @override
  MetricsPageState createState() => MetricsPageState();
}

class MetricsPageState extends AbstractPageState<MetricsPage> {
  late int index;

  @override
  void initState() {
    index = int.tryParse(widget.search ?? '') ?? 0;
    super.initState();
  }

  @override
  String getButtonName() => '';

  @override
  String? getHelperName() => switch (index) {
        0 => 'help_metrics_budget',
        1 => 'help_metrics_account',
        2 => 'help_metrics_bill',
        _ => null,
      };

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return ThemeHelper.emptyBox;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return TabWidget(
      focus: index,
      type: TabType.secondary,
      isLeft: ThemeHelper.isNavRight(context, constraints),
      callback: (idx) => setState(() => index = idx),
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
        AccountTab(store: super.state),
        BillTab(store: super.state),
      ],
    );
  }

  @override
  String getTitle() {
    return AppLocale.labels.metricsTooltip;
  }
}
