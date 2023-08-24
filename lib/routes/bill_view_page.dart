// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/flow_state_machine.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_generic/base_line_widget.dart';
import 'package:flutter/material.dart';

class BillViewPage extends AbstractPage {
  final String uuid;

  BillViewPage({
    required this.uuid,
  }) : super();

  @override
  BillViewPageState createState() => BillViewPageState();
}

class BillViewPageState extends AbstractPageState<BillViewPage> {
  @override
  String getTitle() {
    final item = super.state.getByUuid(widget.uuid) as BillAppData;
    return item.title;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    String route = AppMenu.uuid(AppRoute.billEditRoute, widget.uuid);
    double indent = ThemeHelper.getIndent(4);
    NavigatorState nav = Navigator.of(context);
    return Container(
      margin: EdgeInsets.only(left: indent),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        FloatingActionButton(
          heroTag: 'bill_view_page_deactivate',
          onPressed: () => FlowStateMachine.deactivate(nav, store: super.state, uuid: widget.uuid),
          tooltip: AppLocale.labels.deleteBillTooltip,
          child: const Icon(Icons.delete),
        ),
        FloatingActionButton(
          heroTag: 'bill_view_page_edit',
          onPressed: () => nav.pushNamed(route),
          tooltip: AppLocale.labels.editBillTooltip,
          child: const Icon(Icons.edit),
        ),
      ]),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final item = super.state.getByUuid(widget.uuid) as BillAppData;
    return Padding(
      padding: EdgeInsets.only(top: ThemeHelper.getIndent()),
      child: Column(
        children: [
          BaseLineWidget(
            uuid: item.uuid ?? '',
            title: item.title,
            description: item.description,
            details: item.detailsFormatted,
            progress: item.progress,
            color: item.color ?? Colors.transparent,
            width: ThemeHelper.getWidth(context, 3),
            route: AppRoute.billViewRoute,
          )
        ],
      ),
    );
  }
}
