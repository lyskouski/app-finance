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
  late String value;

  @override
  initState() {
    super.initState();
    value = widget.value ?? '';
    _controller.text = value;
  }

  void delayedUpdate(newValue) {
    setState(() {
      isChanged = true;
      value = newValue;
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      if (newValue == value && isChanged) {
        widget.setState(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusController.setContext(widget.focusOrder, widget.value);
    return TextFormField(
      controller: _controller,
      inputFormatters: widget.formatter,
      keyboardType: widget.type,
      focusNode: FocusController.getFocusNode(),
      textInputAction: FocusController.getAction(),
      onEditingComplete: () {
        setState(() => isChanged = false);
        widget.setState(value);
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
      onChanged: delayedUpdate,
    );
  }
}
