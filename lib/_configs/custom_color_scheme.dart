import 'package:flutter/material.dart';

class AppColors {
  late AppDefaultColors palette;

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
  Color get onButton => Colors.white;
  Color get button => Colors.grey.withOpacity(0.7);
  Color get secondary => Colors.black;
}

class AppDarkColors implements AppDefaultColors {
  @override
  Color get primary => const Color(0xff912391);
  @override
  Color get inversePrimary => const Color(0xff5d233c);
  @override
  Color get onButton => Colors.grey;
  @override
  Color get button => Colors.grey;
  @override
  Color get secondary => Colors.grey;
}

extension CustomColorScheme on ColorScheme {
  Color get fieldBackground => inversePrimary.withOpacity(0.2);

  Color get onButton => AppColors(brightness).palette.onButton;

  Color get button => AppColors(brightness).palette.button;

  ColorScheme withCustom() {
    final palette = AppColors(brightness).palette;
    return copyWith(
      primary: palette.primary,
      onPrimary: palette.secondary,
      inversePrimary: palette.inversePrimary,
      secondary: palette.secondary,
      onSurface: palette.secondary,
      onInverseSurface: Colors.white,
      onSurfaceVariant: palette.secondary,
    );
  }
}

extension CustomButtonTheme on FloatingActionButtonThemeData {
  FloatingActionButtonThemeData withCustom(Brightness brightness) {
    final palette = AppColors(brightness).palette;
    return copyWith(
      backgroundColor: palette.inversePrimary,
      foregroundColor: palette.onButton,
    );
  }
}
