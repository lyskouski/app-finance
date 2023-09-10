// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/bill/expenses_tab.dart';
import 'package:app_finance/widgets/bill/income_tab.dart';
import 'package:app_finance/widgets/bill/transfer_tab.dart';
import 'package:flutter/material.dart';

class BillAddPage extends AbstractPage {
  BillAddPage() : super();

  @override
  BillAddPageState createState() => BillAddPageState();
}

class BillAddPageState<T extends BillAddPage> extends AbstractPageState<BillAddPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  Widget button = ThemeHelper.emptyBox;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    FocusController.dispose();
    super.dispose();
  }

  @override
  String getTitle() {
    return AppLocale.labels.createBillHeader;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return button;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final indent = ThemeHelper.getIndent();
    return Padding(
      padding: EdgeInsets.only(top: indent),
      child: Column(
        children: [
          TabBar.secondary(
            controller: _tabController,
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
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(indent, 0, indent, 0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  IncomeTab(callback: (btn) => setState(() => button = btn), state: state),
                  ExpensesTab(callback: (btn) => setState(() => button = btn), state: state),
                  TransferTab(callback: (btn) => setState(() => button = btn), state: state),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
