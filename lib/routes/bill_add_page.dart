// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/classes/tab_controller_sync.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/classes/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/bill/expenses_tab.dart';
import 'package:app_finance/widgets/bill/income_tab.dart';
import 'package:app_finance/widgets/bill/transfer_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BillAddPage extends AbstractPage {
  final int tabCount = 3;
  int tabIndex = 1;
  PageController? pageController;
  TabController? tabController;
  Widget? button;

  BillAddPage() : super();

  @override
  BillAddPageState createState() => BillAddPageState();
}

class BillAddPageState<T extends BillAddPage>
    extends AbstractPageState<BillAddPage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.createBillHeader;
  }

  void setButton(Widget button) {
    widget.button = button;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return widget.button ?? const SizedBox();
  }

  @override
  void initState() {
    super.initState();
    widget.pageController = PageController(initialPage: widget.tabIndex);
    widget.tabController = TabController(
      length: widget.tabCount,
      vsync: const TabControllerSync(),
      initialIndex: widget.tabIndex,
    );
  }

  @override
  void dispose() {
    widget.pageController?.dispose();
    widget.tabController?.dispose();
    super.dispose();
  }

  Future<void> delaySwitchTab(int delay, int newIndex) async {
    await Future.delayed(Duration(milliseconds: delay));
    switchTab(newIndex);
  }

  void switchTab(int newIndex) {
    if (newIndex < 0 || newIndex >= widget.tabCount) {
      return;
    }
    setState(() {
      const delay = 300;
      final currIndex = widget.tabIndex;
      widget.tabIndex = newIndex;
      widget.tabController?.animateTo(newIndex);
      widget.pageController?.animateToPage(
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
          switchTab(widget.tabIndex - 1);
        } else if (details.primaryVelocity! < 0) {
          switchTab(widget.tabIndex + 1);
        }
      },
      child: Scaffold(
        appBar: TabBar(
          controller: widget.tabController,
          onTap: switchTab,
          tabs: [
            Tab(text: AppLocalizations.of(context)!.incomeHeadline),
            Tab(text: AppLocalizations.of(context)!.expenseHeadline),
            Tab(text: AppLocalizations.of(context)!.transferHeadline),
          ],
        ),
        body: PageView(
          controller: widget.pageController,
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
