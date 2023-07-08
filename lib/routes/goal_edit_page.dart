// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/goal_app_data.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/routes/goal_add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class GoalEditPage extends GoalAddPage {
  final String uuid;

  GoalEditPage({
    required this.uuid,
  }) : super();

  @override
  GoalEditPageState createState() => GoalEditPageState();
}

class GoalEditPageState extends GoalAddPageState<GoalEditPage> {
  late String uuid;
  bool isFirstRun = true;

  @override
  void initState() {
    uuid = (widget as GoalEditPage).uuid;
    super.initState();
  }

  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.editGoalHeader;
  }

  @override
  void updateStorage() {
    var data = super.state.getByUuid(uuid) as GoalAppData;
    data.title = super.title ?? '';
    data.color = super.color;
    data.icon = super.icon;
    data.details = super.details;
    data.closedAt = super.closedAt ?? DateTime.now();
    data.currency = super.currency;
    super.state.update(AppDataType.goals, uuid, data);
  }

  @override
  String getButtonName() {
    return AppLocalizations.of(context)!.updateGoalTooltip;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    if (isFirstRun) {
      isFirstRun = false;
      var form = super.state.getByUuid(uuid) as GoalAppData;
      super.title = form.title;
      super.details = form.details;
      super.color = form.color;
      super.icon = form.icon;
      super.currency = form.currency;
      super.closedAt = form.closedAt;
    }
    return super.buildContent(context, constraints);
  }
}
