// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class IncomeTab extends StatelessWidget {
  Function callback;

  IncomeTab({
    super.key,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      callback(const SizedBox());
      return Container(
        child: Center(
          child: Text('Page Income'),
        ),
      );
    });
  }
}
