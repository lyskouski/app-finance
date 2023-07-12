// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimpleInput extends StatefulWidget {
  final Function setState;
  final TextStyle? style;
  final String? value;
  final String? tooltip;
  final TextInputType type;
  final List<TextInputFormatter>? formatter;
  final int focusOrder;

  static FilteringTextInputFormatter filterDouble =
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'));

  const SimpleInput({
    super.key,
    this.value,
    this.style,
    this.tooltip,
    this.formatter,
    this.type = TextInputType.text,
    this.focusOrder = FocusController.DEFAULT,
    required this.setState,
  });

  @override
  SimpleInputState createState() => SimpleInputState();
}

class SimpleInputState extends State<SimpleInput> {
  final TextEditingController _controller = TextEditingController();
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    if (!isChanged) {
      setState(() {
        _controller.text = widget.value ?? '';
      });
    }
    FocusController.setContext(widget.focusOrder, widget.value);
    return TextFormField(
      controller: _controller,
      inputFormatters: widget.formatter,
      keyboardType: widget.type,
      focusNode: FocusController.getFocusNode(),
      textInputAction: FocusController.getAction(),
      onEditingComplete: () {
        isChanged = false;
        FocusController.onEditingComplete();
      },
      autofocus: FocusController.isFocused(),
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
        hintText: widget.tooltip,
        hintStyle: widget.style,
      ),
      onChanged: (value) {
        isChanged = true;
        widget.setState(value);
      },
    );
  }
}
