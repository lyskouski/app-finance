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

  BillAddPage() : super();

  @override
  BillAddPageState createState() => BillAddPageState();
}

class BillAddPageState<T extends BillAddPage>
    extends AbstractPageState<BillAddPage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.createAccountHeader;
  }

  bool hasFormErrors() {
    bool isError = false;
    return isError;
  }

  void updateStorage() {
    // widget.state?.add(AppDataType.bills, BillAppData());
  }

  String getButtonName() {
    return AppLocalizations.of(context)!.createBillTooltip;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    String title = getButtonName();
    return SizedBox(
      width: constraints.maxWidth - helper.getIndent() * 4,
      child: FloatingActionButton(
        onPressed: () => {
          setState(() {
            if (hasFormErrors()) {
              return;
            }
            updateStorage();
            Navigator.popAndPushNamed(context, AppRoute.homeRoute);
          })
        },
        tooltip: title,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.save),
              SizedBox(height: helper.getIndent()),
              Text(title, style: Theme.of(context).textTheme.headlineMedium)
            ],
          ),
        ),
      ),
    );
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

  void switchTab(int newIndex) {
    if (newIndex < 0 || newIndex >= widget.tabCount) {
      return;
    }
    setState(() {
      widget.tabIndex = newIndex;
      widget.tabController?.animateTo(newIndex);
      widget.pageController?.animateToPage(
        newIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
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
            IncomeTab(),
            ExpensesTab(),
            TransferTab(),
          ],
        ),
      ),
    );
  }
}
