// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/pages/bill/bill_add_page.dart';
import 'package:app_finance/pages/bill/widgets/expenses_edit_tab.dart';
import 'package:flutter/material.dart';

class BillEditPage extends BillAddPage {
  final String uuid;

  const BillEditPage({
    super.key,
    required this.uuid,
  });

  @override
  BillEditPageState createState() => BillEditPageState();
}

class BillEditPageState extends BillAddPageState<BillEditPage> {
  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final bill = state.getByUuid(widget.uuid) as BillAppData;
    return ExpensesEditTab(
      state: state,
      callback: update,
      uuid: widget.uuid,
      account: bill.account == '' ? null : bill.account,
      budget: bill.category == '' ? null : bill.category,
      currency: bill.currency,
      bill: bill.details,
      description: bill.title,
      createdAt: bill.createdAt,
    );
  }
}
