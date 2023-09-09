// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_wrappers/toolbar_button_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  final NavigatorState nav;
  final ColorScheme colorScheme;

  @override
  Color? get backgroundColor => colorScheme.primary;

  @override
  Widget? get leading => ToolbarButtonWidget(
        child: IconButton(
          hoverColor: Colors.transparent,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
          tooltip: AppLocale.labels.backTooltip,
          onPressed: () => nav.pop(),
        ),
      );

  @override
  List<Widget>? get actions => [
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return AppMenu.get().map((menuItem) {
              return PopupMenuItem(
                value: menuItem.route,
                child: Row(
                  children: [
                    Icon(menuItem.icon),
                    ThemeHelper.wIndent,
                    Text(menuItem.name),
                  ],
                ),
              );
            }).toList();
          },
          onSelected: (value) => nav.pushNamed(value),
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white70,
          ),
        ),
      ];

  AppBarWidget({
    super.key,
    required this.nav,
    required this.colorScheme,
    super.title,
    super.toolbarHeight = 40,
  });
}
