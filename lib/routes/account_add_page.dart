// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/classes/account_app_data.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/classes/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/forms/color_selector.dart';
import 'package:app_finance/widgets/forms/currency_selector.dart';
import 'package:app_finance/widgets/forms/date_input.dart';
import 'package:app_finance/widgets/forms/datet_time_input.dart';
import 'package:app_finance/widgets/forms/icon_selector.dart';
import 'package:app_finance/widgets/forms/list_selector.dart';
import 'package:app_finance/widgets/forms/simple_input.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AccountAddPage extends AbstractPage {
  String? title;
  String titleErrorMessage = '';
  String? description;
  String? type;
  String typeErrorMessage = '';
  Currency? currency;
  DateTime? validTillDate;
  DateTime balanceUpdateDate = DateTime.now();
  double? balance;
  IconData? icon;
  MaterialColor? color;

  AccountAddPage({
    this.title,
    this.description,
    this.type,
    this.currency,
    this.validTillDate,
    this.balance,
    this.icon,
    this.color,
  }) : super();

  @override
  AccountAddPageState createState() => AccountAddPageState();
}

class AccountAddPageState<T extends AccountAddPage>
    extends AbstractPageState<AccountAddPage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.createAccountHeader;
  }

  bool hasFormErrors() {
    bool isError = false;
    if (widget.type == null || widget.type!.isEmpty) {
      widget.typeErrorMessage = AppLocalizations.of(context)!.isRequired;
      isError = true;
    }
    if (widget.title == null || widget.title!.isEmpty) {
      widget.titleErrorMessage = AppLocalizations.of(context)!.isRequired;
      isError = true;
    }
    return isError;
  }

  void updateStorage() {
    widget.state?.add(AppDataType.accounts, AccountAppData(
      title: widget.title ?? '',
      type: widget.type ?? AppAccountType.cash.toString(),
      description: widget.description ?? '',
      details: widget.balance ?? 0.0,
      progress: 1.0,
      color: widget.color ?? Colors.red,
      currency: widget.currency,
      hidden: false,
      icon: widget.icon,
      closedAt: widget.validTillDate,
      createdAt: widget.balanceUpdateDate,
    ));
  }
  
  String getButtonName() {
    return AppLocalizations.of(context)!.createAccountTooltip;
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
            Navigator.popAndPushNamed(context, AppRoute.accountRoute);
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

  List<ListSelectorItem> getAccountTypes(BuildContext context) {
    return [
      ListSelectorItem(
          id: AppAccountType.account.toString(),
          name: AppLocalizations.of(context)!.bankAccount),
      ListSelectorItem(
          id: AppAccountType.cash.toString(),
          name: AppLocalizations.of(context)!.cash),
      ListSelectorItem(
          id: AppAccountType.debitCard.toString(),
          name: AppLocalizations.of(context)!.debitCard),
      ListSelectorItem(
          id: AppAccountType.creditCard.toString(),
          name: AppLocalizations.of(context)!.creditCard),
      ListSelectorItem(
          id: AppAccountType.deposit.toString(),
          name: AppLocalizations.of(context)!.deposit),
      ListSelectorItem(
          id: AppAccountType.credit.toString(),
          name: AppLocalizations.of(context)!.credit),
    ];
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent =
        ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 3;
    double offsetTriple = offset - indent;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${AppLocalizations.of(context)!.accountType}*',
                  style: textTheme.bodyLarge,
                ),
                Text(
                  widget.typeErrorMessage,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
            ListSelector(
              value: widget.type,
              options: getAccountTypes(context),
              setState: (value) => setState(() => widget.type = value),
              style: textTheme.numberMedium,
              indent: indent,
            ),
            SizedBox(height: indent),
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
                    maxWidth: offsetTriple * 0.2,
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
                    maxWidth: offsetTriple * 0.2,
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
                SizedBox(width: indent),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: offsetTriple * 0.6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.details,
                        style: textTheme.bodyLarge,
                      ),
                      SimpleInput(
                        value: widget.description,
                        tooltip: AppLocalizations.of(context)!.detailsTooltip,
                        style: textTheme.numberMedium,
                        setState: (value) =>
                            setState(() => widget.description = value),
                      ),
                    ],
                  ),
                ),
              ],
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
            SizedBox(height: indent),
            Text(
              AppLocalizations.of(context)!.validTillDate,
              style: textTheme.bodyLarge,
            ),
            DateInput(
              value: widget.validTillDate,
              setState: (value) => setState(() => widget.validTillDate = value),
              style: textTheme.numberMedium,
            ),
            SizedBox(height: indent),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.balanceDate,
                  style: textTheme.bodyLarge,
                ),
                Tooltip(
                  message: AppLocalizations.of(context)!.balanceDateTooltip,
                  child: const Icon(Icons.info_outline),
                ),
              ],
            ),
            DateTimeInput(
              style: textTheme.numberMedium,
              width: offset,
              value: widget.balanceUpdateDate,
              setState: (value) =>
                  setState(() => widget.balanceUpdateDate = value),
            ),
            SizedBox(height: indent),
            Text(
              AppLocalizations.of(context)!.balance,
              style: textTheme.bodyLarge,
            ),
            SimpleInput(
              value: widget.balance != null ? widget.balance.toString() : '',
              type: const TextInputType.numberWithOptions(decimal: true),
              tooltip: AppLocalizations.of(context)!.balanceTooltip,
              style: textTheme.numberMedium,
              formatter: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}')),
              ],
              setState: (value) =>
                  setState(() => widget.balance = double.tryParse(value)),
            ),
          ],
        ),
      ),
    );
  }
}
