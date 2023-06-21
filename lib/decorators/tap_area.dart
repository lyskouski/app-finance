// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/routes.dart' as routes;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class TapArea extends StatelessWidget {
  final Widget child;
  String? tooltip;
  String? route;

  TapArea({
    super.key, 
    required this.child,
    this.tooltip,
    this.route,
  });

  @override
  Widget build(context) {
    return Tooltip(
      message: tooltip ?? AppLocalizations.of(context)!.homeTooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, route ?? routes.homeRoute),
          child: child,
        ),
      ),
    );
  }
}
