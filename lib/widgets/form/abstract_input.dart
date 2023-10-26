// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/widgets/wrapper/focus_wrapper.dart';
import 'package:flutter/material.dart';

abstract class AbstractInput extends StatelessWidget {
  late final FocusNode focus;
  late final FocusController? focusController;
  final dynamic value;

  // ignore: prefer_const_constructors_in_immutables
  AbstractInput({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    focusController = FocusWrapper.of(context);
    focus = focusController?.bind(this, context: context, value: value) ?? FocusNode();
    return buildContent(context);
  }

  Widget buildContent(BuildContext context);
}
