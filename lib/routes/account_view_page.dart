// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/flow_state_machine.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_generic/base_line_widget.dart';
import 'package:app_finance/widgets/account/summary_tab.dart';
import 'package:flutter/material.dart';

class AccountViewPage extends AbstractPage {
  final String uuid;

  AccountViewPage({
    required this.uuid,
  }) : super();

  @override
  AccountViewPageState createState() => AccountViewPageState();
}

class AccountViewPageState extends AbstractPageState<AccountViewPage> {
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
          SummaryTab(uuid: widget.uuid, state: state),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
