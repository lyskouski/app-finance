// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/forms/list_account_selector.dart';
import 'package:app_finance/widgets/forms/simple_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';

class TransferTab extends StatefulWidget {
  Function callback;
  AppData? state;
  String? accountFrom;
  String accountErrorMessage = '';
  String? accountTo;
  double? amount;

  TransferTab({
    super.key,
    required this.callback,
    this.accountFrom,
    this.accountTo,
    this.amount,
  });

  @override
  TransferTabState createState() => TransferTabState();
}

class TransferTabState extends State<TransferTab> {
  String? accountFrom;
  String? accountTo;
  double? amount;

  @override
  void initState() {
    accountFrom = widget.accountFrom;
    accountTo = widget.accountTo;
    amount = widget.amount;
    super.initState();
  }

  bool hasFormErrors() {
    bool isError = false;
    if (accountFrom == null || accountTo == null) {
      widget.accountErrorMessage = AppLocalizations.of(context)!.isRequired;
      isError = true;
    }
    return isError;
  }

  void updateStorage() {
    String uuidFrom = accountFrom ?? '';
    AccountAppData from = widget.state?.getByUuid(uuidFrom);
    from.details -= amount ?? 0.0;
    widget.state?.update(AppDataType.accounts, uuidFrom, from);
    String uuidTo = accountTo ?? '';
    AccountAppData to = widget.state?.getByUuid(uuidTo);
    to.details += amount ?? 0.0;
    widget.state?.update(AppDataType.accounts, uuidTo, to);
  }

  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    String title = AppLocalizations.of(context)!.createTransferTooltip;
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
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent =
        ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 3;
    int focusOrder = FocusController.DEFAULT;

    return LayoutBuilder(builder: (context, constraints) {
      widget.callback(buildButton(context, constraints));
      return Consumer<AppData>(builder: (context, appState, _) {
        widget.state = appState;
        return SingleChildScrollView(
          controller: FocusController.getController(),
          child: Container(
            margin: EdgeInsets.fromLTRB(indent, indent, indent, 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.accountFrom}*',
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
                  value: accountFrom,
                  state: widget.state,
                  setState: (value) => setState(() {
                    accountFrom = value;
                  }),
                  style: textTheme.numberMedium,
                  indent: indent,
                  width: offset,
                  focusOrder: focusOrder += 1,
                ),
                SizedBox(height: indent),
                Row(
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.accountTo}*',
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
                  value: accountTo,
                  state: widget.state,
                  setState: (value) => setState(() {
                    accountTo = value;
                  }),
                  style: textTheme.numberMedium,
                  indent: indent,
                  width: offset,
                  focusOrder: focusOrder += 1,
                ),
                SizedBox(height: indent),
                Text(
                  AppLocalizations.of(context)!.expense,
                  style: textTheme.bodyLarge,
                ),
                SimpleInput(
                  value: amount != null ? amount.toString() : '',
                  type: const TextInputType.numberWithOptions(decimal: true),
                  tooltip: AppLocalizations.of(context)!.billTooltip,
                  style: textTheme.numberMedium,
                  formatter: [
                    SimpleInput.filterDouble,
                  ],
                  setState: (value) =>
                      setState(() => amount = double.tryParse(value)),
                  focusOrder: focusOrder += 1,
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
