// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/_classes/tab_controller_sync.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/bill/expenses_tab.dart';
import 'package:app_finance/widgets/bill/income_tab.dart';
import 'package:app_finance/widgets/bill/transfer_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BillAddPage extends AbstractPage {
  @override
  BillAddPageState createState() => BillAddPageState();
}

class BillAddPageState<T extends BillAddPage>
    extends AbstractPageState<BillAddPage> {
  late PageController pageController;
  late TabController tabController;
  final int tabCount = 3;
  int tabIndex = 1;
  Widget? button;

  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.createBillHeader;
  }

  void setButton(Widget btn) {
    button = btn;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return button ?? const SizedBox();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: tabIndex);
    tabController = TabController(
      length: tabCount,
      vsync: const TabControllerSync(),
      initialIndex: tabIndex,
    );
  }

  @override
  void dispose() {
    FocusController.dispose();
    pageController.dispose();
    tabController.dispose();
    super.dispose();
  }

  Future<void> delaySwitchTab(int delay, int newIndex) async {
    await Future.delayed(Duration(milliseconds: delay));
    switchTab(newIndex);
  }

  void switchTab(int newIndex) {
    if (newIndex < 0 || newIndex >= tabCount) {
      return;
    }
    setState(() {
      const delay = 300;
      final currIndex = tabIndex;
      tabIndex = newIndex;
      tabController.animateTo(newIndex);
      pageController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: delay),
        curve: Curves.ease,
      );
      if ((currIndex - newIndex).abs() > 1) {
        delaySwitchTab(delay, newIndex);
      }
    });
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! > 0) {
          switchTab(tabIndex - 1);
        } else if (details.primaryVelocity! < 0) {
          switchTab(tabIndex + 1);
        }
      },
      child: Scaffold(
        appBar: TabBar(
          controller: tabController,
          onTap: switchTab,
          tabs: [
            Tab(
              icon: const Icon(Icons.insert_invitation),
              text: AppLocalizations.of(context)!.incomeHeadline,
            ),
            Tab(
              icon: const Icon(Icons.money_off),
              text: AppLocalizations.of(context)!.expenseHeadline,
            ),
            Tab(
              icon: const Icon(Icons.transform),
              text: AppLocalizations.of(context)!.transferHeadline,
            ),
          ],
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: switchTab,
          children: [
            IncomeTab(callback: setButton),
            ExpensesTab(callback: setButton),
            TransferTab(callback: setButton),
          ],
        ),
      ),
    );
  }
}
