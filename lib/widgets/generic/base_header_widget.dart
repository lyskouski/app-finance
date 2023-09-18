// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/double_ext.dart';
import 'package:app_finance/widgets/wrapper/tap_widget.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
import 'package:app_finance/widgets/wrapper/toolbar_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_layout/flutter_grid_layout.dart';

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
    NavigatorState nav = Navigator.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 380) {
        return TapWidget(
          tooltip: tooltip,
          route: route,
          child: Container(
            padding: EdgeInsets.all(indent / 2),
            height: 24,
            width: width + indent,
            color: colorScheme.inverseSurface.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWrapper(
                  title,
                  style: textTheme.headlineMedium,
                ),
                TextWrapper(
                  (state.total as double).toCurrency(),
                  style: textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        );
      }
      return TapWidget(
        tooltip: tooltip,
        route: route,
        child: Container(
          padding: EdgeInsets.all(indent / 2),
          height: 60,
          width: width + indent,
          color: colorScheme.inverseSurface.withOpacity(0.1),
          child: GridContainer(
            rows: [null, 40, if (hasExpand) 40],
            columns: const [13, null],
            children: [
              GridItem(
                start: const Size(0, 0),
                end: const Size(1, 1),
                child: TextWrapper(
                  title,
                  style: textTheme.headlineSmall,
                ),
              ),
              GridItem(
                start: const Size(0, 1),
                end: const Size(1, 2),
                child: TextWrapper(
                  (state.total as double).toCurrency(),
                  style: textTheme.numberLarge,
                ),
              ),
              GridItem(
                start: const Size(1, 0),
                end: const Size(2, 2),
                child: ToolbarButtonWidget(
                  borderColor: context.colorScheme.onSecondaryContainer.withOpacity(0.3),
                  offset: const Offset(-4, 0),
                  margin: const EdgeInsets.only(left: 4),
                  child: IconButton(
                    hoverColor: Colors.transparent,
                    icon: Icon(
                      Icons.stacked_bar_chart,
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                    tooltip: AppLocale.labels.metricsTooltip,
                    onPressed: () => nav.pushNamed(AppMenu.metrics(route)),
                  ),
                ),
              ),
              if (hasExpand)
                GridItem(
                  start: const Size(2, 0),
                  end: const Size(3, 2),
                  child: ToolbarButtonWidget(
                    borderColor: context.colorScheme.onSecondaryContainer.withOpacity(0.3),
                    offset: const Offset(-4, 0),
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
    });
  }
}
