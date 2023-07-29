// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_forms/color_selector.dart';
import 'package:app_finance/widgets/_forms/currency_selector.dart';
import 'package:app_finance/widgets/_forms/date_time_input.dart';
import 'package:app_finance/widgets/_forms/icon_selector.dart';
import 'package:app_finance/widgets/_forms/list_selector.dart';
import 'package:app_finance/widgets/_forms/month_year_input.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/required_widget.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AccountAddPage extends AbstractPage {
  final String? title;
  final String? description;
  final String? type;
  final Currency? currency;
  final DateTime? validTillDate;
  final double? balance;
  final IconData? icon;
  final MaterialColor? color;

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
    extends AbstractPageState<AccountAddPage> with SharedPreferencesMixin {
  String? title;
  String? description;
  String? type;
  Currency? currency;
  DateTime? validTillDate;
  DateTime balanceUpdateDate = DateTime.now();
  double? balance;
  IconData? icon;
  MaterialColor? color;
  bool hasError = false;

  @override
  void initState() {
    title = widget.title;
    description = widget.description;
    type = widget.type;
    currency = widget.currency;
    validTillDate = widget.validTillDate;
    balance = widget.balance;
    icon = widget.icon;
    color = widget.color;
    getPreference(prefCurrency).then((currencyId) => setState(() {
          currency ??= CurrencyService().findByCode(currencyId);
        }));
    super.initState();
  }

  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.createAccountHeader;
  }

  bool hasFormErrors() {
    setState(() => hasError =
        type == null || type!.isEmpty || title == null || title!.isEmpty);
    return hasError;
  }

  void updateStorage() {
    super.state.add(
        AppDataType.accounts,
        AccountAppData(
          title: title ?? '',
          type: type ?? AppAccountType.cash.toString(),
          description: description ?? '',
          details: balance ?? 0.0,
          progress: 1.0,
          color: color ?? Colors.red,
          currency: currency,
          hidden: false,
          icon: icon,
          closedAt: validTillDate,
          createdAt: balanceUpdateDate,
        ));
  }

  String getButtonName() {
    return AppLocalizations.of(context)!.createAccountTooltip;
  }

  void triggerActionButton(BuildContext context) {
    setState(() {
      if (hasFormErrors()) {
        return;
      }
      updateStorage();
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    String title = getButtonName();
    FocusController.setContext(6);
    return SizedBox(
      width: constraints.maxWidth - ThemeHelper.getIndent() * 4,
      child: FloatingActionButton(
        onPressed: () => triggerActionButton(context),
        focusNode: FocusController.getFocusNode(),
        tooltip: title,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.save),
              SizedBox(height: ThemeHelper.getIndent()),
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
    double indent = ThemeHelper.getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 3;
    int focusOrder = FocusController.DEFAULT;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequiredWidget(
              title: AppLocalizations.of(context)!.accountType,
              showError: hasError && type == null,
            ),
            ListSelector(
              value: type,
              options: getAccountTypes(context),
              setState: (value) => setState(() => type = value),
              style: textTheme.numberMedium
                  .copyWith(color: textTheme.headlineSmall?.color),
              indent: indent,
              focusOrder: focusOrder += 1,
            ),
            SizedBox(height: indent),
            RequiredWidget(
              title: AppLocalizations.of(context)!.title,
              showError: hasError && (title == null || title!.isEmpty),
            ),
            SimpleInput(
              value: title,
              tooltip: AppLocalizations.of(context)!.titleAccountTooltip,
              style: textTheme.numberMedium
                  .copyWith(color: textTheme.headlineSmall?.color),
              setState: (value) => setState(() => title = value),
              focusOrder: focusOrder += 1,
            ),
            SizedBox(height: indent),
            RowWidget(
              indent: indent,
              maxWidth: offset,
              chunk: const [0.2, 0.2, 0.6],
              children: [
                [
                  Text(
                    AppLocalizations.of(context)!.icon,
                    style: textTheme.bodyLarge,
                  ),
                  IconSelector(
                    value: icon,
                    setState: (value) => setState(() => icon = value),
                    // focusOrder: focusOrder += 1,
                  ),
                ],
                [
                  Text(
                    AppLocalizations.of(context)!.color,
                    style: textTheme.bodyLarge,
                  ),
                  ColorSelector(
                    value: color,
                    setState: (value) => setState(() => color = value),
                    // focusOrder: focusOrder += 1,
                  ),
                ],
                [
                  Text(
                    AppLocalizations.of(context)!.details,
                    style: textTheme.bodyLarge,
                  ),
                  SimpleInput(
                    value: description,
                    tooltip: AppLocalizations.of(context)!.detailsTooltip,
                    style: textTheme.numberMedium
                        .copyWith(color: textTheme.headlineSmall?.color),
                    setState: (value) => setState(() => description = value),
                    focusOrder: focusOrder += 1,
                  ),
                ],
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
                value: currency,
                setState: (value) => setState(() => currency = value),
                focusOrder: focusOrder += 1,
              ),
            ),
            SizedBox(height: indent),
            Text(
              AppLocalizations.of(context)!.validTillDate,
              style: textTheme.bodyLarge,
            ),
            MonthYearInput(
              value: validTillDate,
              setState: (value) => setState(() => validTillDate = value),
              style: textTheme.numberMedium
                  .copyWith(color: textTheme.headlineSmall?.color),
              focusOrder: focusOrder += 1,
            ),
            SizedBox(height: indent),
            Text(
              AppLocalizations.of(context)!.balance,
              style: textTheme.bodyLarge,
            ),
            SimpleInput(
              value: balance != null ? balance.toString() : '',
              type: const TextInputType.numberWithOptions(decimal: true),
              tooltip: AppLocalizations.of(context)!.balanceTooltip,
              style: textTheme.numberMedium
                  .copyWith(color: textTheme.headlineSmall?.color),
              formatter: [
                SimpleInput.filterDouble,
              ],
              setState: (value) =>
                  setState(() => balance = double.tryParse(value)),
              focusOrder: focusOrder += 1,
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
              style: textTheme.numberMedium
                  .copyWith(color: textTheme.headlineSmall?.color),
              width: offset,
              value: balanceUpdateDate,
              setState: (value) => setState(() => balanceUpdateDate = value),
            ),
          ],
        ),
      ),
    );
  }
}
