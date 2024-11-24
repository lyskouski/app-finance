// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_classes/structure/payment_app_data.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/data_ext.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/generic/base_line_widget.dart';
import 'package:app_finance/design/generic/base_swipe_widget.dart';
import 'package:app_finance/pages/_interfaces/interface_page_inject.dart';
import 'package:flutter/material.dart';

class PaymentsTab extends StatefulWidget {
  final FnPageCallback callback;
  final AppData state;

  const PaymentsTab({
    super.key,
    required this.callback,
    required this.state,
  });

  @override
  PaymentsTabState createState() => PaymentsTabState();
}

class PaymentsTabState extends State<PaymentsTab> {
  @override
  void initState() {
    widget.callback((
      buildButton: buildButton,
      buttonName: getButtonName(),
      title: AppLocale.labels.paymentsHeadline,
    ));
    super.initState();
  }

  String getButtonName() => AppLocale.labels.createPaymentTooltip;

  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FullSizedButtonWidget(
      constraints: constraints,
      onPressed: () => nav.pushNamed(AppRoute.automationPaymentRoute),
      title: getButtonName(),
      icon: Icons.add_alert_sharp,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<PaymentAppData> data = widget.state.getList(AppDataType.payments).cast();
    data.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));

    final indent = ThemeHelper.getIndent();
    double width = ThemeHelper.getWidth(context, 4);
    if (ScreenHelper.state().isLeftBar) {
      width -= ThemeHelper.barHeight;
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(0, indent, 0, ThemeHelper.barHeight),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: data.length + 1,
        itemBuilder: (BuildContext context, index) {
          if (index >= data.length) {
            return ThemeHelper.formEndBox;
          }
          final uuid = data[index].uuid ?? '';
          final value = data[index].data;
          dynamic item = (value['type']['name'] as String).toDataObject(value['data'], widget.state);
          String type = AppLocale.labels.flowTypeInvoice;
          String symbol = '+';
          if (item is BillAppData) {
            type = AppLocale.labels.bill;
            symbol = '-';
          } else if (item is InvoiceAppData && item.accountFrom != null) {
            type = AppLocale.labels.transferHeadline;
            symbol = '';
          }
          return BaseSwipeWidget(
            routePath: AppRoute.automationPaymentEditRoute,
            uuid: uuid,
            child: BaseLineWidget(
              uuid: uuid,
              title: '$type: ${item.title}',
              description: '${data[index].description}, ${data[index].updatedAt.monthDay()}',
              details: '$symbol${item.detailsFormatted}',
              progress: 1.0,
              color: item.color ?? Colors.transparent,
              icon: item.icon ?? Icons.radio_button_unchecked_sharp,
              hidden: item.hidden,
              skip: item.skip,
              width: width,
              route: AppRoute.automationPaymentEditRoute,
            ),
          );
        },
      ),
    );
  }
}
