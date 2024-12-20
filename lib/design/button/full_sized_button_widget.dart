// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:provider/provider.dart';

typedef OnPressedFunction = void Function();

class FullSizedButtonWidget extends StatelessWidget {
  final OnPressedFunction onPressed;
  final String title;
  final IconData icon;
  final BoxConstraints? constraints;
  final FocusController? controller;
  late final String heroTag;

  FullSizedButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    required this.icon,
    this.constraints,
    this.controller,
  }) : heroTag = 'fz_button_${UniqueKey()}';

  @override
  Widget build(BuildContext context) {
    final isBottom = constraints != null ? ThemeHelper.isNavBottom(constraints!) : false;
    final bool isKeyboardVisible = ThemeHelper.isKeyboardVisible(context) || isBottom;
    final colorScheme = context.colorScheme;
    final indent = ThemeHelper.getIndent(4);
    final width = constraints != null ? constraints!.maxWidth - indent - 2 : double.infinity;
    final isWide = ScreenHelper.state().isWide;
    return ChangeNotifierProvider(
      create: (context) => _HoverModel(),
      child: Container(
        margin: isWide ? EdgeInsets.only(left: ThemeHelper.menuWidth + indent) : EdgeInsets.zero,
        width: isKeyboardVisible ? null : width,
        child: Consumer<_HoverModel>(builder: (context, hoverModel, _) {
          final color = context.textTheme.bodyLarge?.color;
          return MouseRegion(
            onEnter: (_) => hoverModel.setHover(true),
            onExit: (_) => hoverModel.setHover(false),
            child: Semantics(
              attributedLabel: AttributedString(title),
              button: true,
              child: FloatingActionButton(
                heroTag: heroTag,
                onPressed: onPressed,
                hoverColor: colorScheme.primary,
                focusColor: colorScheme.primary.withValues(alpha: 0.8),
                tooltip: title,
                focusNode: controller?.last(this),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      semanticLabel: title,
                      size: 32,
                      color: hoverModel.isHovered ? colorScheme.onPrimary : color,
                    ),
                    if (!isKeyboardVisible)
                      Container(
                        padding: EdgeInsets.only(left: ThemeHelper.getIndent()),
                        constraints: BoxConstraints(maxWidth: width - 34),
                        child: TextWrapper(
                          title,
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: hoverModel.isHovered ? colorScheme.onPrimary : color),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _HoverModel extends ChangeNotifier {
  bool isHovered = false;

  void setHover(bool value) {
    if (isHovered != value) {
      isHovered = value;
      notifyListeners();
    }
  }
}
