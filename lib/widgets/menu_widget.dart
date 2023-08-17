// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/app_menu.dart';
import 'package:app_finance/_classes/app_menu_item.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final Function setState;

  const MenuWidget({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.setState,
  });

  void _navigateToPage(NavigatorState nav, String routeName) {
    nav.pop();
    nav.pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    Color color = selectedIndex == index ? colorScheme.inversePrimary : colorScheme.secondary;
    AppMenuItem menu = AppMenu.getByIndex(index);
    NavigatorState nav = Navigator.of(context);

    return InkWell(
      child: ListTile(
        leading: Icon(
          menu.icon,
          color: color,
        ),
        title: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            menu.name,
            style: textTheme.bodyMedium?.copyWith(color: color),
          ),
        ),
      ),
      onTap: () {
        setState();
        _navigateToPage(nav, menu.route);
      },
      onHover: (isHovered) {
        if (isHovered) {
          setState();
        }
      },
    );
  }
}
