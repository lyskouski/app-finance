// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_classes/structure/payment_app_data.dart';
import 'package:app_finance/_ext/data_ext.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/design/generic/base_line_widget.dart';
import 'package:flutter/material.dart';

class PaymentListWidget extends StatelessWidget {
  final PaymentAppData item;
  final AppData state;
  final double? width;
  final BoxConstraints? constraints;

  const PaymentListWidget({
    super.key,
    required this.item,
    required this.state,
    this.width,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final uuid = item.uuid ?? '';
    dynamic obj = item.data.toDataObject(state);
    String type = AppLocale.labels.flowTypeInvoice;
    String symbol = '+';
    if (obj is BillAppData) {
      type = AppLocale.labels.bill;
      symbol = '-';
    } else if (obj is InvoiceAppData && obj.accountFrom != null) {
      type = AppLocale.labels.transferHeadline;
      symbol = '';
    }
    return BaseLineWidget(
      uuid: uuid,
      title: '$type: ${obj.title}',
      description: '${item.description}, ${item.updatedAt.monthDay()}',
      details: '$symbol${obj.detailsFormatted}',
      progress: 1.0,
      color: obj.color ?? Colors.transparent,
      icon: obj.icon ?? Icons.radio_button_unchecked_sharp,
      hidden: obj.hidden,
      skip: obj.skip,
      width: width ?? constraints?.maxWidth ?? double.infinity,
      route: AppRoute.automationPaymentViewRoute,
    );
  }
}
