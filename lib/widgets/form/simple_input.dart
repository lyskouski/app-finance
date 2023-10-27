// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/widgets/wrapper/focus_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class SimpleInputFormatter {
  static get filterDouble => FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'));
  static get filterInt => FilteringTextInputFormatter.allow(RegExp(r'\d+'));
}

class SimpleInput extends StatelessWidget {
  final Function? setState;
  final String? tooltip;
  final TextInputType type;
  final List<TextInputFormatter>? formatter;
  final TextEditingController controller;
  final bool obscure;
  final bool withLabel;

  SimpleInput({
    super.key,
    required this.controller,
    this.setState,
    this.tooltip,
    this.formatter,
    this.type = TextInputType.text,
    this.obscure = false,
    this.withLabel = false,
  }) {
    if (setState != null) {
      controller.addListener(() => setState!(controller.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final focusController = FocusWrapper.of(context)!;
    return TextFormField(
      controller: controller,
      inputFormatters: formatter,
      style: textTheme.numberMedium,
      keyboardAppearance: context.colorScheme.brightness,
      obscureText: obscure,
      obscuringCharacter: '*',
      keyboardType: type,
      focusNode: focusController.bind(this, context: context, value: controller.text),
      textInputAction: focusController.getAction(this),
      onTap: () => focusController.onFocus(this),
      onEditingComplete: () => focusController.onEditingComplete(this),
      autofocus: focusController.isFocused(this),
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor: context.colorScheme.fieldBackground,
        hintText: withLabel ? null : tooltip,
        hintStyle: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color!.withOpacity(0.4)),
        labelText: withLabel ? tooltip : null,
        labelStyle: textTheme.bodyMedium!.copyWith(color: textTheme.headlineSmall?.color!.withOpacity(0.4)),
      ),
    );
  }
}
