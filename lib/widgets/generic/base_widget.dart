// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/widgets/generic/base_header_widget.dart';
import 'package:app_finance/widgets/generic/base_line_widget.dart';
import 'package:app_finance/widgets/generic/base_list_infinite_widget.dart';
import 'package:app_finance/widgets/generic/base_list_limited_widget.dart';
import 'package:app_finance/widgets/generic/base_swipe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

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
      routePath: routeList.replaceAll('/view', '/edit'),
      uuid: item.uuid,
      child: BaseLineWidget(
        uuid: item.uuid ?? '',
        title: item.title,
        description: item.description ?? '',
        details: item.detailsFormatted,
        progress: item.progress,
        color: item.color ?? Colors.transparent,
        icon: item.icon ?? Icons.radio_button_unchecked_sharp,
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
  Widget build(BuildContext context) {
    if (!hasExpand || (toExpand ?? '') == '' || toExpand == title) {
      return buildFull(context);
    }
    return buildCollapsed(context);
  }

  Widget buildMinimized(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ThemeHelper.getIndent(3)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colorScheme.inverseSurface.withOpacity(0.1),
      ),
      height: ThemeHelper.getHeight(context),
      child: Column(
        children: [
          SizedBox(height: ThemeHelper.getHeight(context) / 2 - 2 * ThemeHelper.getTextHeight(Text(title))),
          Text(title),
          ThemeHelper.hIndent,
          Text(
            (state.total as double).toCurrency(withPattern: false),
            style: context.textTheme.numberMedium,
          ),
        ],
      ),
    );
  }

  Widget buildCollapsed(BuildContext context) {
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

  Widget buildFull(BuildContext context) {
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
