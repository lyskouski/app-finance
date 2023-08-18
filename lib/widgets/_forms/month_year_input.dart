// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/widgets/_forms/abstract_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class MonthYearInput extends AbstractInput {
  final Function setState;
  final TextStyle? style;
  @override
  // ignore: overridden_fields
  final DateTime? value;

  MonthYearInput({
    super.key,
    required this.setState,
    required this.value,
    this.style,
  });

  Future<void> onTap(context) async {
    DateTime currentDate = DateTime.now();
    const Duration dateRange = Duration(days: 20 * 365);
    DateTime firstDate = currentDate.subtract(dateRange);
    DateTime lastDate = currentDate.add(dateRange);
    final DateTime? selectedDate = await showMonthPicker(
      context: context,
      initialDate: value ?? currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (selectedDate != null) {
      setState(selectedDate);
      FocusController.onEditingComplete(focusOrder);
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final DateFormat formatterDate = DateFormat.yM(locale);
    if (FocusController.isFocused(focusOrder, value)) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (value == null) {
          onTap(context);
        }
      });
    }
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
      child: ListTile(
        title: Text(
          value != null ? formatterDate.format(value!) : 'Select date',
          style: style,
        ),
        onTap: () => onTap(context),
      ),
    );
  }
}
