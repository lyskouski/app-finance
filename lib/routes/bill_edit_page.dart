// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/bill_app_data.dart';
import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/bill/expenses_edit_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BillEditPage extends AbstractPage {
  final String uuid;

  BillEditPage({
    required this.uuid,
  }) : super();

  @override
  BillEditPageState createState() => BillEditPageState();
}

class BillEditPageState<T extends BillEditPage> extends AbstractPageState<BillEditPage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.editBillHeader;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return const SizedBox();
  }

  @override
  void dispose() {
    FocusController.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    var bill = super.state.getByUuid(widget.uuid) as BillAppData;
    bill.updateContext(context);
    return ExpensesEditTab(
      uuid: widget.uuid,
      account: bill.account == '' ? null : bill.account,
      budget: bill.category == '' ? null : bill.category,
      currency: bill.currency,
      bill: bill.details,
      description: bill.title,
      createdAt: bill.createdAt,
    );
  }
}
