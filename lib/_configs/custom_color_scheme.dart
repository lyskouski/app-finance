// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/herald/app_palette.dart';
import 'package:flutter/material.dart';

class AppColors {
  late AppDefaultColors palette;

  static const String colorApp = '0';
  static const String colorSystem = '1';
  static const String colorUser = '2';

  AppColors(String paletteType, Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    if (paletteType == colorUser) {
      palette = AppDefaultColors.fromString(isDark ? AppPalette.dark : AppPalette.light);
    } else if (isDark) {
      palette = AppDarkColors();
    } else {
      palette = AppDefaultColors();
    }
  }
}

class AppDefaultColors {
  Color primary = const Color(0xff912391);
  Color inversePrimary = const Color(0xffdca3bc);
  Color onSecondary = Colors.white;
  Color onSecondaryContainer = Colors.grey.withOpacity(0.7);
  Color secondary = Colors.black;

  AppDefaultColors();

  @override
  String toString() {
    return json.encode(toJson());
  }

  Map<String, dynamic> toJson() => {
        'primary': primary.value,
        'inversePrimary': inversePrimary.value,
        'onSecondary': onSecondary.value,
        'onSecondaryContainer': onSecondaryContainer.value,
        'secondary': secondary.value,
      };

  factory AppDefaultColors.fromString(String data) {
    return AppDefaultColors.fromJson(json.decode(data));
  }

  factory AppDefaultColors.fromJson(Map<String, dynamic> json) {
    return AppDefaultColors()
      ..primary = Color(json['primary'])
      ..inversePrimary = Color(json['inversePrimary'])
      ..onSecondary = Color(json['onSecondary'])
      ..onSecondaryContainer = Color(json['onSecondaryContainer'])
      ..secondary = Color(json['secondary']);
  }
}

class AppDarkColors extends AppDefaultColors {
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

  ColorScheme? withCustom(String paletteType) {
    if (paletteType == AppColors.colorSystem) {
      return null;
    }
    final palette = AppColors(paletteType, brightness).palette;
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
  FloatingActionButtonThemeData? withCustom(String paletteType, Brightness brightness) {
    if (paletteType == AppColors.colorSystem) {
      return null;
    }
    final palette = AppColors(paletteType, brightness).palette;
    return copyWith(
      backgroundColor: palette.inversePrimary,
      foregroundColor: palette.onSecondary,
    );
  }
}
