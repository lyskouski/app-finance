// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/classes/budget_app_data.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/routes/budget_add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BudgetEditPage extends BudgetAddPage {
  String uuid;
  bool isFirstRun = true;

  BudgetEditPage({
    required this.uuid,
  }) : super();

  @override
  BudgetEditPageState createState() => BudgetEditPageState();
}

class BudgetEditPageState extends BudgetAddPageState<BudgetEditPage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.editBudgetHeader;
  }

  @override
  void updateStorage() {
    String uuid = (widget as BudgetEditPage).uuid;
    var data =
          widget.state?.getByUuid(AppDataType.budgets, (widget as BudgetEditPage).uuid) as BudgetAppData;
    data.title = widget.title ?? '';
    data.color = widget.color;
    data.amountLimit = widget.budgetLimit ?? 0.0;
    data.currency = widget.currency;
    widget.state?.update(AppDataType.budgets, uuid, data);
  }

  @override
  String getButtonName() {
    return AppLocalizations.of(context)!.updateBudgetTooltip;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    if ((widget as BudgetEditPage).isFirstRun) {
      (widget as BudgetEditPage).isFirstRun = false;
      var form =
          widget.state?.getByUuid(AppDataType.budgets, (widget as BudgetEditPage).uuid) as BudgetAppData;
      widget.title = form.title;
      widget.budgetLimit = form.amountLimit;
      widget.color = form.color;
      widget.currency = form.currency;
    }
    return super.buildContent(context, constraints);
  }
}
