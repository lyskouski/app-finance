// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class ThemeHelper {
  static double getIndent([double multiply = 1]) => 8.0 * multiply;

  static double getWidth(BuildContext context, [double multiply = 4]) =>
      MediaQuery.of(context).size.width - getIndent() * multiply;

  static double getMaxHeight(List<dynamic> scope) {
    double height = 0;
    for (int i = 0; i < scope.length; i++) {
      double tmpHeight = 0;
      if (scope[i] is Text) {
        tmpHeight = ThemeHelper.getTextHeight(scope[i]);
      } else if (scope[i] is RenderBox) {
        tmpHeight = (scope[i] as RenderBox).getMaxIntrinsicHeight(double.infinity);
      }
      if (tmpHeight > height) {
        height = tmpHeight;
      }
    }
    return height;
  }

  static double getTextHeight(Text txt) {
    return _getPainter(txt).height;
  }

  static double getTextWidth(Text txt) {
    return _getPainter(txt).width;
  }

  static TextPainter _getPainter(Text txt) {
    final painter = TextPainter(
      text: TextSpan(text: txt.data, style: txt.style),
      textDirection: TextDirection.ltr,
      maxLines: txt.maxLines,
    );
    painter.layout();
    return painter;
  }

  static bool isVertical(BoxConstraints constraints) => constraints.maxWidth < constraints.maxHeight;
}
