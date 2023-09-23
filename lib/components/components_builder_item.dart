// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/components/component_recent.dart';
import 'package:app_finance/components/components_data.dart';
import 'package:app_finance/components/interface_component.dart';
import 'package:app_finance/components/list_component_registry.dart';
import 'package:flutter/material.dart';

class ComponentsBuilderItem extends StatelessWidget {
  final ComponentData data;

  const ComponentsBuilderItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final key = ListComponentRegistryItem.find(data[InterfaceComponent.key]);
    return switch (key) {
      ComponentRegistry.recent => ComponentRecent(data),
    };
  }
}
