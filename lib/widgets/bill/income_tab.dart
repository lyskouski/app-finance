// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_forms/currency_exchange_input.dart';
import 'package:app_finance/widgets/_forms/currency_selector.dart';
import 'package:app_finance/widgets/_forms/date_time_input.dart';
import 'package:app_finance/widgets/_wrappers/full_sized_button_widget.dart';
import 'package:app_finance/widgets/_forms/list_account_selector.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/required_widget.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncomeTab extends StatefulWidget {
  final String? account;
  final String? description;
  final Currency? currency;
  final double? amount;
  final DateTime? createdAt;

  const IncomeTab({
    super.key,
    this.account,
    this.description,
    this.currency,
    this.amount,
    this.createdAt,
  });

  @override
  IncomeTabState createState() => IncomeTabState();
}

class IncomeTabState extends State<IncomeTab> with SharedPreferencesMixin {
  late AppData state;
  String? account;
  Currency? currency;
  late TextEditingController amount;
  late TextEditingController description;
  late DateTime createdAt;
  double? amountValue;
  bool hasErrors = false;
  bool isFresh = true;

  @override
  void initState() {
    account = widget.account;
    currency = widget.currency;
    createdAt = widget.createdAt ?? DateTime.now();
    amount = TextEditingController(text: widget.amount != null ? widget.amount.toString() : '');
    description = TextEditingController(text: widget.description);
    amountValue = widget.amount;
    super.initState();
  }

  void _loadPreferences() {
    setState(() {
      isFresh = false;
      final value = getPreference(prefAccount);
      var obj = state.getByUuid(value ?? '');
      account ??= obj?.uuid;
      currency ??= obj?.currency;

      final currencyId = getPreference(prefCurrency);
      currency ??= CurrencyProvider.findByCode(currencyId);
    });
  }

  bool hasFormErrors() {
    setState(() => hasErrors = account == null);
    return hasErrors;
  }

  void updateStorage() {
    String uuid = account ?? '';
    setPreference(prefAccount, uuid);
    state.add(InvoiceAppData(
      title: description.text,
      color: state.getByUuid(uuid)?.color,
      account: uuid,
      details: double.tryParse(amount.text),
      currency: currency,
      createdAt: createdAt,
    ));
  }

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
      title: AppLocale.labels.createIncomeTooltip,
      icon: Icons.save,
    );
  }

  @override
  Widget build(BuildContext context) {
    // FocusController.dispose();
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent = ThemeHelper.getIndent(2);
    double width = ThemeHelper.getWidth(context, 6);
    FocusController.init();

    return LayoutBuilder(builder: (context, constraints) {
      return Consumer<AppData>(builder: (context, appState, _) {
        state = appState;
        if (isFresh) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _loadPreferences());
        }
        return Scaffold(
          body: SingleChildScrollView(
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
                    state: state,
                    setState: (value) => setState(() {
                      account = value;
                      currency = state.getByUuid(value).currency;
                    }),
                    indent: indent,
                    width: width,
                  ),
                  ThemeHelper.hIndent2x,
                  RowWidget(
                    indent: indent,
                    maxWidth: width + indent,
                    chunk: const [120, null],
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
                        Text(
                          AppLocale.labels.expense,
                          style: textTheme.bodyLarge,
                        ),
                        SimpleInput(
                          controller: amount,
                          type: const TextInputType.numberWithOptions(decimal: true),
                          tooltip: AppLocale.labels.billSetTooltip,
                          setState: (v) => setState(() => amountValue = double.tryParse(v)),
                          formatter: [
                            SimpleInput.filterDouble,
                          ],
                        ),
                      ],
                    ],
                  ),
                  ThemeHelper.hIndent2x,
                  CurrencyExchangeInput(
                    width: width,
                    indent: indent,
                    target: currency,
                    state: state,
                    targetAmount: amountValue,
                    source: <Currency?>[
                      account != null ? state.getByUuid(account!).currency : null,
                    ],
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
                    AppLocale.labels.balanceDate,
                    style: textTheme.bodyLarge,
                  ),
                  DateTimeInput(
                    width: width,
                    value: createdAt,
                    setState: (value) => setState(() => createdAt = value),
                  ),
                  ThemeHelper.formEndBox,
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
