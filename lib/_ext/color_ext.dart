// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';

extension ColorExt on Color {
  MaterialColor get toMaterialColor {
    final Map<int, Color> colorMap = {};
    for (int i = 50; i <= 900; i += 100) {
      colorMap[i] = Color.fromRGBO(red, green, blue, i / 1000.0);
    }
    return MaterialColor(value, colorMap);
  }

  static Color getRandom() {
    List<Color> colors = Colors.primaries;
    Random random = Random();
    return colors[random.nextInt(colors.length)];
  }

  static MaterialColor getRandomMaterialColor() {
    return getRandom().toMaterialColor;
  }

  Color mesh(Color color, double percent) =>
      HSLColor.lerp(HSLColor.fromColor(this), HSLColor.fromColor(color), percent)!.toColor();
}
