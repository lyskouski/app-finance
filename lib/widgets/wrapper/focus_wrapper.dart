// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:flutter/material.dart';

class FocusWrapper extends InheritedWidget {
  final FocusController controller;

  const FocusWrapper({
    super.key,
    required this.controller,
    required Widget child,
  }) : super(child: child);

  static FocusController? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FocusWrapper>()?.controller;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
