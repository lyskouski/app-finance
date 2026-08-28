// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:material_ui/material_ui.dart';

class AppMenuItem {
  String name;
  IconData icon;
  String route;

  AppMenuItem({
    required this.name,
    required this.icon,
    required this.route,
  });
}
