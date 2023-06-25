// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/routes.dart' as routes;
import 'package:app_finance/widgets/home/account_widget.dart';
import 'package:flutter/material.dart';

class BudgetWidget extends AccountWidget {
  BudgetWidget({
    super.key,
    required String title,
    required double offset,
    required EdgeInsetsGeometry margin,
    required dynamic state,
    String? route,
    String routeList = routes.budgetViewRoute,
  }) : super(
    margin: margin,
    offset: offset,
    title: title,
    state: state,
    route: route,
    routeList: routeList,
  );
}
