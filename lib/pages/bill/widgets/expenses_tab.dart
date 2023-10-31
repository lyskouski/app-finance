// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/exchange_controller.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/_configs/display_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/bill/widgets/interface_bill_page_inject.dart';
import 'package:app_finance/pages/_widgets/form/currency_exchange_input.dart';
import 'package:app_finance/pages/_widgets/form/currency_selector.dart';
import 'package:app_finance/pages/_widgets/form/date_time_input.dart';
import 'package:app_finance/pages/_widgets/button/full_sized_button_widget.dart';
import 'package:app_finance/pages/_widgets/form/list_account_selector.dart';
import 'package:app_finance/pages/_widgets/form/list_budget_selector.dart';
import 'package:app_finance/pages/_widgets/form/simple_input.dart';
import 'package:app_finance/pages/_widgets/wrapper/required_widget.dart';
import 'package:app_finance/pages/_widgets/wrapper/row_widget.dart';
import 'package:app_finance/pages/_widgets/wrapper/single_scroll_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class ExpensesTab<T> extends StatefulWidget {
  final String? account;
  final String? budget;
  final Currency? currency;
  final double? bill;
  final String? description;
  final DateTime? createdAt;
  final AppData state;
  final bool isLeft;
  final FnBillPageCallback callback;

  const ExpensesTab({
    super.key,
    required this.state,
    required this.callback,
    this.account,
    this.budget,
    this.currency,
    this.bill,
    this.description,
    this.createdAt,
    this.isLeft = false,
  });

  @override
  ExpensesTabState createState() => ExpensesTabState();
}

class ExpensesTabState<T extends ExpensesTab> extends State<T> {
  final focus = FocusController();
  String? account;
  Currency? accountCurrency;
  String? budget;
  Currency? budgetCurrency;
  Currency? currency;
  late TextEditingController bill;
  late TextEditingController description;
  late ExchangeController exchange;
  DateTime? createdAt;
  bool hasErrors = false;
  bool isPushed = false;

  @override
  void initState() {
    final accountId = AppPreferences.get(AppPreferences.prefAccount);
    final objAccount = widget.state.getByUuid(accountId ?? '');
    final budgetId = AppPreferences.get(AppPreferences.prefBudget);
    final objBudget = widget.state.getByUuid(budgetId ?? '');
    account = widget.account ?? objAccount?.uuid;
    budget = widget.budget ?? objBudget?.uuid;
    currency = widget.currency ?? objAccount?.currency ?? objBudget?.currency ?? Exchange.defaultCurrency;
    bill = TextEditingController(text: widget.bill != null ? widget.bill.toString() : '');
    description = TextEditingController(text: widget.description);
    createdAt = widget.createdAt;
    accountCurrency = widget.state.getByUuid(account ?? '')?.currency;
    budgetCurrency = widget.state.getByUuid(budget ?? '')?.currency;
    exchange = ExchangeController({},
        store: widget.state, targetController: bill, target: currency, source: [accountCurrency, budgetCurrency]);

    widget.callback((
      buildButton: buildButton,
      buttonName: getButtonName(),
      title: getTitle(),
    ));
    super.initState();
  }

  @override
  dispose() {
    isPushed = false;
    description.dispose();
    exchange.dispose();
    bill.dispose();
    focus.dispose();
    super.dispose();
  }

  String getTitle() => AppLocale.labels.createBillHeader;

  bool hasFormErrors() {
    setState(() => hasErrors = account == null || budget == null || bill.text.isEmpty);
    return hasErrors;
  }

  void updateStorage() {
    AppPreferences.set(AppPreferences.prefAccount, account ?? '');
    AppPreferences.set(AppPreferences.prefBudget, budget ?? '');
    if (currency != null) {
      CurrencyProvider.pin(currency!);
    }
    exchange.save();
    widget.state.add(BillAppData(
      account: account ?? '',
      category: budget ?? '',
      currency: currency,
      title: description.text,
      details: double.tryParse(bill.text) ?? 0.0,
      createdAt: createdAt ?? DateTime.now(),
    ));
  }

  String getButtonName() => AppLocale.labels.createBillTooltip;

  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FullSizedButtonWidget(
      constraints: constraints,
      controller: focus,
      setState: () => {
        setState(() {
          if (hasFormErrors()) {
            return;
          }
          updateStorage();
          nav.popAndPushNamed(AppRoute.homeRoute);
        })
      },
      title: getButtonName(),
      icon: Icons.save,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final indent = ThemeHelper.getIndent(2);
    double width = DisplayHelper.state().width - indent * 3;
    if (widget.isLeft) {
      width -= AbstractPageState.barHeight;
    }

    return SingleScrollWrapper(
      controller: focus,
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequiredWidget(
              title: AppLocale.labels.account,
              showError: hasErrors && account == null,
            ),
            ListAccountSelector(
              value: account,
              hintText: AppLocale.labels.titleAccountTooltip,
              state: widget.state,
              options: widget.state
                  .getList(AppDataType.accounts)
                  .where((e) => ![AppAccountType.deposit.toString(), AppAccountType.credit.toString()].contains(e.type))
                  .map((item) => ListAccountSelectorItem(item: item))
                  .toList(),
              setState: (value) => setState(() {
                account = value;
                accountCurrency = widget.state.getByUuid(value).currency;
                currency = accountCurrency;
              }),
              width: width,
            ),
            ThemeHelper.hIndent2x,
            RequiredWidget(
              title: AppLocale.labels.budget,
              showError: hasErrors && budget == null,
            ),
            ListBudgetSelector(
              value: budget,
              hintText: AppLocale.labels.titleBudgetTooltip,
              state: widget.state,
              setState: (value) => setState(() {
                budget = value;
                budgetCurrency = widget.state.getByUuid(value).currency;
                currency ??= budgetCurrency;
              }),
              width: width,
            ),
            ThemeHelper.hIndent2x,
            RowWidget(
              indent: indent,
              maxWidth: width + indent,
              chunk: const [125, null],
              children: [
                [
                  Text(
                    AppLocale.labels.currency,
                    style: textTheme.bodyLarge,
                  ),
                  CodeCurrencySelector(
                    value: currency?.code,
                    textTheme: textTheme,
                    colorScheme: context.colorScheme,
                    update: (value) => setState(() => currency = value),
                  ),
                ],
                [
                  RequiredWidget(
                    title: AppLocale.labels.expense,
                    showError: hasErrors && bill.text.isEmpty,
                  ),
                  SimpleInput(
                    controller: bill,
                    type: const TextInputType.numberWithOptions(decimal: true),
                    tooltip: AppLocale.labels.billSetTooltip,
                    formatter: [SimpleInputFormatter.filterDouble],
                  ),
                ],
              ],
            ),
            ThemeHelper.hIndent2x,
            CurrencyExchangeInput(
              width: width + indent,
              indent: indent,
              target: currency,
              controller: exchange,
              source: [accountCurrency, budgetCurrency],
            ),
            Text(
              AppLocale.labels.description,
              style: textTheme.bodyLarge,
            ),
            SimpleInput(
              controller: description,
              tooltip: AppLocale.labels.descriptionTooltip,
            ),
            ThemeHelper.hIndent2x,
            Text(
              AppLocale.labels.expenseDateTime,
              style: textTheme.bodyLarge,
            ),
            DateTimeInput(
              width: width,
              value: createdAt ?? DateTime.now(),
              setState: (value) => setState(() => createdAt = value),
            ),
            ThemeHelper.formEndBox,
          ],
        ),
      ),
    );
  }
}
