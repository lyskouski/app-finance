// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/components/components_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_layout/flutter_grid_layout.dart';

class DraggableFrame extends StatefulWidget {
  final Map<String, dynamic> data;

  const DraggableFrame(this.data, {super.key});

  @override
  DraggableFrameState createState() => DraggableFrameState();
}

class DraggableFrameState extends State<DraggableFrame> {
  Color? color;
  bool isDrag = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final frameLine = MouseRegion(
      cursor: SystemMouseCursors.move,
      onEnter: (_) => setState(() => color = colorScheme.primary.withOpacity(0.5)),
      onExit: (_) => setState(() => color = null),
      child: Container(
        color: color ?? colorScheme.secondary.withOpacity(0.2),
      ),
    );
    return Draggable<ComponentData>(
      data: widget.data,
      onDragStarted: () => setState(() => isDrag = true),
      onDragEnd: (_) => setState(() => isDrag = false),
      feedback: Container(color: context.colorScheme.primary, height: 40, width: 60),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: GridContainer(
          columns: const [7, null, 7],
          rows: const [7, null, 7],
          children: [
            GridItem(
              start: const Size(0, 0),
              end: const Size(3, 1),
              child: frameLine,
            ),
            GridItem(
              start: const Size(0, 1),
              end: const Size(1, 3),
              child: frameLine,
            ),
            GridItem(
              start: const Size(2, 1),
              end: const Size(3, 3),
              child: frameLine,
            ),
            GridItem(
              start: const Size(1, 2),
              end: const Size(2, 3),
              child: frameLine,
            ),
            GridItem(
                start: const Size(0, 0),
                end: const Size(3, 3),
                child: Visibility(
                  visible: !isDrag,
                  child: ComponentsBuilder.buildComponent(context, widget.data, true),
                )),
          ],
        ),
      ),
    );
  }
}
