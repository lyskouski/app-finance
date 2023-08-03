// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/delayed_call.dart';
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

  static FilteringTextInputFormatter filterDouble = FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'));

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
  final FocusNode defaultFocus = FocusNode();
  final DelayedCall delay = DelayedCall(600);
  late String value;
  bool isFocused = false;

  @override
  initState() {
    super.initState();
    changeInitialState();
  }

  @override
  dispose() {
    super.dispose();
    delay.cancel();
  }

  void changeInitialState() {
    value = widget.value ?? '';
    _controller.text = value;
    isFocused = false;
  }

  void delayedUpdate(newValue) {
    delay.run(() {
      widget.setState(newValue);
      setState(() => value = newValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusController.init(widget.focusOrder, widget.value);
    final focus = FocusController.getFocusNode() ?? defaultFocus;
    if ((widget.value ?? '') != value && !focus.hasFocus) {
      Future.delayed(Duration.zero, () => setState(changeInitialState));
    }
    if (widget.value == '' && focus.hasFocus && !isFocused) {
      Future.delayed(Duration.zero, () => setState(() => isFocused = true));
      Future.delayed(Duration.zero, () => FocusController.scrollToFocusedElement(focus));
    }
    return TextFormField(
      controller: _controller,
      inputFormatters: widget.formatter,
      keyboardType: widget.type,
      focusNode: focus,
      textInputAction: FocusController.getAction(),
      onEditingComplete: () {
        widget.setState(value);
        FocusController.onEditingComplete();
      },
      autofocus: FocusController.isFocused(),
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
        hintText: widget.tooltip,
        hintStyle: widget.style,
      ),
      onChanged: delayedUpdate,
    );
  }
}
