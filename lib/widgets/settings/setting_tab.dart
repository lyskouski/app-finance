// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/start/setting_tab.dart' as start;
import 'package:flutter/material.dart';

class SettingTab extends StatefulWidget {
  final bool isFirstBoot = false;

  const SettingTab({super.key});

  void setState() => {};

  @override
  SettingTabState createState() => SettingTabState();
}

class SettingTabState extends start.SettingTabState {
  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) => ThemeHelper.emptyBox;
}
