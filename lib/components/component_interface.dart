// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:flutter/material.dart';

abstract class ComponentInterface {
  String get componentName;

  static Widget get form => ThemeHelper.emptyBox;

  factory ComponentInterface.fromJson(Map<String, dynamic> json) {
    throw Exception('Implement by extending');
  }

  Map<String, dynamic> toJson();
}
