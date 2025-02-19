// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/design/generic/base_widget.dart';

class BillWidget extends BaseWidget {
  const BillWidget({
    super.key,
    required super.title,
    required super.width,
    super.tooltip,
    required super.margin,
    required super.state,
    super.limit,
    super.route,
    super.routeList = AppRoute.billViewRoute,
    super.hasExpand,
    super.toExpand,
    super.callback,
  });
}
