import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';

class CustomTheme {
  const CustomTheme({
    required this.windowType,
  });

  final AdaptiveWindowType windowType;

  bool isLower(AdaptiveWindowType size) {
    return windowType <= size;
  }

  double getIndent() {
    return isLower(AdaptiveWindowType.small) ? 8.0 : 16.0;
  }
}
