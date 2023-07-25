// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BaseListLimitedWidget extends StatelessWidget {
  final String? route;
  final String routeList;
  final dynamic state;
  final int? limit;
  final double offset;
  final Function buildListWidget;

  const BaseListLimitedWidget({
    super.key,
    required this.route,
    required this.state,
    required this.limit,
    required this.routeList,
    required this.offset,
    required this.buildListWidget,
  });

  Widget buildButton(BuildContext context, String route, String title) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoute.homeRoute);
        Navigator.pushNamed(context, route);
      },
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = ThemeHelper(windowType: getWindowType(context));
    double indent = theme.getIndent();
    int itemCount = state.length + 2;
    bool hasMore = false;
    if (limit != null && limit! < state.length) {
      itemCount = limit! + 2;
      hasMore = true;
    }
    final addButton = route == null
        ? const SizedBox()
        : buildButton(
            context, '${route!}/add', AppLocalizations.of(context)!.btnAdd);

    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SizedBox(height: indent);
          } else if (index <= itemCount - 2) {
            final item = state[index - 1];
            return buildListWidget(item, context, offset - 40);
          } else if (hasMore) {
            return RowWidget(
              indent: indent,
              maxWidth: offset,
              chunk: const [0.5, 0.5],
              children: [
                [
                  buildButton(context, route ?? AppRoute.homeRoute,
                      AppLocalizations.of(context)!.btnMore)
                ],
                [addButton]
              ],
            );
          } else {
            return addButton;
          }
        });
  }
}
