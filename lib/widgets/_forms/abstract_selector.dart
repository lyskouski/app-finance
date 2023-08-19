// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/widgets/_forms/abstract_input.dart';
import 'package:flutter/material.dart';

abstract class AbstractSelector extends AbstractInput {
  AbstractSelector({
    super.key,
    super.value,
  }) : super();

  void onTap(BuildContext context);

  @override
  Widget build(BuildContext context) {
    FocusController.recordPosition(context);
    if (!focus.hasFocus && isFocused) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!focus.hasFocus && value == null) {
          onTap(context);
        }
      });
    }
    return buildContent(context);
  }
}
