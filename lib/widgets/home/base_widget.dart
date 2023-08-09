// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/widgets/home/base_header_widget.dart';
import 'package:app_finance/widgets/home/base_line_widget.dart';
import 'package:app_finance/widgets/home/base_list_infinite_widget.dart';
import 'package:app_finance/widgets/home/base_list_limited_widget.dart';
import 'package:flutter/material.dart';

class BaseWidget extends StatefulWidget {
  final EdgeInsetsGeometry margin;
  final String title;
  final double offset;
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
    required this.offset,
    this.tooltip,
    this.limit,
    this.route,
    this.routeList = '',
    this.hasExpand = false,
    this.toExpand = '',
    this.callback,
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
  BaseWidgetState createState() => BaseWidgetState();
}

class BaseWidgetState extends State<BaseWidget> with SharedPreferencesMixin {
  void _expand() {
    String outcome = widget.toExpand == widget.title ? '' : widget.title;
    setPreference(prefExpand, outcome);
    if (widget.callback != null) {
      widget.callback!(outcome);
    }
  }

  @override
  Widget build(context) {
    bool toExpand = !widget.hasExpand || (widget.toExpand ?? '') == '' || widget.toExpand == widget.title;
    return toExpand ? buildFull(context) : buildCollapsed(context);
  }

  Widget buildCollapsed(context) {
    return Container(
      margin: widget.margin,
      child: BaseHeaderWidget(
        route: widget.route,
        state: widget.state,
        title: widget.title,
        tooltip: widget.tooltip,
        hasExpand: widget.hasExpand,
        toExpand: true,
        expand: _expand,
      ),
    );
  }

  Widget buildFull(context) {
    return Expanded(
      child: Container(
        margin: widget.margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseHeaderWidget(
              route: widget.route,
              state: widget.state,
              title: widget.title,
              tooltip: widget.tooltip,
              hasExpand: widget.hasExpand,
              toExpand: (widget.toExpand ?? '') == '' || widget.toExpand != widget.title,
              expand: _expand,
            ),
            Expanded(
              child: widget.limit != null
                  ? BaseListLimitedWidget(
                      route: widget.route,
                      state: widget.state.list,
                      limit: widget.limit,
                      routeList: widget.routeList,
                      offset: widget.offset,
                      buildListWidget: widget.buildListWidget,
                    )
                  : BaseListInfiniteWidget(
                      state: widget.state.list,
                      offset: widget.offset,
                      buildListWidget: widget.buildListWidget,
                    ),
            ),
            SizedBox(height: widget.limit != null ? 0 : 70),
          ],
        ),
      ),
    );
  }
}
