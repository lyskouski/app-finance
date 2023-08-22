// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/widgets/budget/budget_line_widget.dart';
import 'package:app_finance/widgets/home/budget_widget.dart' as home;
import 'package:flutter/material.dart';

class BudgetWidget extends home.BudgetWidget {
  BudgetWidget({super.key, required super.title, required super.width, required super.margin, required super.state});

  @override
  Widget buildSingleListWidget(item, BuildContext context, double width) {
    item = item.first;
    return BudgetLineWidget(
      uuid: item.uuid,
      title: item.title,
      description: item.description ?? '',
      icon: item.icon ?? Icons.question_mark,
      details: item.detailsFormatted,
      progress: item.progressLeft,
      color: item.color ?? Colors.transparent,
      hidden: item.hidden,
      width: width,
      route: routeList,
    );
  }
}
