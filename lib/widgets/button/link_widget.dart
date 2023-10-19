// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class LinkWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const LinkWidget(this.text, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      attributedHint: AttributedString(AppLocale.labels.typeButton),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: TextWrapper(
            text,
            style: TextStyle(
              color: context.colorScheme.primary,
              decoration: TextDecoration.underline,
              decorationColor: context.colorScheme.primary.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}
