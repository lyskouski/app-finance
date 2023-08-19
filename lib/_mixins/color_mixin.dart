// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';

mixin ColorMixin {
  MaterialColor convertToMaterialColor(Color color) {
    final Map<int, Color> colorMap = {};
    final red = color.red;
    final green = color.green;
    final blue = color.blue;
    for (int i = 50; i <= 900; i += 100) {
      colorMap[i] = Color.fromRGBO(red, green, blue, i / 1000.0);
    }
    return MaterialColor(color.value, colorMap);
  }

  MaterialColor getRandomMaterialColor() {
    List<Color> colors = Colors.primaries;
    Random random = Random();
    Color randomColor = colors[random.nextInt(colors.length)];
    return convertToMaterialColor(randomColor);
  }
}
