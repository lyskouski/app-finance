// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class IconSelector extends StatefulWidget {
  final Function setState;
  final IconData? value;
  final int focusOrder;

  const IconSelector({
    super.key,
    required this.setState,
    this.value,
    this.focusOrder = FocusController.DEFAULT,
  });

  @override
  IconSelectorState createState() => IconSelectorState();
}

class IconSelectorState extends State<IconSelector> {
  bool isOpened = false;

  Future<void> onTap(context) async {
    setState(() => isOpened = true);
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.material]);
    widget.setState(icon);
    setState(() => isOpened = false);
    FocusController.resetFocus();
  }

  @override
  Widget build(context) {
    FocusController.setContext(widget.focusOrder, widget.value);
    if (!isOpened &&
        widget.value == null &&
        widget.focusOrder > FocusController.DEFAULT &&
        FocusController.isFocused()) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!isOpened && widget.value == null) {
          onTap(context);
        }
      });
    }
    return TextFormField(
      onTap: () => onTap(context),
      readOnly: true,
      focusNode: FocusController.getFocusNode(),
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
        prefixIcon: Icon(widget.value),
        suffixIcon: GestureDetector(
          child: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}
