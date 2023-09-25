// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/widgets/form/currency_exchange_input.dart';
import 'package:app_finance/widgets/form/date_time_input.dart';
import 'package:app_finance/widgets/wrapper/full_sized_button_widget.dart';
import 'package:app_finance/widgets/wrapper/required_widget.dart';
import 'package:app_finance/widgets/wrapper/row_widget.dart';
import 'package:app_finance/widgets/form/currency_selector.dart';
import 'package:app_finance/widgets/form/list_account_selector.dart';
import 'package:app_finance/widgets/form/simple_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class TransferTab extends StatefulWidget {
  final String? accountFrom;
  final String? accountTo;
  final double? amount;
  final String? description;
  final Currency? currency;
  final DateTime? createdAt;
  final AppData state;

  const TransferTab({
    super.key,
    required this.state,
    this.accountFrom,
    this.accountTo,
    this.amount,
    this.description,
    this.currency,
    this.createdAt,
  });

  @override
  TransferTabState createState() => TransferTabState();
}

class TransferTabState extends AbstractPageState<TransferTab> {
  String? accountFrom;
  String? accountTo;
  late TextEditingController amount;
  late TextEditingController description;
  late DateTime createdAt;
  Currency? currency;
  bool hasErrors = false;
  bool isPushed = false;

  @override
  void initState() {
    accountFrom = widget.accountFrom;
    accountTo = widget.accountTo;
    createdAt = widget.createdAt ?? DateTime.now();
    amount = TextEditingController(text: widget.amount != null ? widget.amount.toString() : '');
    description = TextEditingController(text: widget.description);
    currency = widget.currency;
    super.initState();
  }

  @override
  dispose() {
    isPushed = false;
    amount.dispose();
    description.dispose();
    super.dispose();
  }

  bool hasFormErrors() {
    setState(() => hasErrors = accountFrom == null || accountTo == null);
    return hasErrors;
  }

  @override
  String getTitle() => AppLocale.labels.createBillHeader;

  void updateStorage() {
    final uuid = accountFrom ?? '';
    widget.state.add(InvoiceAppData(
      title: description.text,
      color: widget.state.getByUuid(uuid)?.color,
      account: accountTo ?? '',
      accountFrom: uuid,
      details: double.tryParse(amount.text),
      currency: currency,
      createdAt: createdAt,
    ));
  }

  @override
  String getButtonName() => AppLocale.labels.createTransferTooltip;

  @override
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
      title: getButtonName(),
      icon: Icons.save,
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final TextTheme textTheme = context.textTheme;
    double indent = ThemeHelper.getIndent(2);
    double width = ThemeHelper.getWidth(context, 6);

    return SingleChildScrollView(
      controller: FocusController.getController(runtimeType),
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequiredWidget(
              title: AppLocale.labels.accountFrom,
              showError: hasErrors && accountFrom == null,
            ),
            ListAccountSelector(
              value: accountFrom,
              hintText: AppLocale.labels.accountFrom,
              state: widget.state,
              setState: (value) => setState(() => accountFrom = value),
              width: width,
            ),
            ThemeHelper.hIndent2x,
            RequiredWidget(
              title: AppLocale.labels.accountTo,
              showError: hasErrors && accountTo == null,
            ),
            ListAccountSelector(
              value: accountTo,
              hintText: AppLocale.labels.accountTo,
              state: widget.state,
              setState: (value) => setState(() {
                accountTo = value;
                currency = widget.state.getByUuid(value).currency;
              }),
              width: width,
            ),
            ThemeHelper.hIndent2x,
            RowWidget(
              indent: indent,
              maxWidth: width + indent,
              chunk: const [125, null],
              children: [
                [
                  Text(
                    AppLocale.labels.currency,
                    style: textTheme.bodyLarge,
                  ),
                  CodeCurrencySelector(
                    value: currency?.code,
                    context: context,
                    update: (value) => setState(() => currency = value),
                  ),
                ],
                [
                  Text(
                    AppLocale.labels.expenseTransfer,
                    style: textTheme.bodyLarge,
                  ),
                  SimpleInput(
                    controller: amount,
                    type: const TextInputType.numberWithOptions(decimal: true),
                    tooltip: AppLocale.labels.billSetTooltip,
                    formatter: [SimpleInput.filterDouble],
                  ),
                ],
              ],
            ),
            ThemeHelper.hIndent2x,
            CurrencyExchangeInput(
              width: width + indent,
              indent: indent,
              target: currency,
              state: widget.state,
              targetController: amount,
              source: <Currency?>[
                accountFrom != null ? widget.state.getByUuid(accountFrom!).currency : null,
                accountTo != null ? widget.state.getByUuid(accountTo!).currency : null,
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
    );
  }
}
