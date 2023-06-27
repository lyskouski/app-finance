// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/forms/currency_selector.dart';
import 'package:app_finance/widgets/forms/list_account_selector.dart';
import 'package:app_finance/widgets/forms/list_budget_selector.dart';
import 'package:app_finance/widgets/forms/simple_input.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';

class ExpensesTab extends StatefulWidget {
  AppData? state;
  String? account;
  String accountErrorMessage = '';
  String? budget;
  String budgetErrorMessage = '';
  Currency? currency;
  double? bill;
  String? description;

  ExpensesTab({
    super.key,
    this.account,
    this.budget,
    this.currency,
    this.bill,
    this.description,
  });

  @override
  ExpensesTabState createState() => ExpensesTabState();
}

class ExpensesTabState extends State<ExpensesTab> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent =
        ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 3;

    return Consumer<AppData>(builder: (context, appState, _) {
      widget.state = appState;
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(indent, indent, indent, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${AppLocalizations.of(context)!.account}*',
                    style: textTheme.bodyLarge,
                  ),
                  Text(
                    widget.accountErrorMessage,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
              ListAccountSelector(
                value: widget.account,
                state: widget.state,
                setState: (value) => setState(() {
                  widget.account = value;
                  widget.currency ??= widget.state
                      ?.getByUuid(AppDataType.accounts, value)
                      .currency;
                }),
                style: textTheme.numberMedium,
                indent: indent,
                width: offset,
              ),
              SizedBox(height: indent),
              Row(
                children: [
                  Text(
                    '${AppLocalizations.of(context)!.budget}*',
                    style: textTheme.bodyLarge,
                  ),
                  Text(
                    widget.budgetErrorMessage,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
              ListBudgetSelector(
                value: widget.budget,
                state: widget.state,
                setState: (value) => setState(() {
                  widget.budget = value;
                  var bdgCurrency = widget.state
                      ?.getByUuid(AppDataType.budgets, value)
                      .currency;
                  var accCurrency = widget.account != null
                      ? widget.state
                          ?.getByUuid(
                              AppDataType.accounts, widget.account ?? '')
                          .currency
                      : null as Currency;
                  widget.currency = widget.currency == accCurrency
                      ? bdgCurrency
                      : widget.currency ?? accCurrency;
                }),
                style: textTheme.numberMedium,
                indent: indent,
                width: offset,
              ),
              SizedBox(height: indent),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: offset * 0.3,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            value: widget.currency,
                            setView: (Currency currency) => currency.code,
                            setState: (value) =>
                                setState(() => widget.currency = value),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: indent),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: offset * 0.7,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.expense,
                          style: textTheme.bodyLarge,
                        ),
                        SimpleInput(
                          value:
                              widget.bill != null ? widget.bill.toString() : '',
                          type: const TextInputType.numberWithOptions(
                              decimal: true),
                          tooltip: AppLocalizations.of(context)!.billTooltip,
                          style: textTheme.numberMedium,
                          formatter: [
                            SimpleInput.filterDouble,
                          ],
                          setState: (value) => setState(
                              () => widget.bill = double.tryParse(value)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: indent),
              Text(
                AppLocalizations.of(context)!.description,
                style: textTheme.bodyLarge,
              ),
              SimpleInput(
                value: widget.description ?? '',
                type: const TextInputType.numberWithOptions(decimal: true),
                tooltip: AppLocalizations.of(context)!.descriptionTooltip,
                style: textTheme.numberMedium,
                setState: (value) => setState(() => widget.description = value),
              ),
            ],
          ),
        ),
      );
    });
  }
}
