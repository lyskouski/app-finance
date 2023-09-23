// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_ext/string_ext.dart';
import 'package:app_finance/components/component_recent.dart';
import 'package:app_finance/components/components_data.dart';
import 'package:app_finance/components/interface_component.dart';
import 'package:app_finance/components/list_component_registry.dart';
import 'package:flutter/material.dart';

class ComponentsBuilderForm extends StatelessWidget {
  final ComponentData data;
  final Function adjust;

  const ComponentsBuilderForm(this.data, {super.key, required this.adjust});

  @override
  Widget build(BuildContext context) {
    final key = (data[InterfaceComponent.key] as String).toEnum<ComponentRegistry>();
    return switch (key) {
      ComponentRegistry.recent => ComponentRecentForm(data, adjust: adjust),
    };
  }
}
