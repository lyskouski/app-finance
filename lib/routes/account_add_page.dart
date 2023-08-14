// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/currency/currency_provider.dart';
import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/data/account_type.dart';
import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_forms/color_selector.dart';
import 'package:app_finance/widgets/_forms/currency_selector.dart';
import 'package:app_finance/widgets/_forms/date_time_input.dart';
import 'package:app_finance/widgets/_forms/full_sized_button.dart';
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

class AccountAddPageState<T extends AccountAddPage> extends AbstractPageState<AccountAddPage>
    with SharedPreferencesMixin {
  late TextEditingController title;
  late TextEditingController description;
  String? type;
  Currency? currency;
  DateTime? validTillDate;
  DateTime balanceUpdateDate = DateTime.now();
  late TextEditingController balance;
  IconData? icon;
  MaterialColor? color;
  bool hasError = false;

  @override
  void initState() {
    title = TextEditingController(text: widget.title);
    description = TextEditingController(text: widget.description);
    type = widget.type;
    validTillDate = widget.validTillDate;
    balance = TextEditingController(text: widget.balance != null ? widget.balance.toString() : '');
    icon = widget.icon;
    color = widget.color;
    final currencyId = getPreference(prefCurrency);
    currency = widget.currency ?? CurrencyProvider.findByCode(currencyId);
    super.initState();
  }

  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.createAccountHeader;
  }

  bool hasFormErrors() {
    setState(() => hasError = type == null || type!.isEmpty || title.text.isEmpty);
    return hasError;
  }

  void updateStorage() {
    super.state.add(
        AppDataType.accounts,
        AccountAppData(
          title: title.text,
          type: type ?? AppAccountType.cash.toString(),
          description: description.text,
          details: double.tryParse(balance.text) ?? 0.0,
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
    return FullSizedButton(
      constraints: constraints,
      setState: () => triggerActionButton(context),
      title: getButtonName(),
      icon: Icons.save,
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent = ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 3;
    FocusController.init();

    return SingleChildScrollView(
      controller: FocusController.getController(runtimeType),
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequiredWidget(
              title: AppLocalizations.of(context)!.accountType,
              showError: hasError && type == null,
            ),
            ListSelector(
              value: type,
              options: AccountType(context).toList(),
              setState: (value) => setState(() => type = value),
              style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
              indent: indent,
            ),
            SizedBox(height: indent),
            RequiredWidget(
              title: AppLocalizations.of(context)!.title,
              showError: hasError && title.text.isEmpty,
            ),
            SimpleInput(
              controller: title,
              tooltip: AppLocalizations.of(context)!.titleAccountTooltip,
              style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
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
                    controller: description,
                    tooltip: AppLocalizations.of(context)!.detailsTooltip,
                    style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
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
              color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
              width: double.infinity,
              child: CurrencySelector(
                value: currency?.code,
                setState: (value) => setState(() => currency = value),
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
              style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
            ),
            SizedBox(height: indent),
            Text(
              AppLocalizations.of(context)!.balance,
              style: textTheme.bodyLarge,
            ),
            SimpleInput(
              controller: balance,
              type: const TextInputType.numberWithOptions(decimal: true),
              tooltip: AppLocalizations.of(context)!.balanceTooltip,
              style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
              formatter: [
                SimpleInput.filterDouble,
              ],
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
              style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
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
