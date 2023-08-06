// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimpleInput extends StatelessWidget {
  final Function? setState;
  final TextStyle? style;
  final String? tooltip;
  final TextInputType type;
  final List<TextInputFormatter>? formatter;
  final TextEditingController controller;
  final int focusOrder;
  late final FocusNode focus;

  static FilteringTextInputFormatter filterDouble = FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'));

  SimpleInput({
    super.key,
    required this.controller,
    this.setState,
    this.style,
    this.tooltip,
    this.formatter,
    this.type = TextInputType.text,
    this.focusOrder = FocusController.DEFAULT,
  }) {
    if (setState != null) {
      controller.addListener(() => setState!(controller.text));
    }
    FocusController.init(focusOrder, controller.text);
    focus = FocusController.getFocusNode() ?? FocusNode();
  }

  void onFocus() {
    FocusController.scrollToFocusedElement(focus);
    focus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: formatter,
      keyboardType: type,
      focusNode: focus,
      textInputAction: FocusController.getAction(),
      onTap: onFocus,
      onEditingComplete: () => FocusController.onEditingComplete(focusOrder),
      autofocus: FocusController.isFocused(),
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
        hintText: tooltip,
        hintStyle: style,
      ),
    );
  }
}
