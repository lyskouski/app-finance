// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';

import 'package:app_finance/_classes/controller/iterator_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/flow_state_machine.dart';
import 'package:app_finance/_classes/herald/app_start_of_month.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/account_summary_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/account/widgets/account_line_widget.dart';
import 'package:app_finance/design/generic/base_line_widget.dart';
import 'package:app_finance/design/generic/base_list_infinite_widget.dart';
import 'package:app_finance/design/wrapper/confirmation_wrapper.dart';
import 'package:app_finance/design/wrapper/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:intl/intl.dart' as intl;

class AccountViewPage extends StatefulWidget {
  final String uuid;

  const AccountViewPage({
    super.key,
    required this.uuid,
  });

  @override
  AccountViewPageState createState() => AccountViewPageState();
}

class AccountViewPageState extends AbstractPageState<AccountViewPage> {
  late double width;
  int focus = 0;

  @override
  String getTitle() {
    final item = super.state.getByUuid(widget.uuid) as AccountAppData;
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
          heroTag: 'account_view_page_edit',
          onPressed: () => nav.pushNamed(AppRoute.accountEditRoute, arguments: {routeArguments.uuid: widget.uuid}),
          tooltip: AppLocale.labels.editAccountTooltip,
          child: const Icon(Icons.edit),
        ),
        FloatingActionButton(
          heroTag: 'account_view_page_deactivate',
          onPressed: () => ConfirmationWrapper.show(
            context,
            () => FlowStateMachine.deactivate(nav, store: super.state, uuid: widget.uuid),
          ),
          tooltip: AppLocale.labels.deleteAccountTooltip,
          child: const Icon(Icons.delete),
        ),
      ]),
    );
  }

  String _getTitle(dynamic item) {
    String prefix = '';
    if (item is InvoiceAppData && item.accountFrom != null) {
      if (item.accountFrom == widget.uuid) {
        final obj = state.getByUuid(item.account) as AccountAppData;
        prefix = "[${AppLocale.labels.transferHeadline} ${AppLocale.labels.to} '${obj.title}'] ";
      } else {
        final obj = state.getByUuid(item.accountFrom!) as AccountAppData;
        prefix = "[${AppLocale.labels.transferHeadline} ${AppLocale.labels.from} '${obj.title}'] ";
      }
    }
    return item != null ? '$prefix${item.title}' : '';
  }

  String _getRoute(dynamic item) => switch (item.runtimeType) {
        BillAppData => AppRoute.billViewRoute,
        InvoiceAppData => AppRoute.invoiceViewRoute,
        _ => '',
      };

  InterfaceIterator<num, dynamic, dynamic> _getSummary() {
    var exchange = Exchange(store: state);
    var account = super.state.getByUuid(widget.uuid) as AccountAppData;
    var bills = state.getStream(AppDataType.bills, filter: (o) => o.account != widget.uuid);
    var inv = state.getStream(AppDataType.invoice, filter: (o) => o.account != widget.uuid || o.accountFrom != null);
    DateTime now = DateTime.now();
    int startingDay = AppStartOfMonth.get();
    DateTime curr = now.getStartingDay(startingDay);
    var data = SplayTreeMap<num, AccountSummaryData>();
    int increment = 0;
    while (!(bills.isFinished && inv.isFinished)) {
      var boundary = curr.millisecondsSinceEpoch.toDouble();
      var billList = bills.getTill(boundary);
      var invList = inv.getTill(boundary);
      data[increment] = AccountSummaryData(
        title: intl.DateFormat.MMMM().format(curr),
        description: curr.year.toString(),
        currency: account.currency,
        invoices: invList.fold(0.0, (v, e) => v + exchange.reform(e.details ?? 0.0, e.currency, account.currency)),
        bills: billList.fold(0.0, (v, e) => v + exchange.reform(e.details ?? 0.0, e.currency, account.currency)),
      );
      increment++;
      curr = DateTime(now.year, now.month - increment, startingDay);
    }
    return IteratorController(data, transform: (v) => v);
  }

  Widget buildSummaryWidget(item, BuildContext context) {
    final textTheme = context.textTheme;
    final indent = ThemeHelper.getIndent();
    final alignment = AppDesign.isRightToLeft() ? Alignment.centerLeft : Alignment.centerRight;
    return RowWidget(
      indent: indent,
      alignment: AppDesign.getAlignment<MainAxisAlignment>(),
      maxWidth: width,
      chunk: [indent, null, null, null, indent],
      children: [
        const [ThemeHelper.emptyBox],
        [
          Column(
            crossAxisAlignment: AppDesign.getAlignment(),
            children: [
              TextWrapper(
                item.title,
                style: textTheme.headlineMedium,
              ),
              TextWrapper(
                item.description,
                style: textTheme.bodySmall,
              ),
              ThemeHelper.hIndent
            ],
          ),
        ],
        [
          Align(
            alignment: alignment,
            child: TextWrapper(
              (item.bills as double).toCurrency(currency: item.currency, withPattern: true),
              style: textTheme.numberMedium,
            ),
          ),
        ],
        [
          Align(
            alignment: alignment,
            child: TextWrapper(
              (item.invoices as double).toCurrency(currency: item.currency, withPattern: true),
              style: textTheme.numberMedium,
            ),
          ),
        ],
        const [ThemeHelper.emptyBox],
      ],
    );
  }

  Widget buildLineWidget(item, BuildContext context) {
    return BaseLineWidget(
      uuid: item.uuid ?? '',
      title: _getTitle(item),
      description: item.description ?? '',
      details: item.detailsFormatted,
      progress: item.progress,
      color: item.color ?? Colors.transparent,
      icon: item.icon ?? Icons.radio_button_unchecked_sharp,
      hidden: item.hidden,
      width: width,
      route: _getRoute(item),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    width = ThemeHelper.getWidth(context, 4, constraints);
    bool isLeft = ThemeHelper.isNavRight(context, constraints);
    if (isLeft) {
      width -= ThemeHelper.barHeight;
    }
    return Padding(
      padding: EdgeInsets.only(top: ThemeHelper.getIndent()),
      child: Column(
        children: [
          AccountLineWidget(item: state.getByUuid(widget.uuid) as AccountAppData, width: width, count: 1),
          ThemeHelper.hIndent05,
          const Divider(height: 2),
          Expanded(
            child: TabWidget(
              type: TabType.secondary,
              isLeft: isLeft,
              focus: focus,
              callback: (data) => setState(() => focus = data),
              tabs: [
                Tab(text: AppLocale.labels.summary),
                Tab(text: AppLocale.labels.billHeadline),
                Tab(text: AppLocale.labels.invoiceHeadline),
              ],
              children: [
                BaseListInfiniteWidget(
                  stream: _getSummary(),
                  width: width,
                  buildListWidget: buildSummaryWidget,
                ),
                BaseListInfiniteWidget(
                  stream: state.getStream(AppDataType.bills, filter: (o) => o.account != widget.uuid),
                  width: width,
                  buildListWidget: buildLineWidget,
                ),
                BaseListInfiniteWidget(
                  stream: state.getStream(AppDataType.invoice, filter: (o) => o.account != widget.uuid),
                  width: width,
                  buildListWidget: buildLineWidget,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
