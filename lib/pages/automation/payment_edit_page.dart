// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/structure/payment_app_data.dart';
import 'package:app_finance/_configs/budget_type.dart';
import 'package:app_finance/_configs/payment_type.dart';
import 'package:app_finance/_ext/data_ext.dart';
import 'package:app_finance/pages/automation/payment_add_page.dart';
import 'package:flutter/material.dart';

class PaymentEditPage extends PaymentAddPage {
  final String uuid;

  const PaymentEditPage({
    super.key,
    required this.uuid,
  });

  @override
  PaymentEditPageState createState() => PaymentEditPageState();
}

class PaymentEditPageState extends PaymentAddPageState<PaymentEditPage> {
  @override
  String getButtonName() => AppLocale.labels.updatePaymentTooltip;

  @override
  void updateStorage() {
    final values = getValues();
    state.update(
      widget.uuid,
      PaymentAppData(
        uuid: widget.uuid,
        title: intervalType ?? AppBudgetType.month.name,
        data: values.toFile(),
        updatedAt: values.createdAt,
      ),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    if (intervalType == null) {
      final payment = state.getByUuid(widget.uuid) as PaymentAppData;
      item = (payment.data['type']['name'] as String).toDataObject(payment.data['data'], state);
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
            intervalType = payment.title;
            itemType = AppPaymentType.bill.name;
            updatedAt = payment.updatedAt;
            if (item is InvoiceAppData) {
              itemType = (item as InvoiceAppData).accountFrom == null
                  ? AppPaymentType.invoice.name
                  : AppPaymentType.transfer.name;
            }
          }));
    }
    return super.buildContent(context, constraints);
  }
}
