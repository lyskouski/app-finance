// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/widgets/_forms/abstract_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends AbstractInput {
  final Function setState;
  final TextStyle? style;
  @override
  // ignore: overridden_fields
  final DateTime? value;

  DateInput({
    super.key,
    required this.setState,
    required this.value,
    this.style,
  }) : super(value: value);

  Future<void> onTap(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    const Duration dateRange = Duration(days: 20 * 365);
    DateTime firstDate = currentDate.subtract(dateRange);
    DateTime lastDate = currentDate.add(dateRange);
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: value ?? currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (selectedDate != null) {
      if (value != null) {
        selectedDate = selectedDate.add(Duration(
          hours: value!.hour,
          minutes: value!.minute,
          seconds: value!.second,
        ));
      }
      setState(selectedDate);
      FocusController.onEditingComplete(focusOrder);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFocused = FocusController.isFocused(focusOrder, value);
    if (!focus.hasFocus && isFocused) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!focus.hasFocus && value == null) {
          onTap(context);
        }
      });
    }
    final locale = Localizations.localeOf(context).toString();
    final DateFormat formatterDate = DateFormat.yMd(locale);
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
      child: ListTile(
        title: Text(
          value != null ? formatterDate.format(value!) : 'Select date',
          style: style,
        ),
        focusNode: focus,
        autofocus: isFocused,
        onTap: () => onTap(context),
      ),
    );
  }
}
