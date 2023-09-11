// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class _Sizes {
  static const half = 4.0;
  static const normal = 8.0;
  static const double = 16.0;
  static const triple = 24.0;
  static const quatre = 32.0;
}

class ThemeHelper {
  static const emptyBox = SizedBox();
  static const formEndBox = SizedBox(height: 70);
  static const hIndent = SizedBox(height: _Sizes.normal);
  static const hIndent2x = SizedBox(height: _Sizes.double);
  static const hIndent3x = SizedBox(height: _Sizes.triple);
  static const hIndent4x = SizedBox(height: _Sizes.quatre);
  static const hIndent05 = SizedBox(height: _Sizes.half);
  static const wIndent = SizedBox(width: _Sizes.normal);
  static const wIndent2x = SizedBox(width: _Sizes.double);

  static double getIndent([double multiply = 1]) => _Sizes.normal * multiply;

  static double getWidth(BuildContext context, [double multiply = 4]) =>
      MediaQuery.sizeOf(context).width - getIndent() * multiply;

  static double getHeight(BuildContext context, [double multiply = 2]) =>
      MediaQuery.sizeOf(context).height - getIndent() * multiply;

  static bool isKeyboardVisible(BuildContext context) => MediaQuery.of(context).viewInsets.bottom > 0;

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

  static bool isTextExceedWidth(String txt, TextStyle? style, double maxWidth) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: txt,
        style: style,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
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
