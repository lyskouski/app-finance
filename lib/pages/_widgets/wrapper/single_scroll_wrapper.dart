// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/pages/_widgets/wrapper/focus_wrapper.dart';
import 'package:flutter/material.dart';

class SingleScrollWrapper extends StatelessWidget {
  final FocusController controller;
  final Widget child;

  const SingleScrollWrapper({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FocusWrapper(
      controller: controller,
      child: SingleChildScrollView(controller: controller.controller, child: child),
    );
  }
}
