// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/string_ext.dart';
import 'package:app_finance/components/component_chart.dart';
import 'package:app_finance/components/component_recent.dart';
import 'package:app_finance/components/_core/component_data.dart';
import 'package:app_finance/components/_core/list_component_registry.dart';
import 'package:flutter/material.dart';

class ComponentsBuilderItem extends StatelessWidget {
  final ComponentData data;

  const ComponentsBuilderItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final key = (data[componentData.key] as String).toEnum(ComponentRegistry.values);
    return Padding(
      padding: EdgeInsets.all(ThemeHelper.getIndent(0.5)),
      child: switch (key) {
        ComponentRegistry.recent => ComponentRecent(data),
        ComponentRegistry.chart => ComponentChart(data),
      },
    );
  }
}
