// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';

import 'package:app_finance/_classes/controller/iterator_controller.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/flow_state_machine.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/history_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/budget/widgets/budget_header_widget.dart';
import 'package:app_finance/design/generic/base_line_widget.dart';
import 'package:app_finance/design/generic/base_list_infinite_widget.dart';
import 'package:app_finance/design/wrapper/confirmation_wrapper.dart';
import 'package:app_finance/design/wrapper/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:intl/intl.dart';

class BudgetViewPage extends StatefulWidget {
  final String uuid;

  const BudgetViewPage({
    super.key,
    required this.uuid,
  });

  @override
  BudgetViewPageState createState() => BudgetViewPageState();
}

class BudgetViewPageState extends AbstractPageState<BudgetViewPage> with TickerProviderStateMixin {
  late double width;
  int focus = 0;

  @override
  String getTitle() {
    final item = super.state.getByUuid(widget.uuid) as BudgetAppData;
    return item.title;
  }

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    double indent = ThemeHelper.getIndent(4);
    NavigatorState nav = Navigator.of(context);
    return Container(
      margin: EdgeInsets.only(left: 2 * indent, right: 2 * indent),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        FloatingActionButton(
          heroTag: 'budget_view_page_edit',
          onPressed: () => nav.pushNamed(AppRoute.budgetEditRoute, arguments: {routeArguments.uuid: widget.uuid}),
          tooltip: AppLocale.labels.editBudgetTooltip,
          child: const Icon(Icons.edit),
        ),
        FloatingActionButton(
          heroTag: 'budget_view_page_deactivate',
          onPressed: () => ConfirmationWrapper.show(
            context,
            () => FlowStateMachine.deactivate(nav, store: super.state, uuid: widget.uuid),
          ),
          tooltip: AppLocale.labels.deleteBudgetTooltip,
          child: const Icon(Icons.delete),
        ),
      ]),
    );
  }

  Widget buildListWidget(item, BuildContext context) {
    final value = (item.delta as double).toCurrency(currency: item.currency, withPattern: false);
    return BaseLineWidget(
      uuid: '',
      title: '',
      description: (item.timestamp as DateTime).yMEd(),
      progress: 1.0,
      details: item.delta > 0 ? '+$value' : value,
      color: Colors.transparent,
      width: width,
    );
  }

  Widget buildLineWidget(item, BuildContext context) {
    return BaseLineWidget(
      uuid: item.uuid ?? '',
      title: item.title ?? '',
      description: item.description ?? '',
      details: item.detailsFormatted,
      progress: item.progress,
      color: item.color ?? Colors.transparent,
      icon: item.icon ?? Icons.radio_button_unchecked_sharp,
      hidden: item.hidden,
      width: width,
      route: AppRoute.billViewRoute,
    );
  }

  InterfaceIterator<num, dynamic, dynamic> _getSummary() {
    var exchange = Exchange(store: state);
    var category = super.state.getByUuid(widget.uuid) as BudgetAppData;
    var bills = state.getStream(AppDataType.bills, filter: (o) => o.category != widget.uuid);
    DateTime now = DateTime.now();
    DateTime curr = DateTime(now.year, now.month, 1);
    int iteration = 0;
    BillAppData? item;
    AccountAppData summary = AccountAppData(
      type: AppAccountType.cash.toString(),
      title: DateFormat.MMMM().format(curr),
      description: curr.year.toString(),
      currency: category.currency,
      progress: 1,
    );
    var data = SplayTreeMap<num, AccountAppData>();
    while (true) {
      item = bills.next;
      if (item == null || item.createdAt.isBefore(curr)) {
        if (category.amountLimit < summary.details) {
          summary.color = Colors.red;
        }
        data[iteration] = summary.clone();
        if (item == null) {
          break;
        }
        iteration++;
        curr = DateTime(now.year, now.month - iteration, 1);
        summary.details = 0.0;
        summary.color = null;
        summary.title = DateFormat.MMMM().format(curr);
        summary.description = curr.year.toString();
      }
      summary.details = summary.details + exchange.reform(item.details ?? 0.0, item.currency, summary.currency);
    }
    return IteratorController(data, transform: (v) => v);
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final indent = ThemeHelper.getIndent();
    final pageWidth = ThemeHelper.getWidth(context, 3, constraints);
    width = pageWidth - indent;
    bool isLeft = ThemeHelper.isNavRight(context, constraints);
    if (isLeft) {
      width -= ThemeHelper.barHeight;
    }
    final boundary = DateTime(DateTime.now().year, DateTime.now().month).millisecondsSinceEpoch + 0.0;
    return Padding(
      padding: EdgeInsets.only(top: indent),
      child: Column(
        children: [
          BudgetHeaderWidget(item: state.getByUuid(widget.uuid) as BudgetAppData, width: pageWidth),
          ThemeHelper.hIndent05,
          const Divider(height: 2),
          Expanded(
            child: TabWidget(
              type: TabType.secondary,
              isLeft: isLeft,
              focus: focus,
              callback: (data) => setState(() => focus = data),
              tabs: [
                Tab(text: AppLocale.labels.billHeadline),
                Tab(text: AppLocale.labels.summary),
                Tab(text: AppLocale.labels.budgetLimitHeadline),
              ],
              children: [
                BaseListInfiniteWidget(
                  stream:
                      state.getStream(AppDataType.bills, boundary: boundary, filter: (o) => o.category != widget.uuid),
                  width: width,
                  buildListWidget: buildLineWidget,
                ),
                BaseListInfiniteWidget(
                  stream: _getSummary(),
                  width: width,
                  buildListWidget: buildLineWidget,
                ),
                BaseListInfiniteWidget(
                  stream: HistoryData.getStream(widget.uuid),
                  width: width,
                  buildListWidget: buildListWidget,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
