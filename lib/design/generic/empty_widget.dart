// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.onSurface.withOpacity(0.1),
      child: Center(
        child: Text(
          AppLocale.labels.noChartData,
          style: context.textTheme.headlineSmall,
        ),
      ),
    );
  }
}
