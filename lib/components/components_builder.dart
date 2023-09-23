// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/string_ext.dart';
import 'package:app_finance/components/interface_component.dart';
import 'package:app_finance/components/widgets/draggable_frame.dart';
import 'package:app_finance/components/widgets/draggable_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_layout/flutter_grid_layout.dart';

typedef ComponentData = Map<String, dynamic>;

class ComponentsBuilder extends StatelessWidget {
  final List<ComponentData> data;
  final bool editMode;
  final Function? callback;
  final _shift = '_shift';
  final _order = '_order';
  final _start = '_start';
  final _end = '_end';

  const ComponentsBuilder(
    this.data, {
    super.key,
    this.editMode = false,
    this.callback,
  });

  static String getKey(BuildContext context) =>
      'cmp${ThemeHelper.getWidth(context).toInt()}x${ThemeHelper.getHeight(context).toInt()}';

  static List<ComponentData>? getData(BuildContext context) =>
      AppPreferences.get(getKey(context))?.toList<ComponentData>();

  static Widget buildComponent(BuildContext context, data, [editMode = false]) {
    if (editMode) {
      return switch (data[InterfaceComponent.key]) {
        _ => ThemeHelper.emptyBox,
      };
    }
    return switch (data[InterfaceComponent.key]) {
      _ => ThemeHelper.emptyBox,
    };
  }

  void resize(ComponentData change, Size start) {
    final scope = data[change[_order]];
    if (change[_shift] != null) {
      scope[InterfaceComponent.endX] += start.width - scope[InterfaceComponent.startX];
      scope[InterfaceComponent.endY] += start.height - scope[InterfaceComponent.startY];
      scope[InterfaceComponent.startX] = start.width;
      scope[InterfaceComponent.startY] = start.height;
    } else if (change[_start] != null) {
      scope[InterfaceComponent.startX] = start.width;
      scope[InterfaceComponent.startY] = start.height;
    } else if (change[_end] != null) {
      scope[InterfaceComponent.endX] = start.width + 1;
      scope[InterfaceComponent.endY] = start.height + 1;
    }
    callback!(change[_order], scope);
  }

  @override
  Widget build(BuildContext context) {
    final isVertical = ThemeHelper.getWidth(context) < ThemeHelper.getHeight(context);
    final rowsCount = (isVertical ? 6 : 12);
    final columnsCount = (isVertical ? 12 : 6);
    return GridContainer(
      rows: List.filled(rowsCount, null),
      columns: List.filled(columnsCount, null),
      children: editMode
          ? [
              ...List.generate(72, (i) {
                final start = Size(i % rowsCount.toDouble(), (i ~/ rowsCount).toDouble());
                return GridItem(
                  start: start,
                  end: Size(start.width + 1, start.height + 1),
                  child: DragTarget<ComponentData>(
                    onWillAccept: (_) => true,
                    onAccept: (change) => resize(change, start),
                    builder: (context, candidateData, rejectedData) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: context.colorScheme.secondary.withOpacity(0.1)),
                        color: candidateData.isEmpty ? null : Colors.green.shade200,
                      ),
                    ),
                  ),
                );
              }),
              ...List.generate(
                data.length,
                (i) => GridItem(
                  start: Size(0.0 + data[i][InterfaceComponent.startX], 0.0 + data[i][InterfaceComponent.startY]),
                  end: Size(0.0 + data[i][InterfaceComponent.endX], 0.0 + data[i][InterfaceComponent.endY]),
                  child: Stack(
                    children: [
                      DraggableFrame({...data[i], _order: i, _shift: true}),
                      DraggablePointer({...data[i], _order: i, _start: true}),
                      DraggablePointer(
                        {...data[i], _order: i, _end: true},
                        topLeft: false,
                        size: Size(rowsCount.toDouble(), columnsCount.toDouble()),
                        shift: Size(data[i][InterfaceComponent.endX], data[i][InterfaceComponent.endY]),
                      ),
                    ],
                  ),
                ),
              ),
            ]
          : List.generate(
              data.length,
              (i) => GridItem(
                    start: Size(0.0 + data[i][InterfaceComponent.startX], 0.0 + data[i][InterfaceComponent.startY]),
                    end: Size(0.0 + data[i][InterfaceComponent.endX], 0.0 + data[i][InterfaceComponent.endY]),
                    child: buildComponent(context, data[i], editMode),
                  )),
    );
  }
}
