// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/data/exchange.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/_wrappers/tap_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BaseHeaderWidget extends StatelessWidget {
  final String? tooltip;
  final String? route;
  final String title;
  final dynamic state;

  const BaseHeaderWidget({
    super.key,
    required this.tooltip,
    required this.route,
    required this.title,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    var theme = ThemeHelper(windowType: getWindowType(context));
    double indent = theme.getIndent();
    final locale = Localizations.localeOf(context).toString();
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: Exchange.defaultCurrency?.symbol,
      decimalDigits: 2,
    );
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TapWidget(
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
                  style: textTheme.numberLarge.copyWith(color: textTheme.headlineSmall?.color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
