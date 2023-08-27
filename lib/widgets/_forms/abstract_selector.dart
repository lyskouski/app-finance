// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/delayed_call.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:flutter/material.dart';

abstract class AbstractSelector extends StatefulWidget {
  final dynamic value;

  const AbstractSelector({
    super.key,
    this.value,
  });
}

abstract class AbstractSelectorState<T extends AbstractSelector> extends State<T> {
  late final FocusNode focus;
  late final int focusOrder;
  bool isFocused = false;

  final delay = DelayedCall(300);
  final textController = SearchController();

  @override
  initState() {
    super.initState();
    focus = FocusController.getFocusNode(widget.value);
    focusOrder = FocusController.current;
  }

  void onTap(BuildContext context);

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    isFocused = FocusController.isFocused(focusOrder, widget.value);
    FocusController.recordPosition(context);
    if (!focus.hasFocus && isFocused && widget.value == null) {
      delay.run(() => WidgetsBinding.instance.addPostFrameCallback((_) => onTap(context)));
    }
    return buildContent(context);
  }
}
