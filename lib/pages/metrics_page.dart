// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/widgets/_wrappers/tab_widget.dart';
import 'package:app_finance/widgets/metrics/account_tab.dart';
import 'package:app_finance/widgets/metrics/bill_tab.dart';
import 'package:app_finance/widgets/metrics/budget_tab.dart';
import 'package:flutter/material.dart';

class MetricsPage extends StatefulWidget {
  final String search;
  const MetricsPage({
    super.key,
    this.search = '0',
  });

  @override
  MetricsPageState createState() => MetricsPageState();
}

class MetricsPageState extends AbstractPageState<MetricsPage> {
  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return ThemeHelper.emptyBox;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return TabWidget(
      focus: int.tryParse(widget.search) ?? 0,
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
