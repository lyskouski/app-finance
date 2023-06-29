// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/widgets/home/base_widget.dart';
import 'package:flutter/material.dart';

class BillWidget extends BaseWidget {
  BillWidget({
    super.key,
    required String title,
    required double offset,
    required EdgeInsetsGeometry margin,
    required dynamic state,
  }) : super(
          margin: margin,
          offset: offset,
          title: title,
          state: state,
        );
}
