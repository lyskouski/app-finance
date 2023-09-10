// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/widgets/bill/expenses_edit_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillEditPage extends StatelessWidget {
  final String uuid;

  const BillEditPage({
    super.key,
    required this.uuid,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (context, appState, _) {
      final bill = appState.getByUuid(uuid) as BillAppData;
      return ExpensesEditTab(
        state: appState,
        uuid: uuid,
        account: bill.account == '' ? null : bill.account,
        budget: bill.category == '' ? null : bill.category,
        currency: bill.currency,
        bill: bill.details,
        description: bill.title,
        createdAt: bill.createdAt,
      );
    });
  }
}
