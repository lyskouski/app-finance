// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/app_locale.dart';
import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_wrappers/tab_widget.dart';
import 'package:app_finance/widgets/bill/expenses_tab.dart';
import 'package:app_finance/widgets/bill/income_tab.dart';
import 'package:app_finance/widgets/bill/transfer_tab.dart';
import 'package:flutter/material.dart';

class BillAddPage extends AbstractPage {
  BillAddPage() : super();

  @override
  BillAddPageState createState() => BillAddPageState();
}

class BillAddPageState<T extends BillAddPage> extends AbstractPageState<BillAddPage> {
  @override
  String getTitle(context) {
    return AppLocale.labels.createBillHeader;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return const SizedBox();
  }

  @override
  void dispose() {
    FocusController.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return TabWidget(
      focus: 1,
      tabs: [
        Tab(
          icon: const Icon(Icons.insert_invitation),
          text: AppLocale.labels.incomeHeadline,
        ),
        Tab(
          icon: const Icon(Icons.money_off),
          text: AppLocale.labels.expenseHeadline,
        ),
        Tab(
          icon: const Icon(Icons.transform),
          text: AppLocale.labels.transferHeadline,
        ),
      ],
      children: const [
        IncomeTab(),
        ExpensesTab(),
        TransferTab(),
      ],
    );
  }
}
