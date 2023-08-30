// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_wrappers/tap_widget.dart';
import 'package:app_finance/widgets/_wrappers/toolbar_button_widget.dart';
import 'package:app_finance/widgets/settings/recover_tab/recovery_type.dart';
import 'package:flutter/material.dart';

class NavButtonWidget extends StatelessWidget {
  final String name;
  final RecoveryType nav;
  final IconData icon;
  final Function callback;

  const NavButtonWidget({
    super.key,
    required this.name,
    required this.nav,
    required this.callback,
    this.icon = Icons.arrow_right,
  });

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent(2);
    final textTheme = Theme.of(context).textTheme;
    return TapWidget(
      onTap: () => callback(nav),
      tooltip: name,
      child: Row(
        children: [
          ToolbarButtonWidget(
            offset: const Offset(0, 0),
            borderColor: Theme.of(context).colorScheme.inversePrimary,
            child: IconButton(
              hoverColor: Colors.transparent,
              icon: Icon(icon),
              onPressed: () => callback(nav),
            ),
          ),
          SizedBox(width: indent),
          Expanded(
            child: Text(name, style: textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
