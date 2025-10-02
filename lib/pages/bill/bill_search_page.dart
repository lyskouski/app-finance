// Copyright 2025 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/iterator_controller.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/date_range_input.dart';
import 'package:app_finance/design/form/list_account_selector.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:app_finance/pages/bill/bill_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class BillSearchPage extends StatefulWidget {
  const BillSearchPage({super.key});

  @override
  BillViewPageState createState() => BillViewPageState();
}

class BillViewPageState extends BillPageState<BillSearchPage> {
  String? account;
  String? budget;
  String? type;
  Currency? currency;
  DateTime? startDate;
  DateTime? endDate;
  late TextEditingController description;
  late FocusController focus;
  late List<ListAccountSelectorItem> accountList =
      state.getList(AppDataType.accounts).map((item) => ListAccountSelectorItem(item: item)).toList();
  late List<ListAccountSelectorItem> budgetList =
      state.getList(AppDataType.budgets).map((item) => ListAccountSelectorItem(item: item)).toList();

  @override
  void initState() {
    description = TextEditingController();
    focus = FocusController();
    super.initState();
  }

  @override
  dispose() {
    description.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  String getTitle() => AppLocale.labels.searchTooltip;

  @override
  String getButtonName() => AppLocale.labels.searchTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return FloatingActionButton(
      heroTag: 'bill_search_page',
      onPressed: () => setState(clearState),
      tooltip: getButtonName(),
      child: const Icon(Icons.search),
    );
  }

  bool getContentFilter(BillAppData item) {
    final descriptionMatch = item.title.toLowerCase().contains(description.text.toLowerCase());
    final accountMatch = account == null || item.account == account;
    final budgetMatch = budget == null || item.category == budget;
    final typeMatch = type == null || state.getByUuid(item.account)?.type == type;
    final currencyMatch = currency == null || item.currency == currency;
    final startDateMatch = startDate == null || item.createdAt.isAfter(startDate!);
    final endDateMatch = endDate == null || item.createdAt.isBefore(endDate!);
    return !(descriptionMatch &&
        accountMatch &&
        budgetMatch &&
        typeMatch &&
        currencyMatch &&
        startDateMatch &&
        endDateMatch);
  }

  @override
  InterfaceIterator getContentStream() => state.getStream<BillAppData>(AppDataType.bills, filter: getContentFilter);

  @override
  Widget addHeaderWidget() {
    final width = ScreenHelper.state().width - ThemeHelper.getIndent(4);
    return SliverToBoxAdapter(
      child: SingleScrollWrapper(
        controller: focus,
        child: Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            InputWrapper.text(
              title: AppLocale.labels.description,
              controller: description,
              tooltip: AppLocale.labels.descriptionTooltip,
            ),
            InputWrapper.select(
              value: type,
              title: AppLocale.labels.accountType,
              tooltip: AppLocale.labels.accountTypeTooltip,
              options: AccountType.getList(),
              onChange: (value) => setState(() {
                if (value != type) clearState();
                type = value;
              }),
            ),
            InputWrapper(
              type: NamedInputType.accountSelector,
              value: account != null ? state.getByUuid(account!) : null,
              title: AppLocale.labels.account,
              tooltip: AppLocale.labels.titleAccountTooltip,
              state: state,
              options: accountList,
              onChange: (value) => setState(() {
                if (value?.uuid != account) clearState();
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
                if (value?.uuid != budget) clearState();
                budget = value?.uuid;
              }),
              width: width,
            ),
            InputWrapper.currency(
              value: currency,
              title: AppLocale.labels.currency,
              tooltip: AppLocale.labels.currencyTooltip,
              onChange: (value) => setState(() {
                if (value != currency) clearState();
                currency = value;
              }),
            ),
            TextWrapper(
              AppLocale.labels.dateRange,
              style: context.textTheme.bodyLarge,
            ),
            DateRangeInput(
              valueFrom: startDate,
              value: endDate,
              setState: (start, end) => setState(() {
                startDate = start;
                endDate = end;
                clearState();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
