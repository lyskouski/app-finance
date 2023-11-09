// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/gauge_chart.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class ProfitWidget extends StatelessWidget {
  final AppData store;
  final double width;
  late final List<GoalAppData> goals;
  late final double maxValue;
  late final double valInvoice;
  late final double valBill;

  ProfitWidget({
    super.key,
    required this.store,
    required this.width,
  }) {
    goals = store.getList(AppDataType.goals).cast();
    maxValue = _getMaxValue(goals);
    valInvoice = _getValue(AppDataType.invoice);
    valBill = _getValue(AppDataType.bills);
  }

  double _getMaxValue(List<GoalAppData> goals) {
    final exchange = Exchange(store: store);
    final now = DateTime.now();
    return goals.fold(0.0, (prev, e) {
      double left = e.closedAt.difference(now).inDays / 30;
      if (left < 1) {
        left = 1;
      }
      double value = (1 - e.progress) * exchange.reform(e.details, e.currency, Exchange.defaultCurrency);
      return prev + value / left;
    });
  }

  double _getValue(AppDataType type) {
    final exchange = Exchange(store: store);
    return store
        .getActualList(type)
        .where((v) => type != AppDataType.invoice || (v as InvoiceAppData).accountFrom == null)
        .fold(0.0, (prev, e) => prev + exchange.reform(e.details, e.currency, Exchange.defaultCurrency));
  }

  @override
  Widget build(BuildContext context) {
    final indent = ThemeHelper.getIndent();
    final textStyle = context.textTheme.numberSmall;
    final value = valInvoice - valBill;
    return RowWidget(
      alignment: MainAxisAlignment.start,
      indent: indent,
      maxWidth: width,
      chunk: const [null, null],
      children: [
        [
          TextWrapper(AppLocale.labels.goalProfitTooltip, style: context.textTheme.bodyLarge),
          TextWrapper(
            AppLocale.labels.goalProfit(maxValue.toCurrency(withPattern: false)),
            style: textStyle,
            maxLines: 2,
          ),
          TextWrapper(
            AppLocale.labels.invoiceSum(valInvoice.toCurrency(withPattern: false)),
            style: textStyle,
            maxLines: 2,
          ),
          TextWrapper(
            AppLocale.labels.billSum(valBill.toCurrency(withPattern: false)),
            style: textStyle,
            maxLines: 2,
          ),
          TextWrapper(
            AppLocale.labels.netProfit(value.toCurrency(withPattern: false)),
            style: textStyle,
            maxLines: 2,
          ),
          ThemeHelper.hIndent,
        ],
        [
          GaugeChart(
            value: value,
            valueMax: maxValue * 2.2,
            width: width > 200 ? 200 : width,
            height: 100,
          ),
        ]
      ],
    );
  }
}
