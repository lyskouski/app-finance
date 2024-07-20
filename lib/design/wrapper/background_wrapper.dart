// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  final int index;
  final Widget child;

  const BackgroundWrapper({
    super.key,
    required this.index,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index % 2 == 0 ? context.colorScheme.onSurface.withOpacity(0.015) : null,
      child: child,
    );
  }
}
