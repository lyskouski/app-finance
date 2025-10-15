// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/delayed_call.dart';
import 'package:app_finance/_classes/controller/exchange_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/double_ext.dart';
import 'package:app_finance/design/button/toolbar_button_widget.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/_interfaces/interface_page_inject.dart';
import 'package:app_finance/design/form/currency_exchange_input.dart';
import 'package:app_finance/design/form/date_time_input.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/form/list_account_selector.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

class ExpensesTab<T> extends StatefulWidget {
  final String? account;
  final String? budget;
  final Currency? currency;
  final double? bill;
  final String? description;
  final DateTime? createdAt;
  final AppData state;
  final bool isLeft;
  final FnPageCallback callback;

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
  late FocusController focus;
  String? account;
  Currency? accountCurrency;
  String? budget;
  Currency? budgetCurrency;
  Currency? currency;
  late TextEditingController bill;
  final billSignal = Signal<String>('');
  late TextEditingController description;
  final descriptionSignal = Signal<String>('');
  late ExchangeController exchange;
  DateTime? createdAt;
  bool hasErrors = false;
  bool isPushed = false;
  late List<ListAccountSelectorItem> accountList = widget.state
      .getList(AppDataType.accounts)
      .where((e) => ![AppAccountType.deposit.toString(), AppAccountType.credit.toString()].contains(e.type))
      .map((item) => ListAccountSelectorItem(item: item))
      .toList();

  @override
  void initState() {
    focus = FocusController();
    final accountId = AppPreferences.get(AppPreferences.prefAccount);
    final objAccount = widget.state.getByUuid(accountId ?? '');
    final budgetId = AppPreferences.get(AppPreferences.prefBudget);
    final objBudget = widget.state.getByUuid(budgetId ?? '');
    account = widget.account ?? objAccount?.uuid;
    budget = widget.budget ?? objBudget?.uuid;
    currency = widget.currency ?? objAccount?.currency ?? objBudget?.currency ?? Exchange.defaultCurrency;
    bill = TextEditingController(text: widget.bill != null ? widget.bill.toString() : '');
    final billTimer = DelayedCall(1000);
    bill.addListener(() => billTimer.run(() => billSignal.value = bill.text));
    description = TextEditingController(text: widget.description);
    final descriptionTimer = DelayedCall(1000);
    description.addListener(() => descriptionTimer.run(() => descriptionSignal.value = description.text));
    createdAt = widget.createdAt;
    accountCurrency = widget.state.getByUuid(account ?? '')?.currency;
    budgetCurrency = widget.state.getByUuid(budget ?? '')?.currency;
    exchange = ExchangeController(
      {},
      store: widget.state,
      targetController: bill,
      target: currency,
      source: [accountCurrency, budgetCurrency, Exchange.defaultCurrency],
    );

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
    widget.state.add(getValues());
  }

  BillAppData getValues() => BillAppData(
        account: account ?? '',
        category: budget ?? '',
        currency: currency,
        title: description.text,
        details: double.tryParse(bill.text)?.toFixed(currency?.decimalDigits) ?? 0.0,
        createdAt: createdAt ?? DateTime.now(),
      );

  String getButtonName() => AppLocale.labels.createBillTooltip;

  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FullSizedButtonWidget(
      constraints: constraints,
      controller: focus,
      onPressed: () => {
        setState(() {
          if (hasFormErrors()) {
            return;
          }
          updateStorage();
          nav.pop();
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

    return SingleScrollWrapper(
      controller: focus,
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 240),
        child: LayoutBuilder(builder: (context, constraints) {
          double width = constraints.maxWidth;
          return Column(
            crossAxisAlignment: AppDesign.getAlignment(),
            children: [
              InputWrapper(
                type: NamedInputType.accountSelector,
                isRequired: true,
                value: account != null ? widget.state.getByUuid(account!) : null,
                title: AppLocale.labels.account,
                tooltip: AppLocale.labels.titleAccountTooltip,
                showError: hasErrors && account == null,
                state: widget.state,
                options: accountList,
                onChange: (value) => setState(() {
                  account = value?.uuid;
                  if (value != null) {
                    accountCurrency = value.currency;
                    currency = accountCurrency;
                  }
                }),
                width: width,
              ),
              RowWidget(
                indent: indent,
                maxWidth: width,
                chunk: const [125, null],
                children: [
                  [
                    InputWrapper.currency(
                      type: NamedInputType.currencyShort,
                      value: currency,
                      title: AppLocale.labels.currency,
                      tooltip: AppLocale.labels.currencyTooltip,
                      onChange: (value) => setState(() => currency = value),
                    ),
                  ],
                  [
                    InputWrapper.text(
                      title: AppLocale.labels.expense,
                      isRequired: true,
                      controller: bill,
                      showError: hasErrors && bill.text.isEmpty,
                      tooltip: AppLocale.labels.billSetTooltip,
                      inputType: const TextInputType.numberWithOptions(decimal: true),
                      formatter: [SimpleInputFormatter.filterDouble],
                    ),
                  ],
                ],
              ),
              CurrencyExchangeInput(
                key: ValueKey('expense${currency?.code}${accountCurrency?.code}${budgetCurrency?.code}'),
                width: width + indent,
                indent: indent,
                target: currency,
                controller: exchange,
                source: [accountCurrency, budgetCurrency, Exchange.defaultCurrency],
              ),
              InputWrapper.text(
                title: AppLocale.labels.description,
                controller: description,
                tooltip: AppLocale.labels.descriptionTooltip,
              ),
              InputWrapper(
                type: NamedInputType.budgetSelector,
                isRequired: true,
                value: budget != null ? widget.state.getByUuid(budget!) : null,
                title: AppLocale.labels.budget,
                showError: hasErrors && budget == null,
                tooltip: AppLocale.labels.titleBudgetTooltip,
                state: widget.state,
                onChange: (value) => setState(() {
                  budget = value?.uuid;
                  if (value != null) {
                    budgetCurrency = value.currency;
                    currency ??= budgetCurrency;
                  }
                }),
                width: width,
              ),
              SignalBuilder(builder: (_, __) {
                final bill = BillAppData(
                  account: account ?? '',
                  category: budget ?? '',
                  currency: currency,
                  title: descriptionSignal.value,
                  details: double.tryParse(billSignal.value) ?? 0.0,
                );
                final categories = widget.state.prediction.predict(bill);
                if (categories.isEmpty) return ThemeHelper.emptyBox;
                final scope = categories.map((e) {
                  final item = widget.state.getByUuid(e);
                  return ToolbarButtonWidget(
                    isWide: true,
                    maxWidth: width / categories.length - indent * categories.length,
                    tooltip: item.title,
                    color: item.color ?? context.colorScheme.primary,
                    borderColor: item.color?.withValues(alpha: 0.5),
                    icon: item.icon ?? Icons.category,
                    onPressed: () => setState(() => budget = item.uuid),
                  );
                });
                return RowWidget(
                  alignment: AppDesign.getAlignment<MainAxisAlignment>(),
                  indent: indent,
                  maxWidth: constraints.maxWidth,
                  chunk: scope.map((_) => null).toList(),
                  children: scope.map((e) => [e]).toList(),
                );
              }),
              ThemeHelper.hIndent2x,
              Text(
                AppLocale.labels.expenseDateTime,
                style: textTheme.bodyLarge,
              ),
              DateTimeInput(
                width: width - indent,
                value: createdAt ?? DateTime.now(),
                setState: (value) => setState(() => createdAt = value),
              ),
              ThemeHelper.formEndBox,
            ],
          );
        }),
      ),
    );
  }
}
