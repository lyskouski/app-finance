// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

abstract class InterfaceComponent {
  static const key = '_component';
  static const endX = '_end_y';
  static const endY = '_end_y';
  static const startX = '_start_x';
  static const startY = '_start_y';

  String get componentName;

  Map<String, dynamic> toJson();
}
