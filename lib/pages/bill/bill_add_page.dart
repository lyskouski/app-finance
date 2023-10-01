// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/bill/widgets/expenses_tab.dart';
import 'package:app_finance/pages/bill/widgets/income_tab.dart';
import 'package:app_finance/pages/bill/widgets/transfer_tab.dart';
import 'package:app_finance/widgets/wrapper/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillAddPage extends StatefulWidget {
  const BillAddPage({super.key});

  @override
  BillAddPageState createState() => BillAddPageState();
}

class BillAddPageState extends State<BillAddPage> with TickerProviderStateMixin {
  @override
  void dispose() {
    FocusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<AppData>(builder: (context, appState, _) {
        return LayoutBuilder(builder: (context, constraints) {
          bool isLeft = ThemeHelper.getHeight(context) < 520;
          return TabWidget(
            type: TabType.secondary,
            hasIndent: false,
            isLeft: isLeft,
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
              IncomeTab(state: appState, isLeft: isLeft),
              ExpensesTab(state: appState, isLeft: isLeft),
              TransferTab(state: appState, isLeft: isLeft),
            ],
          );
        });
      }),
    );
  }
}
