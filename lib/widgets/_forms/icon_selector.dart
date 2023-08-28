// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/widgets/_forms/abstract_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class IconSelector extends AbstractSelector {
  final Function setState;
  @override
  // ignore: overridden_fields
  final IconData? value;

  IconSelector({
    super.key,
    required this.setState,
    this.value,
  }) : super(value: value);

  @override
  IconSelectorState createState() => IconSelectorState();
}

class IconSelectorState extends AbstractSelectorState<IconSelector> {
  @override
  Future<void> onTap(context) async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context, iconPackModes: [IconPack.material]);
    widget.setState(icon);
    FocusController.onEditingComplete(widget.focusOrder);
  }

  @override
  Widget buildContent(context) {
    return TextFormField(
      onTap: () => onTap(context),
      readOnly: true,
      focusNode: widget.focus,
      autofocus: isFocused,
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
        prefixIcon: Icon(widget.value),
        suffixIcon: GestureDetector(
          child: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}
