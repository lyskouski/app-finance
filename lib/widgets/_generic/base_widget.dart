// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/widgets/_generic/base_header_widget.dart';
import 'package:app_finance/widgets/_generic/base_line_widget.dart';
import 'package:app_finance/widgets/_generic/base_list_infinite_widget.dart';
import 'package:app_finance/widgets/_generic/base_list_limited_widget.dart';
import 'package:app_finance/widgets/_generic/base_swipe_widget.dart';
import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String title;
  final double width;
  final int? limit;
  final dynamic state;
  final String? tooltip;
  final String? route;
  final String routeList;
  final bool hasExpand;
  final String? toExpand;
  final Function? callback;

  const BaseWidget({
    Key? key,
    required this.margin,
    required this.title,
    required this.state,
    required this.width,
    this.tooltip,
    this.limit,
    this.route,
    this.routeList = '',
    this.hasExpand = false,
    this.toExpand = '',
    this.callback,
  }) : super(key: key);

  Widget buildListWidget(item, BuildContext context) {
    return BaseSwipeWidget(
      routePath: AppMenu.viewRoute2Edit(routeList),
      uuid: item.uuid,
      child: BaseLineWidget(
        uuid: item.uuid ?? '',
        title: item.title,
        description: item.description,
        details: item.detailsFormatted,
        progress: item.progress,
        color: item.color ?? Colors.transparent,
        hidden: item.hidden,
        width: width,
        route: routeList,
      ),
    );
  }

  void _expand() {
    String outcome = toExpand == title ? '' : title;
    AppPreferences.set(AppPreferences.prefExpand, outcome);
    if (callback != null) {
      callback!(outcome);
    }
  }

  @override
  Widget build(context) {
    bool isExpanded = !hasExpand || (toExpand ?? '') == '' || toExpand == title;
    return isExpanded ? buildFull(context) : buildCollapsed(context);
  }

  Widget buildCollapsed(context) {
    return Container(
      margin: margin,
      child: BaseHeaderWidget(
        route: route,
        width: width,
        state: state,
        title: title,
        tooltip: tooltip,
        hasExpand: hasExpand,
        toExpand: true,
        expand: _expand,
      ),
    );
  }

  Widget buildFull(context) {
    return Expanded(
      child: Container(
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseHeaderWidget(
              route: route,
              width: width,
              state: state,
              title: title,
              tooltip: tooltip,
              hasExpand: hasExpand,
              toExpand: (toExpand ?? '') == '' || toExpand != title,
              expand: _expand,
            ),
            Expanded(
              child: limit != null
                  ? BaseListLimitedWidget(
                      route: route,
                      state: state.list,
                      limit: limit,
                      routeList: routeList,
                      width: width,
                      buildListWidget: buildListWidget,
                    )
                  : BaseListInfiniteWidget(
                      state: state.list,
                      width: width,
                      buildListWidget: buildListWidget,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
