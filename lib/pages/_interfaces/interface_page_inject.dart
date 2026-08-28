// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

typedef FnBuildButton = Widget Function(BuildContext context, BoxConstraints constraints);

typedef FnPageCallback = Function(PageInject data);

typedef PageInject = ({
  FnBuildButton buildButton,
  String buttonName,
  String title,
});
