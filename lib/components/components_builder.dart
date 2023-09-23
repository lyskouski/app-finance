// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/string_ext.dart';
import 'package:app_finance/components/interface_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_layout/flutter_grid_layout.dart';

typedef ComponentData = Map<String, dynamic>;

class ComponentsBuilder extends StatelessWidget {
  final List<ComponentData> data;

  const ComponentsBuilder(this.data, {super.key});

  static String getKey(BuildContext context) =>
      'cmp${ThemeHelper.getWidth(context).toInt()}x${ThemeHelper.getHeight(context).toInt()}';

  static List<ComponentData>? getData(BuildContext context) =>
      AppPreferences.get(getKey(context))?.toList<ComponentData>();

  Widget _build(BuildContext context, name, data) {
    return switch (name) {
      _ => ThemeHelper.emptyBox,
    };
  }

  @override
  Widget build(BuildContext context) {
    final isVertical = ThemeHelper.getWidth(context) < ThemeHelper.getHeight(context);
    return GridContainer(
      rows: List.filled(isVertical ? 6 : 12, null),
      columns: List.filled(isVertical ? 12 : 6, null),
      children: List.generate(
          data.length,
          (i) => GridItem(
                start: Size(data[i][InterfaceComponent.startX], data[i][InterfaceComponent.startY]),
                end: Size(data[i][InterfaceComponent.endX], data[i][InterfaceComponent.endY]),
                child: _build(context, data[i][InterfaceComponent.key], data[i]),
              )),
    );
  }
}
