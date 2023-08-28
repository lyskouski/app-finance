// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/delayed_call.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:flutter/material.dart';

abstract class AbstractSelector extends StatefulWidget {
  final dynamic value;
  late final FocusNode focus;
  late final int focusOrder;

  AbstractSelector({
    super.key,
    this.value,
  }) {
    focus = FocusController.getFocusNode(value);
    focusOrder = FocusController.current;
  }
}

abstract class AbstractSelectorState<T extends AbstractSelector> extends State<T> {
  bool isFocused = false;
  bool wasOpened = false;

  final delay = DelayedCall(300);
  final textController = SearchController();

  void onTap(BuildContext context);

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    isFocused = FocusController.isFocused(widget.focusOrder, widget.value);
    FocusController.recordPosition(context);
    if (!widget.focus.hasFocus && isFocused && widget.value == null) {
      delay.run(() => WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && widget.value == null && !wasOpened) {
              setState(() => wasOpened = true);
              onTap(context);
            }
          }));
    }
    return buildContent(context);
  }
}
