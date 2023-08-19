// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';

class ResponsiveMatrix {
  final AdaptiveWindowType windowType;

  const ResponsiveMatrix({
    required this.windowType,
  });

  bool isLower(AdaptiveWindowType size) => windowType <= size;
}
