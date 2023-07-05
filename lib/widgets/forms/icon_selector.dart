// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class IconSelector extends StatelessWidget {
  Function setState;
  IconData? value;
  int focusOrder;
  bool isOpened = false;

  IconSelector({
    super.key,
    required this.setState,
    this.value,
    this.focusOrder = -1,
  });

  Future<void> onTap(context) async {
    isOpened = true;
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.material]);
    isOpened = false;
    setState(icon);
    FocusController.resetFocus();
  }

  @override
  Widget build(context) {
    FocusController.setContext(focusOrder, value);
    if (!isOpened && focusOrder > -1 && FocusController.isFocused()) {
      Future.delayed(const Duration(milliseconds: 300), () {
        onTap(context);
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
        prefixIcon: Icon(value),
        suffixIcon: GestureDetector(
          child: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}
