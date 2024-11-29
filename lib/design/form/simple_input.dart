// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/wrapper/focus_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

abstract class SimpleInputFormatter {
  static get filterDouble => FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?(\d+)?'));
  static get filterInt => FilteringTextInputFormatter.allow(RegExp(r'\d+'));
}

class SimpleInput extends StatelessWidget {
  final Function? setState;
  final String? tooltip;
  final TextInputType type;
  final FocusController? focusController;
  final List<TextInputFormatter>? formatter;
  final TextEditingController controller;
  final bool obscure;
  final bool withLabel;
  final bool forceFocus;
  final Color? hintColor;
  final Function(String)? onFieldSubmitted;

  SimpleInput({
    super.key,
    required this.controller,
    this.onFieldSubmitted,
    this.focusController,
    this.setState,
    this.tooltip,
    this.formatter,
    this.hintColor,
    this.type = TextInputType.text,
    this.obscure = false,
    this.withLabel = false,
    this.forceFocus = false,
  }) {
    if (setState != null) {
      controller.addListener(() => setState!(controller.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    final indent = ThemeHelper.getIndent(1.5);
    final textTheme = context.textTheme;
    final focusController = this.focusController ?? FocusWrapper.of(context);
    return Directionality(
      textDirection: AppDesign.getAlignment<TextDirection>(),
      child: Semantics(
        container: true,
        textField: true,
        label: tooltip,
        attributedHint: tooltip != null ? AttributedString(tooltip!) : null,
        child: TextFormField(
          controller: controller,
          inputFormatters: formatter,
          style: textTheme.numberMedium,
          keyboardAppearance: context.colorScheme.brightness,
          obscureText: obscure,
          obscuringCharacter: '*',
          keyboardType: type,
          focusNode: focusController?.bind(this, context: context, value: controller.text),
          textInputAction: focusController?.getAction(this),
          onTap: () => focusController?.onFocus(this),
          onEditingComplete: () => focusController?.onEditingComplete(this),
          onFieldSubmitted: onFieldSubmitted,
          autofocus: forceFocus ? forceFocus : focusController?.isFocused(this) ?? false,
          decoration: InputDecoration(
            filled: true,
            border: InputBorder.none,
            fillColor: context.colorScheme.fieldBackground,
            contentPadding: EdgeInsets.fromLTRB(indent / 1.5, withLabel ? 1 : indent, 0, indent),
            hintText: withLabel ? null : tooltip,
            hintStyle: textTheme.tooltipMedium,
            labelText: withLabel ? tooltip : null,
            labelStyle: textTheme.tooltipMedium,
          ),
        ),
      ),
    );
  }
}
