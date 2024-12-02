// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/generic/text_widget.dart';
import 'package:flutter/material.dart';

enum BudgetValueType { unlimited, relative, fixed }

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
  BudgetValueType value = BudgetValueType.unlimited;

  @override
  void initState() {
    widget.controller.addListener(listener);
    WidgetsBinding.instance.addPostFrameCallback((_) => listener());
    super.initState();
  }

  listener() {
    double amount = double.tryParse(widget.controller.text) ?? 0.0;
    BudgetValueType newValue = BudgetValueType.unlimited;
    if (amount > 0 && amount < 1) {
      newValue = BudgetValueType.relative;
    } else if (amount >= 1) {
      newValue = BudgetValueType.fixed;
    }
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
          style: value == BudgetValueType.unlimited ? style : null,
        ),
        const TextWidget(' (0) '),
        ThemeHelper.wIndent,
        TextWidget(
          AppLocale.labels.budgetTypeRelative,
          style: value == BudgetValueType.relative ? style : null,
        ),
        const TextWidget(' (0 ... 1) '),
        ThemeHelper.wIndent,
        TextWidget(
          AppLocale.labels.budgetTypeFixed,
          style: value == BudgetValueType.fixed ? style : null,
        ),
        const TextWidget(' (>= 1) '),
      ],
    );
  }
}
