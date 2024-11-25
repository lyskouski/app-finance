// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/flow_state_machine.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_classes/structure/payment_app_data.dart';
import 'package:app_finance/_configs/budget_type.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/data_ext.dart';
import 'package:app_finance/components/widgets/payment_list_widget.dart';
import 'package:app_finance/design/generic/base_line_widget.dart';
import 'package:app_finance/design/generic/base_list_infinite_widget.dart';
import 'package:app_finance/design/generic/base_swipe_widget.dart';
import 'package:app_finance/design/wrapper/confirmation_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:flutter/material.dart';

class PaymentViewPage extends StatefulWidget {
  final String uuid;

  const PaymentViewPage({
    super.key,
    required this.uuid,
  });

  @override
  PaymentViewPageState createState() => PaymentViewPageState();
}

class PaymentViewPageState extends AbstractPageState<PaymentViewPage> {
  late double width;

  @override
  String getButtonName() => '';

  @override
  String getTitle() => BudgetType.getLabel((state.getByUuid(widget.uuid) as PaymentAppData).title);

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    double indent = ThemeHelper.getIndent(4);
    NavigatorState nav = Navigator.of(context);
    return Container(
      margin: EdgeInsets.only(left: 2 * indent, right: 2 * indent),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        FloatingActionButton(
          heroTag: 'payment_view_page_edit',
          onPressed: () =>
              nav.pushNamed(AppRoute.automationPaymentEditRoute, arguments: {routeArguments.uuid: widget.uuid}),
          tooltip: AppLocale.labels.editPaymentTooltip,
          child: const Icon(Icons.edit),
        ),
        FloatingActionButton(
          heroTag: 'payment_view_page_deactivate',
          onPressed: () => ConfirmationWrapper.show(
            context,
            () => FlowStateMachine.deactivate(nav, store: super.state, uuid: widget.uuid),
          ),
          tooltip: AppLocale.labels.deletePaymentTooltip,
          child: const Icon(Icons.delete),
        ),
      ]),
    );
  }

  Widget buildListWidget(item, BuildContext context) {
    String routeList = item is BillAppData ? AppRoute.billViewRoute : AppRoute.invoiceViewRoute;
    return BaseSwipeWidget(
      routePath: routeList.replaceAll('/view', '/edit'),
      uuid: item.uuid,
      child: BaseLineWidget(
        uuid: item.uuid ?? '',
        title: item.title,
        description: item.description ?? '',
        details: item.detailsFormatted,
        progress: item.progress,
        color: item.color ?? Colors.transparent,
        icon: item.icon ?? Icons.radio_button_unchecked_sharp,
        hidden: item.hidden,
        skip: item.skip,
        width: width,
        route: routeList,
      ),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    width = constraints.maxWidth;
    final indent = ThemeHelper.getIndent();
    final item = state.getByUuid(widget.uuid) as PaymentAppData;
    final obj = item.data.toDataObject(state);
    return Container(
      padding: EdgeInsets.fromLTRB(0, indent * 1.5, 0, ThemeHelper.barHeight),
      child: Column(
        crossAxisAlignment: AppDesign.getAlignment(),
        children: [
          PaymentListWidget(item: item, state: state, width: constraints.maxWidth),
          Padding(
            padding: EdgeInsets.fromLTRB(indent, 0, indent, 0),
            child: Expanded(
              child: BaseListInfiniteWidget(
                stream: state.getStream(
                  obj is InvoiceAppData ? AppDataType.invoice : AppDataType.bills,
                  filter: (item) => item.payment != widget.uuid,
                ),
                width: constraints.maxWidth,
                buildListWidget: buildListWidget,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
