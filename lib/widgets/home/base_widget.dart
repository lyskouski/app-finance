// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/widgets/home/base_header_widget.dart';
import 'package:app_finance/widgets/home/base_line_widget.dart';
import 'package:app_finance/widgets/home/base_list_infinite_widget.dart';
import 'package:app_finance/widgets/home/base_list_limited_widget.dart';
import 'package:flutter/material.dart';

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

  Widget buildListWidget(item, BuildContext context, double offset) {
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

  @override
  Widget build(context) {
    return Expanded(
      child: Container(
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseHeaderWidget(
              route: route,
              state: state,
              title: title,
              tooltip: tooltip,
            ),
            Expanded(
              child: limit != null
                  ? BaseListLimitedWidget(
                      route: route,
                      state: state.list,
                      limit: limit,
                      routeList: routeList,
                      offset: offset,
                      buildListWidget: buildListWidget,
                    )
                  : BaseListInfiniteWidget(
                      state: state.list,
                      offset: offset,
                      buildListWidget: buildListWidget,
                    ),
            ),
            SizedBox(height: limit != null ? 0 : 70),
          ],
        ),
      ),
    );
  }
}
