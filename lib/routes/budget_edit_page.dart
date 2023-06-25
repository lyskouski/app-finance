// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

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
    return AppLocalizations.of(context)!.editAccountHeader;
  }

  @override
  void updateStorage() {
    String uuid = (widget as BudgetEditPage).uuid;
    widget.state?.update(AppDataType.budgets, uuid, (
      uuid: uuid,
      title: widget.title,
      description: '',
      details: widget.budgetLimit ?? 0.0,
      progress: 1.0,
      color: widget.color ?? Colors.red,
      hidden: false,
    ));
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    if ((widget as BudgetEditPage).isFirstRun) {
      (widget as BudgetEditPage).isFirstRun = false;
      var form =
          widget.state?.getByUuid(AppDataType.budgets, (widget as BudgetEditPage).uuid);
      widget.title = form.title;
      widget.budgetLimit = form.details;
      widget.color = form.color;
    }
    return super.buildContent(context, constraints);
  }
}
