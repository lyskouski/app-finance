// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/string_ext.dart';
import 'package:app_finance/components/_core/components_builder_item.dart';
import 'package:app_finance/components/_core/component_data.dart';
import 'package:app_finance/components/_core/widgets/draggable_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_layout/flutter_grid_layout.dart';

class ComponentsBuilder extends StatelessWidget {
  final List<ComponentData> data;
  final bool editMode;
  final Function? adjust;
  final Function? delete;
  final _shift = componentData.shift;
  final _order = componentData.order;
  final _start = componentData.start;
  final _end = componentData.end;

  ComponentsBuilder(
    this.data, {
    super.key,
    this.editMode = false,
    this.adjust,
    this.delete,
  });

  static String getKey(BuildContext context) =>
      'cmp${ThemeHelper.getWidth(context).toInt()}x${ThemeHelper.getHeight(context).toInt()}';

  static List<ComponentData>? getData(BuildContext context) =>
      AppPreferences.get(getKey(context))?.toList<ComponentData>();

  void resize(ComponentData change, Size start) {
    final scope = data[change[_order]];
    scope[_order] = change[_order];
    if (change[_shift] != null) {
      scope[componentData.endX] += start.width - scope[componentData.startX];
      scope[componentData.endY] += start.height - scope[componentData.startY];
      scope[componentData.startX] = start.width;
      scope[componentData.startY] = start.height;
    } else if (change[_start] != null) {
      scope[componentData.startX] = start.width;
      scope[componentData.startY] = start.height;
    } else if (change[_end] != null) {
      scope[componentData.endX] = start.width + 1.0;
      scope[componentData.endY] = start.height + 1.0;
    }
    adjust!(scope[_order], scope);
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
                  order: 0,
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
                  start: Size(data[i][componentData.startX] + .0, data[i][componentData.startY] + .0),
                  end: Size(data[i][componentData.endX] + .0, data[i][componentData.endY] + .0),
                  order: i + 1,
                  child: DraggableFrame({...data[i], _order: i}, delete: delete!, adjust: adjust!),
                ),
              ),
            ]
          : List.generate(
              data.length,
              (i) => GridItem(
                    start: Size(data[i][componentData.startX] + .0, data[i][componentData.startY] + .0),
                    end: Size(data[i][componentData.endX] + .0, data[i][componentData.endY] + .0),
                    child: ComponentsBuilderItem({...data[i], _order: i}),
                  )),
    );
  }
}
