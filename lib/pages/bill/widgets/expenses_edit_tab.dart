// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_ext/double_ext.dart';
import 'package:app_finance/pages/bill/widgets/expenses_tab.dart';

class ExpensesEditTab extends ExpensesTab {
  final String uuid;

  const ExpensesEditTab({
    super.key,
    required this.uuid,
    required super.state,
    required super.callback,
    super.account,
    super.budget,
    super.currency,
    super.bill,
    super.description,
    super.createdAt,
  });

  @override
  ExpensesEditTabState createState() => ExpensesEditTabState();
}

class ExpensesEditTabState extends ExpensesTabState<ExpensesEditTab> {
  @override
  void updateStorage() {
    exchange.save();
    widget.state.update(
        widget.uuid,
        BillAppData(
          uuid: widget.uuid,
          account: account ?? '',
          category: budget ?? '',
          currency: currency,
          title: description.text,
          details: double.tryParse(bill.text)?.toFixed(currency?.decimalDigits) ?? 0.0,
          createdAt: createdAt,
        ));
  }

  @override
  String getTitle() => AppLocale.labels.updateBillTooltip;

  @override
  String getButtonName() => AppLocale.labels.updateBillTooltip;
}
