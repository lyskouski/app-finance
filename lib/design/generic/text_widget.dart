// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:flutter/material.dart';

class TextWidget extends Text {
  const TextWidget(super.data, {super.key});

  @override
  String? get semanticsLabel => super.data;

  @override
  int get maxLines => 1;

  @override
  TextOverflow get overflow => TextOverflow.ellipsis;

  @override
  TextDirection get textDirection => AppDesign.getAlignment<TextDirection>();
}
