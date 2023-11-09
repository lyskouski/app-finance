// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:flutter/material.dart';

typedef ScreenHelperState = ({
  bool isWide,
  bool isBottom,
  bool isWearable,
  bool isRight,
  bool isLeftBar,
  double height,
  double width,
});

class ScreenHelper {
  static ScreenHelper? _instance;
  bool isWide = false;
  bool isBottom = false;
  bool isWearable = false;
  bool isRight = false;
  bool isLeftBar = false;
  double height = 0;
  double width = 0;
  double originWidth = 0;

  @protected
  ScreenHelper(BuildContext context, BoxConstraints constraints) {
    init(context, constraints);
  }

  void init(BuildContext context, BoxConstraints constraints) {
    isWide = ThemeHelper.isWideScreen(constraints);
    isBottom = ThemeHelper.isNavBottom(constraints);
    isWearable = ThemeHelper.isWearableMode(context, constraints);
    isRight = ThemeHelper.isNavRight(context, constraints);
    isLeftBar = ThemeHelper.getHeight(context) < 520;
    height = ThemeHelper.getHeight(context);
    originWidth = ThemeHelper.getWidth(context);
    width = ThemeHelper.getWidth(context, 0, constraints);
  }

  static ScreenHelperState state() => _instance == null
      ? (
          isWide: false,
          isBottom: false,
          isWearable: false,
          isRight: false,
          isLeftBar: false,
          height: 0,
          width: 0,
        )
      : (
          isWide: _instance!.isWide,
          isBottom: _instance!.isBottom,
          isWearable: _instance!.isWearable,
          isRight: _instance!.isRight,
          isLeftBar: _instance!.isLeftBar,
          height: _instance!.height,
          width: _instance!.width,
        );

  static ScreenHelperState getInstance(BuildContext context, BoxConstraints constraints) {
    _instance ??= ScreenHelper(context, constraints);
    if (_instance!.originWidth != ThemeHelper.getWidth(context)) {
      _instance!.init(context, constraints);
    }
    return state();
  }
}
