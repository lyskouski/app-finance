// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_zoom.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/wrapper/tap_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:app_finance/design/button/toolbar_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:flutter_grid_layout/flutter_grid_layout.dart';
import 'package:provider/provider.dart';

class BaseHeaderWidget extends StatelessWidget {
  final String? tooltip;
  final String? route;
  final String? searchRoute;
  final String title;
  final double width;
  final double? total;
  final bool hasExpand;
  final bool toExpand;
  final Function? expand;

  const BaseHeaderWidget({
    super.key,
    required this.tooltip,
    required this.route,
    required this.title,
    required this.total,
    required this.width,
    this.hasExpand = false,
    this.toExpand = true,
    this.expand,
    this.searchRoute,
  }) : assert(hasExpand && expand != null || !hasExpand);

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent();
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final nav = Navigator.of(context);
    final isWide = Provider.of<AppZoom>(context, listen: false).value > 1.5;
    final bnShift = Offset(-4, isWide ? -8 : 0);
    final metrics = AppMenu.metrics(route);
    final subStyle = isWide ? textTheme.bodySmall : textTheme.headlineSmall;
    final subHeight = ThemeHelper.getTextHeight(Text(title, style: subStyle));
    final numStyle = isWide ? textTheme.numberSmall : textTheme.numberLarge;
    final numHeight = ThemeHelper.getTextHeight(Text(total.toString(), style: numStyle));
    final isSearchRoute = searchRoute != null && searchRoute!.isNotEmpty;
    return TapWidget(
      tooltip: tooltip,
      route: RouteSettings(name: route),
      child: Container(
        padding: EdgeInsets.all(indent / 2),
        height: numHeight + subHeight + indent,
        width: double.infinity,
        color: colorScheme.inverseSurface.withValues(alpha: 0.1),
        child: GridContainer(
          alignment: AppDesign.getAlignment<MainAxisAlignment>(),
          rows: [null, ThemeHelper.barHeight, if (hasExpand || isSearchRoute) ThemeHelper.barHeight],
          columns: [subHeight, null],
          children: [
            GridItem(
              start: const Size(0, 0),
              end: const Size(1, 1),
              child: TextWrapper(title, style: subStyle),
            ),
            GridItem(
              start: const Size(0, 1),
              end: const Size(1, 2),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: AppDesign.isRightToLeft() ? Alignment.centerRight : Alignment.centerLeft,
                child: TextWrapper(total != null ? total!.toCurrency(withPattern: false) : '', style: numStyle),
              ),
            ),
            GridItem(
              start: const Size(1, 0),
              end: const Size(2, 2),
              child: ToolbarButtonWidget(
                borderColor: context.colorScheme.onSecondaryContainer.withValues(alpha: 0.3),
                offset: bnShift,
                icon: Icons.stacked_bar_chart,
                color: context.colorScheme.onSecondaryContainer,
                tooltip: AppLocale.labels.metricsTooltip,
                onPressed: () => nav.pushNamed(metrics.name!, arguments: metrics.arguments),
                backgroundColor: context.colorScheme.surface.withValues(alpha: 0.3),
              ),
            ),
            if (hasExpand)
              GridItem(
                start: const Size(2, 0),
                end: const Size(3, 2),
                child: ToolbarButtonWidget(
                  borderColor: context.colorScheme.onSecondaryContainer.withValues(alpha: 0.3),
                  offset: bnShift,
                  selectedIcon: Icons.expand,
                  selectedColor: context.colorScheme.onSecondaryContainer,
                  backgroundColor: context.colorScheme.surface.withValues(alpha: 0.3),
                  icon: Icons.expand_less,
                  color: context.colorScheme.primary.withValues(alpha: 0.6),
                  tooltip: toExpand ? AppLocale.labels.expand : AppLocale.labels.collapse,
                  onPressed: () => expand!(),
                  isSelected: toExpand,
                ),
              ),
            if (isSearchRoute)
              GridItem(
                start: const Size(2, 0),
                end: const Size(3, 2),
                child: ToolbarButtonWidget(
                  borderColor: context.colorScheme.onSecondaryContainer.withValues(alpha: 0.3),
                  offset: bnShift,
                  selectedIcon: Icons.expand,
                  selectedColor: context.colorScheme.onSecondaryContainer,
                  backgroundColor: context.colorScheme.surface.withValues(alpha: 0.3),
                  icon: Icons.search,
                  color: context.colorScheme.onSecondaryContainer,
                  tooltip: AppLocale.labels.searchTooltip,
                  onPressed: () => nav.pushNamed(searchRoute!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
