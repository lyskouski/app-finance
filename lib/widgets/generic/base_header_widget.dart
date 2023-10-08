// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_zoom.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/widgets/wrapper/tap_widget.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
import 'package:app_finance/widgets/wrapper/toolbar_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:flutter_grid_layout/flutter_grid_layout.dart';
import 'package:provider/provider.dart';

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
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final nav = Navigator.of(context);
    final isWide = Provider.of<AppZoom>(context, listen: false).value > 1.5;
    final bnShift = Offset(-4, isWide ? -8 : 0);
    final metrics = AppMenu.metrics(route);
    return TapWidget(
      tooltip: tooltip,
      route: RouteSettings(name: route),
      child: Container(
        padding: EdgeInsets.all(indent / 2),
        height: isWide ? 32 : 60,
        width: double.infinity,
        color: colorScheme.inverseSurface,
        child: GridContainer(
          rows: [null, 40, if (hasExpand) 40],
          columns: const [13, null],
          children: [
            GridItem(
              start: const Size(0, 0),
              end: const Size(1, 1),
              child: TextWrapper(
                title,
                style: isWide ? textTheme.bodySmall : textTheme.headlineSmall,
              ),
            ),
            GridItem(
              start: const Size(0, 1),
              end: const Size(1, 2),
              child: TextWrapper(
                (state.total as double).toCurrency(withPattern: false),
                style: isWide ? textTheme.numberSmall : textTheme.numberLarge,
              ),
            ),
            GridItem(
              start: const Size(1, 0),
              end: const Size(2, 2),
              child: ToolbarButtonWidget(
                borderColor: context.colorScheme.onSecondaryContainer.withOpacity(0.3),
                offset: bnShift,
                margin: const EdgeInsets.only(left: 4),
                child: IconButton(
                  hoverColor: Colors.transparent,
                  icon: Icon(
                    Icons.stacked_bar_chart,
                    color: context.colorScheme.onSecondaryContainer,
                  ),
                  tooltip: AppLocale.labels.metricsTooltip,
                  onPressed: () => nav.pushNamed(metrics.name!, arguments: metrics.arguments),
                ),
              ),
            ),
            if (hasExpand)
              GridItem(
                start: const Size(2, 0),
                end: const Size(3, 2),
                child: ToolbarButtonWidget(
                  borderColor: context.colorScheme.onSecondaryContainer.withOpacity(0.3),
                  offset: bnShift,
                  margin: const EdgeInsets.only(left: 4),
                  child: IconButton(
                    hoverColor: Colors.transparent,
                    selectedIcon: Icon(
                      Icons.expand,
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                    icon: Icon(
                      Icons.expand_less,
                      color: context.colorScheme.primary.withOpacity(0.6),
                    ),
                    tooltip: toExpand ? AppLocale.labels.expand : AppLocale.labels.collapse,
                    onPressed: () => expand!(),
                    isSelected: toExpand,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
