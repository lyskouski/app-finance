// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimpleInput extends StatelessWidget {
  Function setState;
  TextStyle? style;
  String? value;
  String? tooltip;
  TextInputType type;
  List<TextInputFormatter>? formatter;

  SimpleInput({
    super.key,
    this.value,
    this.style,
    this.tooltip,
    this.formatter,
    this.type = TextInputType.text,
    required this.setState,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value ?? '',
      inputFormatters: formatter,
      keyboardType: type,
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
        hintText: tooltip,
        hintStyle: style,
      ),
      onChanged: (value) => setState(value),
    );
  }
}
