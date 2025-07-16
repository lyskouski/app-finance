// Copyright 2025 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/delayed_call.dart';
import 'package:app_finance/_classes/controller/iterator_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/form/list_account_selector.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/bill/bill_page.dart';
import 'package:flutter/material.dart';

class BillSearchPage extends StatefulWidget {
  const BillSearchPage({super.key});

  @override
  BillViewPageState createState() => BillViewPageState();
}

class BillViewPageState extends BillPageState<BillSearchPage> {
  String? account;
  String? budget;
  late TextEditingController description;
  late List<ListAccountSelectorItem> accountList =
      state.getList(AppDataType.accounts).map((item) => ListAccountSelectorItem(item: item)).toList();
  late List<ListAccountSelectorItem> budgetList =
      state.getList(AppDataType.budgets).map((item) => ListAccountSelectorItem(item: item)).toList();

  @override
  void initState() {
    description = TextEditingController();
    final runner = DelayedCall(1500);
    bool isFocused = false;
    changeState() => setState(clearState);
    description.addListener(() => isFocused ? runner.run(changeState) : isFocused = true);
    super.initState();
  }

  @override
  dispose() {
    description.dispose();
    super.dispose();
  }

  @override
  String getTitle() => AppLocale.labels.searchTooltip;

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) => ThemeHelper.emptyBox;

  bool getContentFilter(BillAppData item) {
    final descriptionMatch = item.title.toLowerCase().contains(description.text.toLowerCase());
    final accountMatch = account == null || item.account == account;
    final budgetMatch = budget == null || item.category == budget;
    return !(descriptionMatch && accountMatch && budgetMatch);
  }

  @override
  InterfaceIterator getContentStream() => state.getStream<BillAppData>(AppDataType.bills, filter: getContentFilter);

  @override
  Widget addHeaderWidget() {
    final width = ScreenHelper.state().width - ThemeHelper.getIndent(4);
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: AppDesign.getAlignment(),
        children: [
          InputWrapper.text(
            title: AppLocale.labels.description,
            controller: description,
            tooltip: AppLocale.labels.descriptionTooltip,
          ),
          InputWrapper(
            type: NamedInputType.accountSelector,
            value: account != null ? state.getByUuid(account!) : null,
            title: AppLocale.labels.account,
            tooltip: AppLocale.labels.titleAccountTooltip,
            state: state,
            options: accountList,
            onChange: (value) => setState(() {
              clearState();
              account = value?.uuid;
            }),
            width: width,
          ),
          InputWrapper(
            type: NamedInputType.budgetSelector,
            value: budget != null ? state.getByUuid(budget!) : null,
            title: AppLocale.labels.budget,
            tooltip: AppLocale.labels.titleBudgetTooltip,
            state: state,
            options: budgetList,
            onChange: (value) => setState(() {
              clearState();
              budget = value?.uuid;
            }),
            width: width,
          ),
        ],
      ),
    );
  }
}
