// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/flow_state_machine.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/history_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_generic/base_line_widget.dart';
import 'package:app_finance/widgets/_generic/base_list_infinite_widget.dart';
import 'package:flutter/material.dart';

class AccountViewPage extends AbstractPage {
  final String uuid;

  AccountViewPage({
    required this.uuid,
  }) : super();

  @override
  AccountViewPageState createState() => AccountViewPageState();
}

class AccountViewPageState extends AbstractPageState<AccountViewPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  String getTitle() {
    final item = super.state.getByUuid(widget.uuid) as AccountAppData;
    return item.title;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    String route = AppMenu.uuid(AppRoute.accountEditRoute, widget.uuid);
    double indent = ThemeHelper.getIndent(4);
    NavigatorState nav = Navigator.of(context);
    return Container(
      margin: EdgeInsets.only(left: indent),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        FloatingActionButton(
          heroTag: 'account_view_page_deactivate',
          onPressed: () => FlowStateMachine.deactivate(nav, store: super.state, uuid: widget.uuid),
          tooltip: AppLocale.labels.deleteAccountTooltip,
          child: const Icon(Icons.delete),
        ),
        FloatingActionButton(
          heroTag: 'account_view_page_edit',
          onPressed: () => nav.pushNamed(route),
          tooltip: AppLocale.labels.editAccountTooltip,
          child: const Icon(Icons.edit),
        ),
      ]),
    );
  }

  Widget buildLogWidget(item, BuildContext context) {
    final obj = state.getByUuid(item.ref ?? '');
    return BaseLineWidget(
      uuid: '',
      title: obj?.title ?? '',
      description: item.getDateFormatted(item.timestamp),
      progress: 1.0,
      details: item.getNumberFormatted(item.delta),
      color: obj?.color ?? Colors.transparent,
      width: ThemeHelper.getWidth(context, 3),
      route: item is BillAppData ? AppRoute.billViewRoute : '',
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
      hidden: item.hidden,
      width: ThemeHelper.getWidth(context, 3),
      route: item is BillAppData ? AppRoute.billViewRoute : '',
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final item = super.state.getByUuid(widget.uuid) as AccountAppData;
    final indent = ThemeHelper.getIndent();
    double width = ThemeHelper.getWidth(context, 3);
    return Padding(
      padding: EdgeInsets.only(top: indent),
      child: Column(
        children: [
          BaseLineWidget(
            uuid: item.uuid ?? '',
            title: item.title,
            description: item.description ?? '',
            details: item.detailsFormatted,
            progress: item.progress,
            color: item.color ?? Colors.transparent,
            width: width,
            route: AppRoute.accountViewRoute,
          ),
          TabBar.secondary(
            controller: _tabController,
            tabs: <Widget>[
              Tab(text: AppLocale.labels.summary),
              Tab(text: AppLocale.labels.billHeadline),
              Tab(text: AppLocale.labels.invoiceHeadline),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(indent, 0, indent, 0),
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  BaseListInfiniteWidget(
                    state: HistoryData.getLog(widget.uuid),
                    width: width - indent,
                    buildListWidget: buildLogWidget,
                  ),
                  BaseListInfiniteWidget(
                    state: state.getActualList(AppDataType.bills).where((o) => o.account == widget.uuid).toList(),
                    width: width - indent,
                    buildListWidget: buildLineWidget,
                  ),
                  BaseListInfiniteWidget(
                    state: state.getActualList(AppDataType.invoice).where((o) => o.account == widget.uuid).toList(),
                    width: width - indent,
                    buildListWidget: buildLineWidget,
                  ),
                ],
              ),
            ),
          ),
          ThemeHelper.formEndBox,
        ],
      ),
    );
  }
}
