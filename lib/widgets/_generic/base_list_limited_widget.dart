// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:flutter/material.dart';

typedef FnListWidget = Widget Function(dynamic item, BuildContext context);

class BaseListLimitedWidget extends StatelessWidget {
  final String? route;
  final String routeList;
  final dynamic state;
  final int? limit;
  final double width;
  final FnListWidget buildListWidget;

  const BaseListLimitedWidget({
    super.key,
    required this.route,
    required this.state,
    required this.limit,
    required this.routeList,
    required this.width,
    required this.buildListWidget,
  });

  Widget buildButton(BuildContext context, String route, String title) {
    NavigatorState nav = Navigator.of(context);
    return TextButton(
      onPressed: () {
        nav.pushNamed(AppRoute.homeRoute);
        nav.pushNamed(route);
      },
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent();
    int itemCount = state.length + 2;
    bool hasMore = false;
    if (limit != null && limit! < state.length) {
      itemCount = limit! + 2;
      hasMore = true;
    }
    final addButton = route == null ? const SizedBox() : buildButton(context, '${route!}/add', AppLocale.labels.btnAdd);

    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SizedBox(height: indent);
          } else if (index <= itemCount - 2) {
            final item = state[index - 1];
            return buildListWidget(item, context);
          } else if (hasMore) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildButton(context, route ?? AppRoute.homeRoute, AppLocale.labels.btnMore),
                addButton,
              ],
            );
          } else {
            return addButton;
          }
        });
  }
}
