// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/pages/budget/budget_add_page.dart';
import 'package:flutter/material.dart';

class BudgetEditPage extends BudgetAddPage {
  final String uuid;

  const BudgetEditPage({
    super.key,
    required this.uuid,
  });

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
      amountSet = form.amountSet;
      color = form.color;
      icon = form.icon;
      currency = form.currency;
    });
  }

  @override
  String getTitle() {
    return AppLocale.labels.editBudgetHeader;
  }

  @override
  void updateStorage() {
    var data = state.getByUuid(uuid) as BudgetAppData;
    data.title = title.text;
    data.color = color;
    data.icon = icon;
    data.amountSet = amountSet;
    data.amountLimit = double.tryParse(budgetLimit.text) ?? 0.0;
    data.currency = currency;
    state.update(uuid, data);
  }

  @override
  String getButtonName() {
    return AppLocale.labels.updateBudgetTooltip;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    WidgetsBinding.instance.addPostFrameCallback((_) => bindState());
    return super.buildContent(context, constraints);
  }
}
