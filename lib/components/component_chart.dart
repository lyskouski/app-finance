// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/components/component_account_flow.dart';
import 'package:app_finance/components/component_account_health.dart';
import 'package:app_finance/components/component_bill_ytd.dart';
import 'package:app_finance/components/component_budget_forecast.dart';
import 'package:app_finance/components/component_budget_ytd.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/string_ext.dart';
import 'package:app_finance/components/_core/component_data.dart';
import 'package:app_finance/design/form/list_selector.dart';
import 'package:flutter/material.dart';

enum ComponentChartType {
  accountFlow,
  accountHealth,
  billYtd,
  budgetForecast,
  budgetYtd,
}

class ComponentChart extends StatelessWidget {
  static const type = 'type';

  final ComponentData data;

  const ComponentChart(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    ComponentChartType? widgetType = data[type]?.toString().toEnum(ComponentChartType.values);
    return Container(
      padding: EdgeInsets.all(ThemeHelper.getIndent()),
      child: switch (widgetType) {
        ComponentChartType.accountFlow => const ComponentAccountFlow(),
        ComponentChartType.accountHealth => const ComponentAccountHealth(),
        ComponentChartType.billYtd => const ComponentBillYtd(),
        ComponentChartType.budgetForecast => const ComponentBudgetForecast(),
        ComponentChartType.budgetYtd => const ComponentBudgetYtd(),
        _ => ThemeHelper.emptyBox,
      },
    );
  }
}

class ComponentChartForm extends StatefulWidget {
  final ComponentData data;
  final Function adjust;

  const ComponentChartForm(this.data, {super.key, required this.adjust});

  @override
  ComponentChartFormState createState() => ComponentChartFormState();
}

class ComponentChartFormState extends State<ComponentChartForm> {
  late String? _option;

  @override
  initState() {
    super.initState();
    _option = widget.data[ComponentChart.type];
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      padding: EdgeInsets.only(left: ThemeHelper.getIndent(2), right: ThemeHelper.getIndent()),
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ThemeHelper.hIndent3x,
            ListSelector<ListSelectorItem>(
              setState: (value) {
                setState(() => _option = value?.id);
                widget.adjust(widget.data[componentData.order], {...widget.data, ComponentChart.type: value?.id});
              },
              hintText: AppLocale.labels.cmpChart,
              value: _option != null ? ListSelectorItem(id: _option!, name: '') : null,
              options: [
                ListSelectorItem(id: ComponentChartType.accountFlow.toString(), name: AppLocale.labels.chartOHLC),
                ListSelectorItem(id: ComponentChartType.accountHealth.toString(), name: AppLocale.labels.incomeHealth),
                ListSelectorItem(id: ComponentChartType.billYtd.toString(), name: AppLocale.labels.chartYtdExpense),
                ListSelectorItem(
                    id: ComponentChartType.budgetForecast.toString(), name: AppLocale.labels.chartForecast),
                ListSelectorItem(id: ComponentChartType.budgetYtd.toString(), name: AppLocale.labels.budgetHeadline),
              ],
            ),
            ThemeHelper.hIndent,
          ],
        ),
      ),
    );
  }
}
