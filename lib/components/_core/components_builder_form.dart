// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_ext/string_ext.dart';
import 'package:app_finance/components/component_chart.dart';
import 'package:app_finance/components/component_recent.dart';
import 'package:app_finance/components/_core/component_data.dart';
import 'package:app_finance/components/_core/list_component_registry.dart';
import 'package:flutter/material.dart';

class ComponentsBuilderForm extends StatelessWidget {
  final ComponentData data;
  final Function adjust;

  const ComponentsBuilderForm(this.data, {super.key, required this.adjust});

  @override
  Widget build(BuildContext context) {
    final key = (data[componentData.key] as String).toEnum(ComponentRegistry.values);
    return switch (key) {
      ComponentRegistry.recent => ComponentRecentForm(data, adjust: adjust),
      ComponentRegistry.chart => ComponentChartForm(data, adjust: adjust),
    };
  }
}
