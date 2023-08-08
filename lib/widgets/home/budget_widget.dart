// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/widgets/home/account_widget.dart';
import 'package:app_finance/widgets/home/base_line_widget.dart';
import 'package:flutter/material.dart';

class BudgetWidget extends AccountWidget {
  const BudgetWidget({
    super.key,
    required String title,
    required double offset,
    String? tooltip,
    required EdgeInsetsGeometry margin,
    required dynamic state,
    int? limit,
    String? route,
    String routeList = AppRoute.budgetViewRoute,
    super.hasExpand,
    super.toExpand,
    super.callback,
  }) : super(
          margin: margin,
          offset: offset,
          tooltip: tooltip,
          title: title,
          state: state,
          limit: limit,
          route: route,
          routeList: routeList,
        );

  @override
  Widget buildListWidget(item, BuildContext context, double offset) {
    item.updateContext(context);
    return BaseLineWidget(
      uuid: item.uuid,
      title: item.title,
      description: item.description ?? '',
      details: item.detailsFormatted,
      progress: (item.progress < 1 ? 1 - item.progress : 0.0).toDouble(),
      color: item.color ?? Colors.transparent,
      hidden: item.hidden,
      offset: offset,
      route: routeList,
    );
  }
}
