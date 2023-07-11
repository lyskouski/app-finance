// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/_classes/data/bill_app_data.dart';
import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/_forms/currency_exchange_input.dart';
import 'package:app_finance/widgets/_forms/currency_selector.dart';
import 'package:app_finance/widgets/_forms/date_time_input.dart';
import 'package:app_finance/widgets/_forms/list_account_selector.dart';
import 'package:app_finance/widgets/_forms/list_budget_selector.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/required_widget.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';

class ExpensesTab<T> extends StatefulWidget {
  final String? account;
  final String? budget;
  final Currency? currency;
  final double? bill;
  final String? description;
  final DateTime? createdAt;

  ExpensesTab({
    this.account,
    this.budget,
    this.currency,
    this.bill,
    this.description,
    this.createdAt,
  }) : super(key: UniqueKey());

  @override
  ExpensesTabState createState() => ExpensesTabState();
}

class ExpensesTabState<T extends ExpensesTab> extends State<T>
    with SharedPreferencesMixin {
  late AppData state;
  String? account;
  String? budget;
  Currency? currency;
  double? bill;
  String? description;
  DateTime? createdAt;
  bool hasErrors = false;

  @override
  void initState() {
    account = widget.account;
    budget = widget.budget;
    currency = widget.currency;
    bill = widget.bill;
    description = widget.description;
    createdAt = widget.createdAt;
    super.initState();
    getPreference(prefAccount).then((value) => setState(() {
          account ??= value;
          currency ??= state.getByUuid(value ?? '')?.currency;
        }));
    getPreference(prefBudget).then((value) => setState(() {
          budget ??= value;
          currency ??= state.getByUuid(value ?? '')?.currency;
        }));
  }

  bool hasFormErrors() {
    setState(
        () => hasErrors = account == null || budget == null || bill == null);
    return hasErrors;
  }

  void updateStorage() {
    setPreference(prefAccount, account ?? '');
    setPreference(prefBudget, budget ?? '');
    state.add(
        AppDataType.bills,
        BillAppData(
          account: account ?? '',
          category: budget ?? '',
          currency: currency,
          title: description ?? '',
          details: bill,
          createdAt: createdAt ?? DateTime.now(),
        ));
  }

  String getButtonTitle(context) {
    return AppLocalizations.of(context)!.createBillTooltip;
  }

  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    String title = getButtonTitle(context);
    FocusController.setContext(5);
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
        focusNode: FocusController.getFocusNode(),
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
  Widget build(BuildContext context) {
    // FocusController.dispose();
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent =
        ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 3;
    int focusOrder = FocusController.DEFAULT;

    return LayoutBuilder(builder: (context, constraints) {
      return Consumer<AppData>(builder: (context, appState, _) {
        state = appState;
        return Scaffold(
          body: SingleChildScrollView(
            controller: FocusController.getController(),
            child: Container(
              margin: EdgeInsets.fromLTRB(indent, indent, indent, 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RequiredWidget(
                    title: AppLocalizations.of(context)!.account,
                    showError: hasErrors && account == null,
                  ),
                  ListAccountSelector(
                    value: account,
                    state: state,
                    setState: (value) => setState(() {
                      account = value;
                      currency ??= state.getByUuid(value).currency;
                    }),
                    style: textTheme.numberMedium,
                    indent: indent,
                    width: offset,
                    focusOrder: focusOrder += 1,
                  ),
                  SizedBox(height: indent),
                  RequiredWidget(
                    title: AppLocalizations.of(context)!.budget,
                    showError: hasErrors && budget == null,
                  ),
                  ListBudgetSelector(
                    value: budget,
                    state: state,
                    setState: (value) => setState(() {
                      budget = value;
                      var bdgCurrency = state.getByUuid(value).currency;
                      currency ??= bdgCurrency;
                    }),
                    style: textTheme.numberMedium,
                    indent: indent,
                    width: offset,
                    focusOrder: focusOrder += 1,
                  ),
                  SizedBox(height: indent),
                  RowWidget(
                    indent: indent,
                    maxWidth: offset + indent,
                    chunk: const [0.3, 0.7],
                    children: [
                      [
                        Text(
                          AppLocalizations.of(context)!.currency,
                          style: textTheme.bodyLarge,
                        ),
                        Container(
                          color: Theme.of(context)
                              .colorScheme
                              .inversePrimary
                              .withOpacity(0.3),
                          width: double.infinity,
                          child: CurrencySelector(
                            value: currency,
                            setView: (Currency currency) => currency.code,
                            focusOrder: focusOrder += 1,
                            setState: (value) =>
                                setState(() => currency = value),
                          ),
                        ),
                      ],
                      [
                        RequiredWidget(
                          title: AppLocalizations.of(context)!.expense,
                          showError: hasErrors && bill == null,
                        ),
                        SimpleInput(
                          value: bill != null ? bill.toString() : '',
                          type: const TextInputType.numberWithOptions(
                              decimal: true),
                          tooltip: AppLocalizations.of(context)!.billSetTooltip,
                          style: textTheme.numberMedium,
                          formatter: [
                            SimpleInput.filterDouble,
                          ],
                          setState: (value) =>
                              setState(() => bill = double.tryParse(value)),
                          focusOrder: focusOrder += 1,
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: indent),
                  CurrencyExchangeInput(
                    width: offset + indent,
                    indent: indent,
                    target: currency,
                    state: state,
                    targetAmount: bill,
                    source: [
                      account != null
                          ? state.getByUuid(account!).currency
                          : null,
                      budget != null ? state.getByUuid(budget!).currency : null,
                    ].cast<Currency?>(),
                  ),
                  Text(
                    AppLocalizations.of(context)!.description,
                    style: textTheme.bodyLarge,
                  ),
                  SimpleInput(
                    value: description ?? '',
                    tooltip: AppLocalizations.of(context)!.descriptionTooltip,
                    style: textTheme.numberMedium,
                    setState: (value) => setState(() => description = value),
                    focusOrder: focusOrder += 1,
                  ),
                  SizedBox(height: indent),
                  Text(
                    AppLocalizations.of(context)!.expenseDateTime,
                    style: textTheme.bodyLarge,
                  ),
                  DateTimeInput(
                    style: textTheme.numberMedium,
                    width: offset,
                    value: createdAt ?? DateTime.now(),
                    setState: (value) => setState(() => createdAt = value),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: buildButton(context, constraints),
        );
      });
    });
  }
}
