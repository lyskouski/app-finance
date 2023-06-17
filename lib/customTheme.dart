import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  const CustomTheme({
    required this.windowType,
  });

  final AdaptiveWindowType windowType;

  bool isLower(AdaptiveWindowType size) => windowType <= size;

  double getIndent() => isLower(AdaptiveWindowType.small) ? 8.0 : 16.0;

  double letterSpacingOrNone(double letterSpacing) => kIsWeb ? 0.0 : letterSpacing;

  TextTheme getFonts(TextTheme base) {
    return base.copyWith(
      bodyMedium: GoogleFonts.robotoCondensed(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacingOrNone(0.5),
      ),
      bodyLarge: GoogleFonts.eczar(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacingOrNone(1.4),
      ),
      labelLarge: GoogleFonts.robotoCondensed(
        fontWeight: FontWeight.w700,
        letterSpacing: letterSpacingOrNone(2.8),
      ),
      headlineSmall: GoogleFonts.eczar(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacingOrNone(1.4),
      ),
    );
  }
}
