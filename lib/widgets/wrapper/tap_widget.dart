// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class TapWidget extends StatelessWidget {
  final Widget child;
  final String? tooltip;
  final RouteSettings? route;
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
    return Semantics(
      attributedHint: AttributedString(tooltip ?? AppLocale.labels.tapToOpen),
      child: Tooltip(
        message: tooltip ?? AppLocale.labels.homeTooltip,
        child: InkWell(
          onTap: () {
            if (onTap != null) {
              onTap!();
            } else if (route?.name != '') {
              nav.pushNamed(route?.name ?? AppRoute.homeRoute, arguments: route?.arguments);
            }
          },
          child: child,
        ),
      ),
    );
  }
}
