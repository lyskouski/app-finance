// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/_forms/currency_selector.dart';
import 'package:app_finance/widgets/_forms/list_account_selector.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/required_widget.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';

class IncomeTab extends StatefulWidget {
  final String? account;
  final Currency? currency;
  final double? amount;

  const IncomeTab({
    super.key,
    this.account,
    this.currency,
    this.amount,
  });

  @override
  IncomeTabState createState() => IncomeTabState();
}

class IncomeTabState extends State<IncomeTab> with SharedPreferencesMixin {
  late AppData state;
  String? account;
  Currency? currency;
  double? amount;
  bool hasErrors = false;

  @override
  void initState() {
    account = widget.account;
    currency = widget.currency;
    amount = widget.amount;
    super.initState();
    getPreference(prefAccount).then((value) => setState(() {
          account ??= value;
          currency ??= state.getByUuid(value ?? '')?.currency;
        }));
  }

  bool hasFormErrors() {
    setState(() => hasErrors = account == null);
    return hasErrors;
  }

  void updateStorage() {
    String uuid = account ?? '';
    setPreference(prefAccount, uuid);
    AccountAppData value = state.getByUuid(uuid);
    value.details += amount ?? 0.0;
    value.currency = currency;
    state.update(AppDataType.accounts, uuid, value);
  }

  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    String title = AppLocalizations.of(context)!.createIncomeTooltip;
    FocusController.setContext(3);
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
                            setState: (value) =>
                                setState(() => currency = value),
                            focusOrder: focusOrder += 1,
                          ),
                        ),
                      ],
                      [
                        Text(
                          AppLocalizations.of(context)!.expense,
                          style: textTheme.bodyLarge,
                        ),
                        SimpleInput(
                          value: amount != null ? amount.toString() : '',
                          type: const TextInputType.numberWithOptions(
                              decimal: true),
                          tooltip: AppLocalizations.of(context)!.billSetTooltip,
                          style: textTheme.numberMedium,
                          formatter: [
                            SimpleInput.filterDouble,
                          ],
                          setState: (value) =>
                              setState(() => amount = double.tryParse(value)),
                          focusOrder: focusOrder += 1,
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: indent),
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
