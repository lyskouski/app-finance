// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency_app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class CurrencyAddPage extends AbstractAddPage {
  const CurrencyAddPage({super.key});

  @override
  CurrencyAddPageState createState() => CurrencyAddPageState();
}

class CurrencyAddPageState extends AbstractAddPageState<CurrencyAddPage> {
  late FocusController focus;
  Currency? currencyFrom;
  Currency? currencyTo;
  late TextEditingController conversion;

  @override
  void initState() {
    focus = FocusController();
    conversion = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    conversion.dispose();
    super.dispose();
  }

  @override
  String getTitle() => AppLocale.labels.currencyAddHeadline;

  @override
  String getButtonName() => AppLocale.labels.currencyAddTooltip;

  @override
  bool hasFormErrors() {
    setState(() => hasError = currencyFrom == null ||
        currencyTo == null ||
        currencyFrom == currencyTo ||
        conversion.text.isEmpty ||
        double.tryParse(conversion.text) == 1.0);
    return hasError;
  }

  @override
  void updateStorage() {
    final exchange = CurrencyAppData(
      currency: currencyTo,
      currencyFrom: currencyFrom,
      details: double.tryParse(conversion.text) ?? 1.0,
    );
    state.update(exchange.uuid, exchange, true);
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'currency_page_add',
      onPressed: () => triggerActionButton(nav),
      tooltip: getButtonName(),
      child: const Icon(Icons.save),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final indent = ThemeHelper.getIndent();
    return SingleScrollWrapper(
      controller: focus,
      child: Padding(
        padding: EdgeInsets.all(indent),
        child: Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            InputWrapper.currency(
              isRequired: true,
              showError: hasError && currencyFrom == null,
              value: currencyFrom,
              title: '${AppLocale.labels.currency} (${AppLocale.labels.from})',
              tooltip: AppLocale.labels.currencyTooltip,
              onChange: (value) => setState(() => currencyFrom = value),
            ),
            InputWrapper.currency(
              isRequired: true,
              showError: hasError && (currencyTo == null || currencyFrom == currencyTo),
              value: currencyTo,
              title: '${AppLocale.labels.currency} (${AppLocale.labels.to})',
              tooltip: AppLocale.labels.currencyTooltip,
              onChange: (value) => setState(() => currencyTo = value),
            ),
            InputWrapper.text(
              title: AppLocale.labels.currencyExchange(currencyFrom?.code ?? '?', currencyTo?.code ?? '?'),
              tooltip: AppLocale.labels.conversion,
              isRequired: true,
              showError: hasError && (conversion.text.isEmpty || double.tryParse(conversion.text) == 1.0),
              controller: conversion,
              inputType: const TextInputType.numberWithOptions(decimal: true),
              formatter: [
                SimpleInputFormatter.filterDouble,
              ],
            ),
            ThemeHelper.formEndBox,
          ],
        ),
      ),
    );
  }
}
