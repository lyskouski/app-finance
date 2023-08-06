// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/widgets/_forms/abstract_form_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimpleInput extends AbstractFormElement {
  final Function? setState;
  final TextStyle? style;
  final String? tooltip;
  final TextInputType type;
  final List<TextInputFormatter>? formatter;
  final TextEditingController controller;

  static FilteringTextInputFormatter filterDouble = FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'));

  SimpleInput({
    required this.controller,
    this.setState,
    this.style,
    this.tooltip,
    this.formatter,
    this.type = TextInputType.text,
    super.focusOrder,
  }) : super(value: controller.text) {
    if (setState != null) {
      controller.addListener(() => setState!(controller.text));
    }
  }

  @override
  SimpleInputState createState() => SimpleInputState();
}

class SimpleInputState extends AbstractFormElementState<SimpleInput> {
  @override
  Widget buildContent(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      inputFormatters: widget.formatter,
      keyboardType: widget.type,
      focusNode: focus,
      textInputAction: FocusController.getAction(),
      onTap: onFocus,
      onEditingComplete: FocusController.onEditingComplete,
      autofocus: FocusController.isFocused(),
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
        hintText: widget.tooltip,
        hintStyle: widget.style,
      ),
    );
  }
}
