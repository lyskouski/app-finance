// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/flow_state_machine.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/history_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/pages/_interface/abstract_page_state.dart';
import 'package:app_finance/pages/account/widgets/account_header_widget.dart';
import 'package:app_finance/widgets/generic/base_line_widget.dart';
import 'package:app_finance/widgets/generic/base_list_infinite_widget.dart';
import 'package:app_finance/widgets/wrapper/confirmation_wrapper.dart';
import 'package:app_finance/widgets/wrapper/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

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

  Widget buildLogWidget(item, BuildContext context) {
    final obj = state.getByUuid(item.ref ?? '');
    return BaseLineWidget(
      uuid: obj?.uuid ?? '',
      title: _getTitle(obj),
      description: (item.timestamp as DateTime).yMEd(),
      progress: 1.0,
      details: (item.delta as double).toCurrency(currency: item.currency, withPattern: false),
      color: obj?.color ?? Colors.transparent,
      icon: obj?.icon ?? Icons.radio_button_unchecked_sharp,
      width: width,
      route: _getRoute(obj),
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
      width -= AbstractPageState.barHeight;
    }
    return Padding(
      padding: EdgeInsets.only(top: ThemeHelper.getIndent()),
      child: Column(
        children: [
          AccountHeaderWidget(item: state.getByUuid(widget.uuid) as AccountAppData, width: width),
          ThemeHelper.hIndent05,
          const Divider(height: 2),
          Expanded(
            child: TabWidget(
              type: TabType.secondary,
              isLeft: isLeft,
              tabs: [
                Tab(text: AppLocale.labels.summary),
                Tab(text: AppLocale.labels.billHeadline),
                Tab(text: AppLocale.labels.invoiceHeadline),
              ],
              children: [
                BaseListInfiniteWidget(
                  stream: HistoryData.getStream(widget.uuid),
                  width: width,
                  buildListWidget: buildLogWidget,
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
