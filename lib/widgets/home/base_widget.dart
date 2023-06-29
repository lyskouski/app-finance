// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/data/bill_app_data.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/decorators/tap_area.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/home/base_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BaseWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String title;
  final double offset;
  final dynamic state;
  String? tooltip;
  String? route;
  String routeList;

  BaseWidget({
    Key? key,
    required this.margin,
    required this.title,
    required this.state,
    required this.offset,
    this.tooltip,
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

  @override
  Widget build(context) {
    var theme = ThemeHelper(windowType: getWindowType(context));
    double indent = theme.getIndent();
    final locale = Localizations.localeOf(context).toString();
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: '\$',
      decimalDigits: 2,
    );
    final DateFormat formatterDate = DateFormat.MMMMd(locale);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TapArea(
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
                  itemCount: state.list.length + 2,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return SizedBox(height: indent);
                    } else if (index <= state.list.length) {
                      final item = state.list[index - 1];
                      return buildListWidget(
                          item, context, formatter, formatterDate, offset - 40);
                    } else {
                      return TextButton(
                        onPressed: () {
                          // Handle "More" button pressed
                        },
                        child: Text(AppLocalizations.of(context)!.btnMore),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
