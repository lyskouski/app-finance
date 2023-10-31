// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/display_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/bill/widgets/expenses_tab.dart';
import 'package:app_finance/pages/bill/widgets/income_tab.dart';
import 'package:app_finance/pages/bill/widgets/interface_bill_page_inject.dart';
import 'package:app_finance/pages/bill/widgets/transfer_tab.dart';
import 'package:app_finance/design/wrapper/tab_widget.dart';
import 'package:flutter/material.dart';

class BillAddPage extends StatefulWidget {
  const BillAddPage({super.key});

  @override
  BillAddPageState createState() => BillAddPageState();
}

class BillAddPageState<T extends BillAddPage> extends AbstractPageState<T> {
  BillPageInject? inject;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) =>
      inject?.buildButton(context, constraints) ?? ThemeHelper.emptyBox;

  @override
  String getButtonName() => inject?.buttonName ?? '';

  @override
  String getTitle() => inject?.title ?? '';

  void update(BillPageInject data) {
    if (data != inject) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() => inject = data));
    }
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final isLeft = DisplayHelper.state().isLeftBar;
    return TabWidget(
      type: TabType.secondary,
      hasIndent: false,
      isLeft: isLeft,
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
      children: [
        IncomeTab(state: state, isLeft: isLeft, callback: update),
        ExpensesTab(state: state, isLeft: isLeft, callback: update),
        TransferTab(state: state, isLeft: isLeft, callback: update),
      ],
    );
  }
}
