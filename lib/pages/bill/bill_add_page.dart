// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/bill/widgets/expenses_tab.dart';
import 'package:app_finance/pages/bill/widgets/income_tab.dart';
import 'package:app_finance/pages/bill/widgets/transfer_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillAddPage extends StatefulWidget {
  const BillAddPage({super.key});

  @override
  BillAddPageState createState() => BillAddPageState();
}

class BillAddPageState extends State<BillAddPage> with TickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    return Material(
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
              padding: const EdgeInsets.only(top: 2),
              child: Consumer<AppData>(
                  builder: (context, appState, _) => TabBarView(
                        controller: _tabController,
                        children: [
                          IncomeTab(state: appState),
                          ExpensesTab(state: appState),
                          TransferTab(state: appState),
                        ],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
