// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:flutter/material.dart';

class NotificationBar {
  static void showSnackBar(BuildContext context, String message) {
    final helper = ThemeHelper(windowType: getWindowType(context));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check, color: Colors.green),
            SizedBox(width: helper.getIndent()),
            Text(message),
          ],
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
