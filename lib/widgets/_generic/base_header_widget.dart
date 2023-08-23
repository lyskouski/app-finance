// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:app_finance/widgets/_wrappers/tap_widget.dart';
import 'package:app_finance/widgets/_wrappers/toolbar_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BaseHeaderWidget extends StatelessWidget {
  final String? tooltip;
  final String? route;
  final String title;
  final double width;
  final dynamic state;
  final bool hasExpand;
  final bool toExpand;
  final Function? expand;

  const BaseHeaderWidget({
    super.key,
    required this.tooltip,
    required this.route,
    required this.title,
    required this.state,
    required this.width,
    this.hasExpand = false,
    this.toExpand = true,
    this.expand,
  }) : assert(hasExpand && expand != null || !hasExpand);

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent();
    final locale = Localizations.localeOf(context).toString();
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: Exchange.defaultCurrency?.symbol,
      decimalDigits: 2,
    );
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    NavigatorState nav = Navigator.of(context);
    return TapWidget(
      tooltip: tooltip,
      route: route,
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: Container(
          color: colorScheme.inverseSurface.withOpacity(0.1),
          child: RowWidget(
            indent: 0.0,
            maxWidth: width - 4 * indent,
            chunk: [null, 40, hasExpand ? 40 : 0],
            children: [
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(indent, indent / 2, 0, 0),
                      child: Text(
                        title,
                        style: textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: indent),
                      child: Text(
                        formatter.format(state.total),
                        style: textTheme.numberLarge.copyWith(color: textTheme.headlineSmall?.color),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
              [
                ToolbarButtonWidget(
                  borderColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  offset: const Offset(-4, 0),
                  child: IconButton(
                    hoverColor: Colors.transparent,
                    icon: Icon(
                      Icons.stacked_bar_chart,
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                    ),
                    tooltip: AppLocale.labels.metricsTooltip,
                    onPressed: () => nav.pushNamed(AppMenu.metrics(route)),
                  ),
                ),
              ],
              [
                if (hasExpand)
                  ToolbarButtonWidget(
                    borderColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    margin: EdgeInsets.only(right: indent),
                    offset: const Offset(-4, 0),
                    child: IconButton(
                      hoverColor: Colors.transparent,
                      selectedIcon: Icon(
                        Icons.expand,
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                      ),
                      icon: Icon(
                        Icons.expand_less,
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                      ),
                      tooltip: toExpand ? AppLocale.labels.expand : AppLocale.labels.collapse,
                      onPressed: () => expand!(),
                      isSelected: toExpand,
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
