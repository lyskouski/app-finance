// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/string_ext.dart';
import 'package:app_finance/components/_core/component_data.dart';
import 'package:app_finance/pages/home/widgets/account_widget.dart';
import 'package:app_finance/pages/home/widgets/bill_widget.dart';
import 'package:app_finance/pages/home/widgets/budget_widget.dart';
import 'package:app_finance/design/form/list_selector.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/generic/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum ComponentRecentType {
  account,
  budget,
  bill,
  invoice,
  goals,
}

class ComponentRecent extends StatelessWidget {
  static const type = 'type';
  static const count = 'count';

  final ComponentData data;

  const ComponentRecent(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent(0.5);
    EdgeInsets margin = EdgeInsets.all(indent);
    ComponentRecentType? widgetType = data[type]?.toString().toEnum(ComponentRecentType.values);
    final limit = switch (data[count].runtimeType) {
      String => (data[count] as String).toInt(),
      double => (data[count] as double).toInt(),
      int => data[count],
      _ => 7,
    };
    return Consumer<AppData>(builder: (context, appState, _) {
      final exchange = Exchange(store: appState);
      return LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth - indent * 4;
        return Flex(
          direction: Axis.horizontal,
          children: [
            switch (widgetType) {
              ComponentRecentType.account => AccountWidget(
                  margin: margin,
                  title: '${AppLocale.labels.accountHeadline}, ${AppLocale.labels.total}',
                  state: appState.get(AppDataType.accounts),
                  limit: limit,
                  route: AppRoute.accountRoute,
                  tooltip: AppLocale.labels.accountTooltip,
                  width: width,
                )..exchange = exchange,
              ComponentRecentType.budget => BudgetWidget(
                  margin: margin,
                  title: '${AppLocale.labels.budgetHeadline}, ${AppLocale.labels.left}',
                  state: appState.get(AppDataType.budgets),
                  limit: limit,
                  route: AppRoute.budgetRoute,
                  tooltip: AppLocale.labels.budgetTooltip,
                  width: width,
                )..exchange = exchange,
              ComponentRecentType.bill => BillWidget(
                  margin: margin,
                  title: '${AppLocale.labels.billHeadline}, ${DateFormat.MMMM(AppLocale.code).format(DateTime.now())}',
                  state: appState.get(AppDataType.bills),
                  limit: limit,
                  route: AppRoute.billRoute,
                  tooltip: AppLocale.labels.billTooltip,
                  width: width,
                ),
              ComponentRecentType.goals => BaseWidget(
                  margin: margin,
                  title: AppLocale.labels.goalHeadline,
                  state: appState.get(AppDataType.goals),
                  limit: limit,
                  route: AppRoute.goalRoute,
                  routeList: AppRoute.goalViewRoute,
                  tooltip: AppLocale.labels.goalTooltip,
                  width: width,
                ),
              ComponentRecentType.invoice => BaseWidget(
                  margin: margin,
                  title: '${AppLocale.labels.invoiceHeadline} / ${AppLocale.labels.transferHeadline}',
                  state: appState.get(AppDataType.invoice),
                  limit: limit,
                  routeList: AppRoute.invoiceViewRoute,
                  route: null,
                  tooltip: AppLocale.labels.invoiceHeadline,
                  width: width,
                ),
              _ => ThemeHelper.emptyBox,
            },
          ],
        );
      });
    });
  }
}

class ComponentRecentForm extends StatefulWidget {
  final ComponentData data;
  final Function adjust;

  const ComponentRecentForm(this.data, {super.key, required this.adjust});

  @override
  ComponentRecentFormState createState() => ComponentRecentFormState();
}

class ComponentRecentFormState extends State<ComponentRecentForm> {
  final _controller = TextEditingController();
  late String? _option;

  @override
  initState() {
    super.initState();
    _controller.text = (widget.data[ComponentRecent.count] ?? 7).toString();
    _option = widget.data[ComponentRecent.type];
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.background,
      padding: EdgeInsets.only(left: ThemeHelper.getIndent(2), right: ThemeHelper.getIndent()),
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ThemeHelper.hIndent3x,
            ListSelector<ListSelectorItem>(
              setState: (value) {
                setState(() => _option = value?.id);
                widget.adjust(widget.data[componentData.order], {...widget.data, ComponentRecent.type: value?.id});
              },
              hintText: AppLocale.labels.cmpRecent,
              value: _option != null ? ListSelectorItem(id: _option!, name: '') : null,
              options: [
                ListSelectorItem(id: ComponentRecentType.account.toString(), name: AppLocale.labels.accountHeadline),
                ListSelectorItem(id: ComponentRecentType.bill.toString(), name: AppLocale.labels.billHeadline),
                ListSelectorItem(id: ComponentRecentType.budget.toString(), name: AppLocale.labels.budgetHeadline),
                ListSelectorItem(id: ComponentRecentType.goals.toString(), name: AppLocale.labels.goalHeadline),
                ListSelectorItem(id: ComponentRecentType.invoice.toString(), name: AppLocale.labels.invoiceHeadline),
              ],
            ),
            ThemeHelper.hIndent,
            SimpleInput(
              controller: _controller,
              type: TextInputType.number,
              formatter: [SimpleInputFormatter.filterInt],
              withLabel: true,
              setState: (String value) {
                widget.adjust(
                  widget.data[componentData.order],
                  {...widget.data, ComponentRecent.count: value.isEmpty ? '0' : value},
                );
              },
              tooltip: AppLocale.labels.cmpRecentCount,
            ),
            ThemeHelper.hIndent,
          ],
        ),
      ),
    );
  }
}
