// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/pages/bill/bill_add_page.dart';
import 'package:app_finance/pages/bill/widgets/income_edit_tab.dart';
import 'package:app_finance/pages/bill/widgets/transfer_edit_tab.dart';
import 'package:flutter/material.dart';

class InvoiceEditPage extends BillAddPage {
  final String uuid;

  const InvoiceEditPage({
    super.key,
    required this.uuid,
  });

  @override
  BillEditPageState createState() => BillEditPageState();
}

class BillEditPageState extends BillAddPageState<InvoiceEditPage> {
  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final invoice = state.getByUuid(widget.uuid) as InvoiceAppData;
    return invoice.accountFrom != null
        ? TransferEditTab(
            state: state,
            callback: update,
            uuid: widget.uuid,
            accountFrom: invoice.accountFrom == '' ? null : invoice.accountFrom,
            accountTo: invoice.account == '' ? null : invoice.account,
            currency: invoice.currency,
            description: invoice.title,
            amount: invoice.details,
            createdAt: invoice.createdAt,
          )
        : IncomeEditTab(
            state: state,
            callback: update,
            uuid: widget.uuid,
            account: invoice.account == '' ? null : invoice.account,
            currency: invoice.currency,
            description: invoice.title,
            amount: invoice.details,
            createdAt: invoice.createdAt,
          );
  }
}
