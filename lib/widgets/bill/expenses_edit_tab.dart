// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/bill_app_data.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/widgets/bill/expenses_tab.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ExpensesEditTab extends ExpensesTab {
  final String uuid;

  const ExpensesEditTab({
    super.key,
    required this.uuid,
    String? account,
    String? budget,
    Currency? currency,
    double? bill,
    String? description,
    DateTime? createdAt,
  }) : super(
          account: account,
          budget: budget,
          currency: currency,
          bill: bill,
          description: description,
          createdAt: createdAt,
        );

  @override
  ExpensesEditTabState createState() => ExpensesEditTabState();
}

class ExpensesEditTabState extends ExpensesTabState<ExpensesEditTab> {
  @override
  void updateStorage() {
    state.update(
        AppDataType.bills,
        widget.uuid,
        BillAppData(
          uuid: widget.uuid,
          account: account ?? '',
          category: budget ?? '',
          currency: currency,
          title: description ?? '',
          details: bill,
          createdAt: createdAt,
        ));
  }

  @override
  String getButtonTitle(context) {
    return AppLocalizations.of(context)!.updateBillTooltip;
  }
}
