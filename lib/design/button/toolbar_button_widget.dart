// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

typedef FnCall = void Function();

class ToolbarButtonWidget extends StatefulWidget {
  final Color color;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Offset? offset;
  final bool isWide;
  final FnCall onPressed;
  final String tooltip;
  final String? semanticLabel;
  final IconData icon;
  final IconData? selectedIcon;
  final bool? isSelected;
  final double? maxWidth;

  const ToolbarButtonWidget({
    super.key,
    required this.onPressed,
    required this.tooltip,
    required this.color,
    required this.icon,
    this.selectedIcon,
    this.selectedColor,
    this.semanticLabel,
    this.isSelected,
    this.borderColor,
    this.backgroundColor,
    this.offset,
    this.maxWidth,
    this.isWide = false,
  });

  @override
  ToolbarButtonWidgetState createState() => ToolbarButtonWidgetState();
}

class ToolbarButtonWidgetState extends State<ToolbarButtonWidget> {
  late Color initColor;
  late Color color = widget.color;
  bool isHover = false;

  _onEnter(_) => setState(() {
        color = Colors.white54;
        isHover = true;
      });

  _onExit(_) => setState(() {
        color = widget.color;
        isHover = false;
      });

  @override
  Widget build(BuildContext context) {
    final indent = ThemeHelper.getIndent();
    initColor = widget.backgroundColor ?? context.colorScheme.surface.withValues(alpha: 0.1);
    return Semantics(
      attributedHint: AttributedString(AppLocale.labels.typeButton),
      attributedLabel: AttributedString(widget.semanticLabel ?? widget.tooltip),
      child: MouseRegion(
        onEnter: _onEnter,
        onExit: _onExit,
        child: Container(
          margin: const EdgeInsets.all(2.0),
          padding: const EdgeInsets.all(1.0),
          height: 42,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: isHover ? Colors.black54 : initColor,
            border: Border.all(color: widget.borderColor ?? Colors.white30, width: 1),
          ),
          child: Material(
            elevation: 0,
            color: Colors.transparent,
            borderRadius: BorderRadius.zero,
            child: Center(
              child: widget.isWide
                  ? InkWell(
                      onTap: widget.onPressed,
                      child: Row(
                        children: [
                          Icon(widget.icon, color: color),
                          Container(
                            width: widget.maxWidth != null ? widget.maxWidth! - 2 * indent : null,
                            padding: EdgeInsets.fromLTRB(indent, indent, indent, 0),
                            child: TextWrapper(
                              widget.tooltip,
                              maxWidth: widget.maxWidth,
                              style: context.textTheme.headlineSmall?.copyWith(color: color),
                            ),
                          ),
                        ],
                      ),
                    )
                  : IconButton(
                      tooltip: widget.tooltip,
                      onPressed: widget.onPressed,
                      isSelected: widget.isSelected,
                      hoverColor: Colors.transparent,
                      icon: Icon(widget.icon, color: color),
                      selectedIcon: widget.selectedIcon != null
                          ? Icon(
                              widget.selectedIcon,
                              color: isHover ? color : widget.selectedColor,
                            )
                          : null,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
