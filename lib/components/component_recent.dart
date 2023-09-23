// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/components/components_data.dart';
import 'package:flutter/material.dart';

class ComponentRecent extends StatelessWidget {
  final ComponentData data;

  const ComponentRecent(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class ComponentRecentForm extends StatefulWidget {
  final ComponentData data;

  const ComponentRecentForm(this.data, {super.key});

  @override
  ComponentRecentFormState createState() => ComponentRecentFormState();
}

class ComponentRecentFormState extends State<ComponentRecentForm> {
  @override
  Widget build(BuildContext context) {
    return ThemeHelper.emptyBox;
  }
}
