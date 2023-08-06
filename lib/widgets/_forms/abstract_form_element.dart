// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:flutter/material.dart';

abstract class AbstractFormElement extends StatefulWidget {
  final String? value;
  final int focusOrder;

  AbstractFormElement({
    this.value,
    this.focusOrder = FocusController.DEFAULT,
  }) : super(key: UniqueKey());
}

abstract class AbstractFormElementState<T extends AbstractFormElement> extends State<T> {
  final defaultFocus = FocusNode();
  bool isFocused = false;
  late FocusNode focus;
  late String value;

  @override
  initState() {
    super.initState();
    changeInitialState();
  }

  void changeInitialState() {
    value = widget.value ?? '';
    isFocused = false;
  }

  Widget buildContent(BuildContext context);

  void onFocus() {
    if (mounted) {
      isFocused = true;
    }
    FocusController.scrollToFocusedElement(focus);
    focus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    if (!mounted) {
      return Container();
    }
    FocusController.init(widget.focusOrder, widget.value);
    focus = FocusController.getFocusNode() ?? defaultFocus;
    if ((widget.value ?? '') != value && !focus.hasFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(changeInitialState));
    }
    if (value == '' && focus.hasFocus && !isFocused) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(onFocus));
    }
    return buildContent(context);
  }
}
