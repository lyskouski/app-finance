// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/_classes/data/exchange.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:app_finance/widgets/_wrappers/tap_widget.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/home/base_line_widget.dart';
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

  Widget buildListWidget(item, BuildContext context, NumberFormat formatter,
      DateFormat formatterDate, double offset) {
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
  Widget build(context) {
    var theme = ThemeHelper(windowType: getWindowType(context));
    double indent = theme.getIndent();
    final locale = Localizations.localeOf(context).toString();
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: Exchange.defaultCurrency?.symbol,
      decimalDigits: 2,
    );
    final DateFormat formatterDate = DateFormat.MMMMd(locale);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    int itemCount = state.list.length + 2;
    bool hasMore = false;
    if (limit != null && limit! < state.list.length) {
      itemCount = limit! + 2;
      hasMore = true;
    }
    final addButton = route == null
        ? const SizedBox()
        : buildButton(
            context, '${route!}/add', AppLocalizations.of(context)!.btnAdd);

    return Expanded(
      child: Container(
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TapWidget(
              tooltip: tooltip,
              route: route,
              child: FractionallySizedBox(
                widthFactor: 1.0,
                child: Container(
                  color: colorScheme.inverseSurface.withOpacity(0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(indent, indent, 0, 0),
                        child: Text(
                          title,
                          style: textTheme.headlineSmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(indent, 0, 0, indent),
                        child: Text(
                          formatter.format(state.total),
                          style: textTheme.numberLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return SizedBox(height: indent);
                    } else if (index <= itemCount - 2) {
                      final item = state.list[index - 1];
                      return buildListWidget(
                          item, context, formatter, formatterDate, offset - 40);
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
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
