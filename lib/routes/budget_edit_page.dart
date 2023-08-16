// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/budget_app_data.dart';
import 'package:app_finance/_classes/app_data.dart';
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

  void bindState() {
    if (!isFirstRun) {
      return;
    }
    setState(() {
      isFirstRun = false;
      final form = super.state.getByUuid(uuid) as BudgetAppData;
      title.text = form.title;
      budgetLimit.text = form.amountLimit.toString();
      color = form.color;
      icon = form.icon;
      currency = form.currency;
    });
  }

  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.editBudgetHeader;
  }

  @override
  void updateStorage() {
    var data = state.getByUuid(uuid) as BudgetAppData;
    data.title = title.text;
    data.color = color;
    data.icon = icon;
    data.amountLimit = double.tryParse(budgetLimit.text) ?? 0.0;
    data.currency = currency;
    state.update(AppDataType.budgets, uuid, data);
  }

  @override
  String getButtonName(BuildContext context) {
    return AppLocalizations.of(context)!.updateBudgetTooltip;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    WidgetsBinding.instance.addPostFrameCallback((_) => bindState());
    return super.buildContent(context, constraints);
  }
}
