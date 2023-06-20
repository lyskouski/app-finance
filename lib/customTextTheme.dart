// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension CustomTextTheme on TextTheme {
  static double letterSpacingOrNone(double letterSpacing) =>
      kIsWeb ? 0.0 : letterSpacing;

  static TextTheme? textTheme(TextTheme? baseTheme) {
    if (baseTheme == null) {
      return null;
    }

    return baseTheme.copyWith(
      headlineLarge: GoogleFonts.abel(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacingOrNone(1.2),
      ),
      headlineMedium: GoogleFonts.abel(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacingOrNone(1.2),
      ),
      headlineSmall: GoogleFonts.abel(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacingOrNone(1.2),
      ),
      bodyLarge: GoogleFonts.abel(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacingOrNone(1.2),
      ),
      bodyMedium: GoogleFonts.abel(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacingOrNone(1.2),
      ),
      bodySmall: GoogleFonts.abel(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacingOrNone(1.6),
      ),
      labelLarge: GoogleFonts.abel(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacingOrNone(1.2),
      ),
      labelMedium: GoogleFonts.abel(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacingOrNone(1.2),
      ),
      labelSmall: GoogleFonts.abel(
        fontSize: 8,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacingOrNone(1.2),
      ),
    );
  }

  TextStyle get numberLarge => GoogleFonts.robotoCondensed(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacingOrNone(0.5),
      );
  TextStyle get numberMedium => GoogleFonts.robotoCondensed(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacingOrNone(0.5),
      );
  TextStyle get numberSmall => GoogleFonts.robotoCondensed(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacingOrNone(0.5),
      );
}
