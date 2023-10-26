// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/delayed_call.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/widgets/wrapper/focus_wrapper.dart';
import 'package:flutter/material.dart';

abstract class AbstractSelector extends StatefulWidget {
  final dynamic value;

  const AbstractSelector({super.key, this.value});
}

abstract class AbstractSelectorState<T extends AbstractSelector> extends State<T> {
  bool wasOpened = false;
  late FocusNode focus;
  late FocusController focusController;

  final delay = DelayedCall(300);
  final textController = SearchController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void onTap(BuildContext context);

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    focusController = FocusWrapper.of(context) ?? FocusController();
    focus = focusController.bind(this, context: context, value: widget.value);
    if (mounted && !wasOpened && focusController.isFocused(this) && widget.value == null) {
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
