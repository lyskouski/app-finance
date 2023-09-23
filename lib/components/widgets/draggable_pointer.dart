// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/components/components_data.dart';
import 'package:flutter/material.dart';

class DraggablePointer extends StatefulWidget {
  final Map<String, dynamic> data;
  final bool topLeft;

  const DraggablePointer(this.data, {super.key, this.topLeft = true});

  @override
  DraggablePointerState createState() => DraggablePointerState();
}

class DraggablePointerState extends State<DraggablePointer> {
  Color? color;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final border = BorderSide(width: 3, color: context.colorScheme.primary);
    return Container(
      margin: EdgeInsets.all(ThemeHelper.getIndent(0.5)),
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
