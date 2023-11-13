// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_add_page.dart';
import 'package:app_finance/design/form/date_time_input.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class AccountAddPage extends AbstractAddPage {
  final String? title;
  final String? description;
  final String? type;
  final Currency? currency;
  final DateTime? validTillDate;
  final double? balance;
  final IconData? icon;
  final MaterialColor? color;

  const AccountAddPage({
    super.key,
    this.title,
    this.description,
    this.type,
    this.currency,
    this.validTillDate,
    this.balance,
    this.icon,
    this.color,
  });

  @override
  AccountAddPageState createState() => AccountAddPageState();
}

class AccountAddPageState<T extends AccountAddPage> extends AbstractAddPageState<AccountAddPage> {
  final focus = FocusController();
  late TextEditingController title;
  late TextEditingController description;
  String? type;
  Currency? currency;
  DateTime? validTillDate;
  DateTime balanceUpdateDate = DateTime.now();
  late TextEditingController balance;
  IconData? icon;
  MaterialColor? color;

  @override
  void initState() {
    title = TextEditingController(text: widget.title);
    description = TextEditingController(text: widget.description);
    type = widget.type;
    validTillDate = widget.validTillDate;
    balance = TextEditingController(text: widget.balance != null ? widget.balance.toString() : '');
    icon = widget.icon;
    color = widget.color;
    final currencyId = AppPreferences.get(AppPreferences.prefCurrency);
    currency = widget.currency ?? CurrencyProvider.find(currencyId);
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  String getTitle() => AppLocale.labels.createAccountHeader;

  @override
  bool hasFormErrors() {
    setState(() => hasError = type == null || type!.isEmpty || title.text.isEmpty);
    return hasError;
  }

  @override
  void updateStorage() {
    if (currency != null) {
      CurrencyProvider.pin(currency!);
    }
    state.add(AccountAppData(
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

  @override
  String getButtonName() => AppLocale.labels.createAccountTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FullSizedButtonWidget(
      constraints: constraints,
      controller: focus,
      setState: () => triggerActionButton(nav),
      title: getButtonName(),
      icon: Icons.save,
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final TextTheme textTheme = context.textTheme;
    double indent = ThemeHelper.getIndent(2);
    double width = ThemeHelper.getWidth(context, 6, constraints);

    return SingleScrollWrapper(
      controller: focus,
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputWrapper.select(
              isRequired: true,
              value: type,
              title: AppLocale.labels.accountType,
              tooltip: AppLocale.labels.accountTypeTooltip,
              showError: hasError && type == null,
              options: AccountType.getList(),
              onChange: (value) => setState(() => type = value),
            ),
            InputWrapper.text(
              isRequired: true,
              controller: title,
              title: AppLocale.labels.title,
              tooltip: AppLocale.labels.titleAccountTooltip,
              showError: hasError && title.text.isEmpty,
            ),
            RowWidget(
              indent: indent,
              maxWidth: width + indent,
              chunk: const [80, 80, null],
              children: [
                [
                  InputWrapper.icon(
                    value: icon,
                    title: AppLocale.labels.icon,
                    onChange: (value) => setState(() => icon = value),
                  ),
                ],
                [
                  InputWrapper.color(
                    value: color,
                    title: AppLocale.labels.color,
                    onChange: (value) => setState(() => color = value),
                  ),
                ],
                [
                  InputWrapper.text(
                    controller: description,
                    title: AppLocale.labels.details,
                    tooltip: AppLocale.labels.detailsTooltip,
                  ),
                ],
              ],
            ),
            InputWrapper.currency(
              value: currency?.code,
              title: AppLocale.labels.currency,
              tooltip: AppLocale.labels.currencyTooltip,
              onChange: (value) => setState(() => currency = value),
            ),
            if (!AccountType.contains(type ?? '', [AppAccountType.account, AppAccountType.cash]))
              InputWrapper(
                type: NamedInputType.ymSelector,
                title: AppLocale.labels.validTillDate,
                value: validTillDate,
                onChange: (value) => setState(() => validTillDate = value),
              ),
            InputWrapper.text(
              title: AppLocale.labels.balance,
              tooltip: AppLocale.labels.balanceTooltip,
              controller: balance,
              inputType: const TextInputType.numberWithOptions(decimal: true),
              formatter: [
                SimpleInputFormatter.filterDouble,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWrapper(
                  AppLocale.labels.balanceDate,
                  style: textTheme.bodyLarge,
                ),
                Tooltip(
                  message: AppLocale.labels.balanceDateTooltip,
                  child: const Icon(Icons.info_outline),
                ),
              ],
            ),
            DateTimeInput(
              width: width,
              value: balanceUpdateDate,
              setState: (value) => setState(() => balanceUpdateDate = value),
            ),
            ThemeHelper.hIndent2x,
          ],
        ),
      ),
    );
  }
}
