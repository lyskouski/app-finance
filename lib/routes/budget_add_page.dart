// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/data/budget_app_data.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/forms/color_selector.dart';
import 'package:app_finance/widgets/forms/currency_selector.dart';
import 'package:app_finance/widgets/forms/icon_selector.dart';
import 'package:app_finance/widgets/forms/simple_input.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BudgetAddPage extends AbstractPage {
  String? title;
  String titleErrorMessage = '';
  double? budgetLimit;
  IconData? icon;
  MaterialColor? color;
  Currency? currency;

  BudgetAddPage({
    this.title,
    this.budgetLimit,
    this.icon,
    this.color,
    this.currency,
  }) : super();

  @override
  BudgetAddPageState createState() => BudgetAddPageState();
}

class BudgetAddPageState<T extends BudgetAddPage>
    extends AbstractPageState<BudgetAddPage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.createBudgetHeader;
  }

  bool hasFormErrors() {
    bool isError = false;
    if (widget.title == null || widget.title!.isEmpty) {
      widget.titleErrorMessage = AppLocalizations.of(context)!.isRequired;
      isError = true;
    }
    return isError;
  }

  void updateStorage() {
    widget.state?.add(
        AppDataType.budgets,
        BudgetAppData(
          title: widget.title ?? '',
          amountLimit: widget.budgetLimit ?? 0.0,
          progress: 0.0,
          color: widget.color ?? Colors.red,
          hidden: false,
          currency: widget.currency,
        ));
  }

  String getButtonName() {
    return AppLocalizations.of(context)!.createBudgetTooltip;
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
            Navigator.popAndPushNamed(context, AppRoute.budgetRoute);
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
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent =
        ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 3;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${AppLocalizations.of(context)!.title}*',
                  style: textTheme.bodyLarge,
                ),
                Text(
                  widget.titleErrorMessage,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
            SimpleInput(
              value: widget.title,
              tooltip: AppLocalizations.of(context)!.titleAccountTooltip,
              style: textTheme.numberMedium,
              setState: (value) => setState(() => widget.title = value),
            ),
            SizedBox(height: indent),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: offset * 0.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.icon,
                        style: textTheme.bodyLarge,
                      ),
                      IconSelector(
                        value: widget.icon,
                        setState: (value) =>
                            setState(() => widget.icon = value),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: indent),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: offset * 0.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.color,
                        style: textTheme.bodyLarge,
                      ),
                      ColorSelector(
                        value: widget.color,
                        setState: (value) =>
                            setState(() => widget.color = value),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: indent),
            Text(
              AppLocalizations.of(context)!.budgetLimit,
              style: textTheme.bodyLarge,
            ),
            SimpleInput(
              value: widget.budgetLimit != null
                  ? widget.budgetLimit.toString()
                  : '',
              type: const TextInputType.numberWithOptions(decimal: true),
              tooltip: AppLocalizations.of(context)!.balanceTooltip,
              style: textTheme.numberMedium,
              formatter: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}')),
              ],
              setState: (value) =>
                  setState(() => widget.budgetLimit = double.tryParse(value)),
            ),
            SizedBox(height: indent),
            Text(
              AppLocalizations.of(context)!.currency,
              style: textTheme.bodyLarge,
            ),
            Container(
              color:
                  Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
              width: double.infinity,
              child: CurrencySelector(
                value: widget.currency,
                setState: (value) => setState(() => widget.currency = value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
