// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu_item.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
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

  void _onHover(bool isHovered) {
    if (isHovered) {
      setState();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = context.colorScheme;
    final TextTheme textTheme = context.textTheme;
    Color color = selectedIndex == index ? colorScheme.inversePrimary : colorScheme.secondary;
    AppMenuItem menu = AppMenu.getByIndex(index);
    NavigatorState nav = Navigator.of(context);

    return Focus(
      includeSemantics: true,
      autofocus: selectedIndex == index,
      focusNode: FocusNode(),
      onFocusChange: _onHover,
      child: InkWell(
        autofocus: selectedIndex == index,
        focusColor: colorScheme.inversePrimary,
        canRequestFocus: true,
        onTap: () {
          setState();
          _navigateToPage(nav, menu.route);
        },
        onHover: _onHover,
        child: ListTile(
          leading: Icon(
            menu.icon,
            color: color,
          ),
          title: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: TextWrapper(
              menu.name,
              style: textTheme.bodyMedium?.copyWith(color: color),
            ),
          ),
        ),
      ),
    );
  }
}
