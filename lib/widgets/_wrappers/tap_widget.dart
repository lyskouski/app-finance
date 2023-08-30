// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:flutter/material.dart';

class TapWidget extends StatelessWidget {
  final Widget child;
  final String? tooltip;
  final String? route;
  final Function? onTap;
  final bool toWrap;

  const TapWidget({
    super.key,
    required this.child,
    this.tooltip,
    this.route,
    this.onTap,
    this.toWrap = true,
  });

  @override
  Widget build(context) {
    if (!toWrap) {
      return child;
    }
    NavigatorState nav = Navigator.of(context);
    return Tooltip(
      message: tooltip ?? AppLocale.labels.homeTooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!();
            } else if (route != '') {
              nav.pushNamed(route ?? AppRoute.homeRoute);
            }
          },
          child: Container(
            color: Colors.transparent,
            child: child,
          ),
        ),
      ),
    );
  }
}
