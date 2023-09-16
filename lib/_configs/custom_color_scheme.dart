// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class AppColors {
  late AppDefaultColors palette;

  static const String colorApp = '0';
  static const String colorSystem = '1';
  static const String colorUser = '2';

  AppColors(Brightness brightness) {
    if (brightness == Brightness.dark) {
      palette = AppDarkColors();
    } else {
      palette = AppDefaultColors();
    }
  }
}

class AppDefaultColors {
  Color get primary => const Color(0xff912391);
  Color get inversePrimary => const Color(0xffdca3bc);
  Color get onSecondary => Colors.white;
  Color get onSecondaryContainer => Colors.grey.withOpacity(0.7);
  Color get secondary => Colors.black;
}

class AppDarkColors implements AppDefaultColors {
  @override
  Color get primary => const Color(0xff912391);
  @override
  Color get inversePrimary => const Color(0xff5d233c);
  @override
  Color get onSecondary => Colors.grey;
  @override
  Color get onSecondaryContainer => Colors.grey;
  @override
  Color get secondary => Colors.grey;
}

extension CustomColorScheme on ColorScheme {
  Color get fieldBackground => inversePrimary.withOpacity(0.3);

  ColorScheme withCustom(String paletteType) {
    if (paletteType == AppColors.colorSystem) {
      return this;
    }
    final palette = AppColors(brightness).palette;
    return copyWith(
      primary: palette.primary,
      onPrimary: palette.secondary,
      inversePrimary: palette.inversePrimary,
      secondary: palette.secondary,
      onSecondary: palette.onSecondary,
      onSecondaryContainer: palette.onSecondaryContainer,
      onSurface: palette.secondary,
      onInverseSurface: Colors.white,
      onSurfaceVariant: palette.secondary,
    );
  }
}

extension CustomButtonTheme on FloatingActionButtonThemeData {
  FloatingActionButtonThemeData withCustom(String paletteType, Brightness brightness) {
    if (paletteType == AppColors.colorSystem) {
      return this;
    }
    final palette = AppColors(brightness).palette;
    return copyWith(
      backgroundColor: palette.inversePrimary,
      foregroundColor: palette.onSecondary,
    );
  }
}
