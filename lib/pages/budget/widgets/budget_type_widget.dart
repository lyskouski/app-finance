// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/generic/text_widget.dart';
import 'package:flutter/material.dart';

class BudgetTypeWidget extends StatefulWidget {
  final TextEditingController controller;

  const BudgetTypeWidget({
    super.key,
    required this.controller,
  });

  @override
  BudgetTypeWidgetState createState() => BudgetTypeWidgetState();
}

class BudgetTypeWidgetState extends State<BudgetTypeWidget> {
  double value = 0.0;

  @override
  void initState() {
    widget.controller.addListener(listener);
    super.initState();
  }

  listener() {
    double newValue = double.tryParse(widget.controller.text) ?? 0.0;
    if (newValue != value) {
      setState(() => value = newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(decoration: TextDecoration.overline, fontWeight: FontWeight.bold);
    return Row(
      textDirection: AppDesign.getAlignment<TextDirection>(),
      children: [
        TextWidget(
          AppLocale.labels.budgetTypeAsIs,
          style: value == 0 ? style : null,
        ),
        const TextWidget(' (0) '),
        ThemeHelper.wIndent,
        TextWidget(
          AppLocale.labels.budgetTypeRelative,
          style: value > 0 && value < 1 ? style : null,
        ),
        const TextWidget(' (0 ... 1) '),
        ThemeHelper.wIndent,
        TextWidget(
          AppLocale.labels.budgetTypeFixed,
          style: value >= 1 ? style : null,
        ),
        const TextWidget(' (>= 1) '),
      ],
    );
  }
}
