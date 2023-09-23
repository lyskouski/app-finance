// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/components/components_builder.dart';
import 'package:flutter/material.dart';

class DraggablePointer extends StatefulWidget {
  final Map<String, dynamic> data;
  final Size? size;
  final Size? shift;
  final bool topLeft;

  const DraggablePointer(this.data, {super.key, this.size, this.shift, this.topLeft = true});

  @override
  DraggablePointerState createState() => DraggablePointerState();
}

class DraggablePointerState extends State<DraggablePointer> {
  Color? color;

  @override
  Widget build(BuildContext context) {
    const sz = 20.0;
    final colorScheme = context.colorScheme;
    EdgeInsetsGeometry? margin;
    if (widget.size != null && widget.shift != null) {
      final cellSize = Size(
        ThemeHelper.getWidth(context, 0.0 + widget.size!.width) / widget.size!.width,
        ThemeHelper.getHeight(context, 0.0 + widget.size!.height) / widget.size!.height,
      );
      margin = EdgeInsets.only(
        left: widget.shift!.width * cellSize.width - sz,
        top: widget.shift!.height * cellSize.height - sz,
      );
    }
    final border = BorderSide(width: 3, color: context.colorScheme.primary);
    return Container(
      height: sz,
      width: sz,
      margin: margin,
      child: Draggable<ComponentData>(
        data: widget.data,
        feedback: Container(
          decoration: BoxDecoration(
            border: Border(
              top: widget.topLeft ? border : BorderSide.none,
              left: widget.topLeft ? border : BorderSide.none,
              bottom: widget.topLeft ? BorderSide.none : border,
              right: widget.topLeft ? BorderSide.none : border,
            ),
          ),
          height: 20,
          width: 20,
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.move,
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
