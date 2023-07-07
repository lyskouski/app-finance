// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/budget_app_data.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/routes/budget_add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BudgetEditPage extends BudgetAddPage {
  final String uuid;

  BudgetEditPage({
    required this.uuid,
  }) : super();

  @override
  BudgetEditPageState createState() => BudgetEditPageState();
}

class BudgetEditPageState extends BudgetAddPageState<BudgetEditPage> {
  late String uuid;
  bool isFirstRun = true;

  @override
  void initState() {
    uuid = (widget as BudgetEditPage).uuid;
    super.initState();
  }

  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.editBudgetHeader;
  }

  @override
  void updateStorage() {
    var data = super.state.getByUuid(uuid) as BudgetAppData;
    data.title = super.title ?? '';
    data.color = super.color;
    data.amountLimit = super.budgetLimit ?? 0.0;
    data.currency = super.currency;
    super.state.update(AppDataType.budgets, uuid, data);
  }

  @override
  String getButtonName() {
    return AppLocalizations.of(context)!.updateBudgetTooltip;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    if (isFirstRun) {
      isFirstRun = false;
      var form = super.state.getByUuid(uuid) as BudgetAppData;
      super.title = form.title;
      super.budgetLimit = form.amountLimit;
      super.color = form.color;
      super.icon = form.icon;
      super.currency = form.currency;
    }
    return super.buildContent(context, constraints);
  }
}
