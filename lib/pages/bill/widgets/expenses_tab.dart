// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/widgets/form/currency_exchange_input.dart';
import 'package:app_finance/widgets/form/currency_selector.dart';
import 'package:app_finance/widgets/form/date_time_input.dart';
import 'package:app_finance/widgets/wrapper/full_sized_button_widget.dart';
import 'package:app_finance/widgets/form/list_account_selector.dart';
import 'package:app_finance/widgets/form/list_budget_selector.dart';
import 'package:app_finance/widgets/form/simple_input.dart';
import 'package:app_finance/widgets/wrapper/required_widget.dart';
import 'package:app_finance/widgets/wrapper/row_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

class ExpensesTab<T> extends StatefulWidget {
  final String? account;
  final String? budget;
  final Currency? currency;
  final double? bill;
  final String? description;
  final DateTime? createdAt;
  final AppData state;

  const ExpensesTab({
    super.key,
    required this.state,
    this.account,
    this.budget,
    this.currency,
    this.bill,
    this.description,
    this.createdAt,
  });

  @override
  ExpensesTabState createState() => ExpensesTabState();
}

class ExpensesTabState<T extends ExpensesTab> extends AbstractPageState<T> {
  String? account;
  String? budget;
  Currency? currency;
  late TextEditingController bill;
  late TextEditingController description;
  DateTime? createdAt;
  bool hasErrors = false;
  bool isPushed = false;

  @override
  void initState() {
    final accountId = AppPreferences.get(AppPreferences.prefAccount);
    final objAccount = widget.state.getByUuid(accountId ?? '');
    final budgetId = AppPreferences.get(AppPreferences.prefBudget);
    final objBudget = widget.state.getByUuid(budgetId ?? '');
    final currencyId = AppPreferences.get(AppPreferences.prefCurrency);
    account = widget.account ?? objAccount?.uuid;
    budget = widget.budget ?? objBudget?.uuid;
    currency =
        widget.currency ?? objAccount?.currency ?? objBudget?.currency ?? CurrencyProvider.findByCode(currencyId);
    bill = TextEditingController(text: widget.bill != null ? widget.bill.toString() : '');
    description = TextEditingController(text: widget.description);
    createdAt = widget.createdAt;
    super.initState();
  }

  @override
  dispose() {
    isPushed = false;
    bill.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  String getTitle() => AppLocale.labels.createBillHeader;

  bool hasFormErrors() {
    setState(() => hasErrors = account == null || budget == null || bill.text.isEmpty);
    return hasErrors;
  }

  void updateStorage() {
    AppPreferences.set(AppPreferences.prefAccount, account ?? '');
    AppPreferences.set(AppPreferences.prefBudget, budget ?? '');
    widget.state.add(BillAppData(
      account: account ?? '',
      category: budget ?? '',
      currency: currency,
      title: description.text,
      details: double.tryParse(bill.text) ?? 0.0,
      createdAt: createdAt ?? DateTime.now(),
    ));
  }

  @override
  String getButtonName() => AppLocale.labels.createBillTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FullSizedButtonWidget(
      constraints: constraints,
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
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final TextTheme textTheme = context.textTheme;
    double indent = ThemeHelper.getIndent(2);
    double width = ThemeHelper.getWidth(context, 6);

    return SingleChildScrollView(
      controller: FocusController.getController(runtimeType),
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
                currency = widget.state.getByUuid(value).currency;
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
                var bdgCurrency = widget.state.getByUuid(value).currency;
                currency ??= bdgCurrency;
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
                  CurrencySelector(
                    value: currency?.code,
                    hintText: AppLocale.labels.currencyTooltip,
                    setView: (Currency currency) => currency.code,
                    setState: (value) => setState(() => currency = value),
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
                    formatter: [SimpleInput.filterDouble],
                  ),
                ],
              ],
            ),
            ThemeHelper.hIndent2x,
            CurrencyExchangeInput(
              width: width + indent,
              indent: indent,
              target: currency,
              state: widget.state,
              targetController: bill,
              source: [
                account != null ? widget.state.getByUuid(account!).currency : null,
                budget != null ? widget.state.getByUuid(budget!).currency : null,
              ].cast<Currency?>(),
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
