// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/widgets/_generic/base_widget.dart';
import 'package:flutter/material.dart';

class BillWidget extends BaseWidget {
  const BillWidget({
    super.key,
    required String title,
    required double offset,
    String? tooltip,
    required EdgeInsetsGeometry margin,
    required dynamic state,
    int? limit,
    String? route,
    String routeList = AppRoute.billViewRoute,
    super.hasExpand,
    super.toExpand,
    super.callback,
  }) : super(
          margin: margin,
          offset: offset,
          title: title,
          state: state,
          limit: limit,
          tooltip: tooltip,
          route: route,
          routeList: routeList,
        );
}
