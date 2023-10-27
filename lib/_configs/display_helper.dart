// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:flutter/material.dart';

typedef DisplayHelperState = ({
  bool isWide,
  bool isBottom,
  bool isWearable,
  bool isRight,
  bool isLeftBar,
  double height,
  double width,
});

class DisplayHelper {
  static DisplayHelper? _instance;
  bool isWide = false;
  bool isBottom = false;
  bool isWearable = false;
  bool isRight = false;
  bool isLeftBar = false;
  double height = 0;
  double width = 0;

  @protected
  DisplayHelper(BuildContext context, BoxConstraints constraints) {
    init(context, constraints);
  }

  void init(BuildContext context, BoxConstraints constraints) {
    isWide = ThemeHelper.isWideScreen(constraints);
    isBottom = ThemeHelper.isNavBottom(constraints);
    isWearable = ThemeHelper.isWearableMode(context, constraints);
    isRight = !isWearable && ThemeHelper.isNavRight(context, constraints);
    isLeftBar = ThemeHelper.getHeight(context) < 520;
    height = ThemeHelper.getHeight(context);
    width = ThemeHelper.getWidth(context, 0, constraints);
  }

  static DisplayHelperState state() => (
        isWide: _instance!.isWide,
        isBottom: _instance!.isBottom,
        isWearable: _instance!.isWearable,
        isRight: _instance!.isRight,
        isLeftBar: _instance!.isLeftBar,
        height: _instance!.height,
        width: _instance!.width,
      );

  static DisplayHelperState getInstance(BuildContext context, BoxConstraints constraints) {
    _instance ??= DisplayHelper(context, constraints);
    if (_instance!.height != ThemeHelper.getHeight(context) &&
        _instance!.width != ThemeHelper.getWidth(context, 0, constraints)) {
      _instance!.init(context, constraints);
    }
    return state();
  }
}
