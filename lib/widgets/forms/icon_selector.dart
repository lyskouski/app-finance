// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class IconSelector extends StatelessWidget {
  List<IconData> options;
  Function setState;
  IconData? value;

  IconSelector({
    super.key,
    this.value,
    required this.options,
    required this.setState,
  });

  @override
  Widget build(context) {
    return TextFormField(
      onTap: () async {
        IconData? icon = await FlutterIconPicker.showIconPicker(context,
            iconPackModes: [IconPack.material]);
        setState(icon);
      },
      readOnly: true,
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
