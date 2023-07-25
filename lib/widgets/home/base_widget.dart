// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/_classes/data/exchange.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/home/base_header_widget.dart';
import 'package:app_finance/widgets/home/base_line_widget.dart';
import 'package:app_finance/widgets/home/base_list_limited_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BaseWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String title;
  final double offset;
  final int? limit;
  final dynamic state;
  final String? tooltip;
  final String? route;
  final String routeList;

  const BaseWidget({
    Key? key,
    required this.margin,
    required this.title,
    required this.state,
    required this.offset,
    this.tooltip,
    this.limit,
    this.route,
    this.routeList = '',
  }) : super(key: key);

  @override
  Widget build(context) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: Localizations.localeOf(context).toString(),
      symbol: Exchange.defaultCurrency?.symbol,
      decimalDigits: 2,
    );

    return Expanded(
      child: Container(
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseHeaderWidget(
              formatter: formatter,
              route: route,
              state: state,
              title: title,
              tooltip: tooltip,
            ),
            Expanded(
              child: BaseListLimitedWidget(
                formatter: formatter,
                route: route,
                state: state,
                limit: limit,
                routeList: routeList,
                offset: offset,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
