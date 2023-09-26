// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:math';

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/components/components_data.dart';
import 'package:flutter/material.dart';

class DraggablePointer extends StatefulWidget {
  final Map<String, dynamic> data;
  final bool topLeft;
  final Function()? onDragStarted;
  final Function(DraggableDetails)? onDragEnd;

  const DraggablePointer(
    this.data, {
    super.key,
    required this.onDragStarted,
    required this.onDragEnd,
    this.topLeft = true,
  });

  @override
  DraggablePointerState createState() => DraggablePointerState();
}

class DraggablePointerState extends State<DraggablePointer> {
  Color? color;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final border = BorderSide(width: 4, color: context.colorScheme.primary);
    final size = [ThemeHelper.getHeight(context) / 3, ThemeHelper.getWidth(context) / 3].reduce(min);
    return Container(
      margin: EdgeInsets.all(ThemeHelper.getIndent(0.1)),
      child: Draggable<ComponentData>(
        data: widget.data,
        onDragEnd: widget.onDragEnd,
        onDragStarted: widget.onDragStarted,
        feedback: Transform.translate(
          offset: widget.topLeft ? Offset.zero : Offset(-size, -size),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: widget.topLeft ? border : BorderSide.none,
                left: widget.topLeft ? border : BorderSide.none,
                bottom: widget.topLeft ? BorderSide.none : border,
                right: widget.topLeft ? BorderSide.none : border,
              ),
            ),
            height: size,
            width: size,
          ),
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.resizeDownRight,
          onEnter: (_) => setState(() => color = colorScheme.primary.withOpacity(0.5)),
          onExit: (_) => setState(() => color = null),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color ?? context.colorScheme.secondary.withOpacity(0.4),
            ),
          ),
        ),
      ),
    );
  }
}
