import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';

class CustomTheme {
  const CustomTheme({
    required this.windowType,
  });

  final AdaptiveWindowType windowType;

  bool isLower(AdaptiveWindowType size) => windowType <= size;

  double getIndent() => isLower(AdaptiveWindowType.small) ? 8.0 : 16.0;
}
