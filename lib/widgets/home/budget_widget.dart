// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/classes/app_route.dart';
import 'package:app_finance/classes/budget_app_data.dart';
import 'package:app_finance/widgets/home/account_widget.dart';
import 'package:app_finance/widgets/home/base_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BudgetWidget extends AccountWidget {
  BudgetWidget({
    super.key,
    required String title,
    required double offset,
    String? tooltip,
    required EdgeInsetsGeometry margin,
    required dynamic state,
    String? route,
    String routeList = AppRoute.budgetViewRoute,
  }) : super(
    margin: margin,
    offset: offset,
    tooltip: tooltip,
    title: title,
    state: state,
    route: route,
    routeList: routeList,
  );

  @override
  Widget buildListWidget(item, BuildContext context, NumberFormat formatter,
      DateFormat formatterDate, double offset) {
    item.updateContext(context);
    return BaseLineWidget(
      uuid: item.uuid ?? '',
      title: item.title,
      description: item.description,
      details: item.detailsFormatted,
      progress: item.progress,
      color: item.color ?? Colors.transparent,
      hidden: item.hidden,
      offset: offset,
      route: routeList,
    );
  }
}
