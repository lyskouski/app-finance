// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension CustomTextTheme on TextTheme {
  TextTheme? withCustom(String paletteType, Brightness brightness) {
    final color = AppColors(paletteType, brightness).palette.secondary;
    return copyWith(
      titleLarge: GoogleFonts.abel(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      titleMedium: GoogleFonts.abel(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      titleSmall: GoogleFonts.abel(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      headlineLarge: GoogleFonts.abel(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      headlineMedium: GoogleFonts.abel(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineSmall: GoogleFonts.abel(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      bodyLarge: GoogleFonts.abel(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      bodyMedium: GoogleFonts.abel(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodySmall: GoogleFonts.abel(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      labelLarge: GoogleFonts.abel(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: GoogleFonts.abel(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      labelSmall: GoogleFonts.abel(
        fontSize: 8,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  TextStyle get tooltipSmall => GoogleFonts.robotoCondensed(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: titleLarge?.color?.withValues(alpha: 0.4),
      );

  TextStyle get tooltipMedium => GoogleFonts.robotoCondensed(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: titleLarge?.color?.withValues(alpha: 0.4),
      );

  TextStyle get numberLarge => GoogleFonts.robotoCondensed(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: titleLarge?.color,
      );

  TextStyle get numberMedium => GoogleFonts.robotoCondensed(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: titleLarge?.color,
      );

  TextStyle get numberSmall => GoogleFonts.robotoCondensed(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: titleLarge?.color,
      );
}
