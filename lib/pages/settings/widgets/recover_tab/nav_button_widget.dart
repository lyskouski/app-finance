// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/wrapper/tap_widget.dart';
import 'package:app_finance/design/button/toolbar_button_widget.dart';
import 'package:app_finance/pages/settings/widgets/recover_tab/recovery_type.dart';
import 'package:flutter/material.dart';

class NavButtonWidget extends StatelessWidget {
  final String name;
  final RecoveryType nav;
  final IconData icon;
  final Function callback;
  final Offset offset;

  const NavButtonWidget({
    super.key,
    required this.name,
    required this.nav,
    required this.callback,
    this.icon = Icons.arrow_right,
    this.offset = const Offset(0, -5),
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return TapWidget(
      onTap: () => callback(nav),
      tooltip: name,
      child: Row(
        children: [
          ToolbarButtonWidget(
            offset: offset,
            borderColor: context.colorScheme.inversePrimary,
            icon: icon,
            onPressed: () => callback(nav),
            tooltip: name,
            color: context.colorScheme.inversePrimary,
          ),
          ThemeHelper.hIndent2x,
          Expanded(
            child: Text(name, style: textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
