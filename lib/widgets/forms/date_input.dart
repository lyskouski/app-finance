// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends StatelessWidget {
  final Function setState;
  final DateTime? value;
  final TextStyle? style;
  final int focusOrder;
  bool isOpened = false;

  DateInput({
    super.key,
    required this.setState,
    required this.value,
    this.style,
    this.focusOrder = FocusController.DEFAULT,
  });

  Future<void> onTap(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    const Duration dateRange = Duration(days: 20 * 365);
    DateTime firstDate = currentDate.subtract(dateRange);
    DateTime lastDate = currentDate.add(dateRange);
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: value ?? currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (selectedDate != null) {
      isOpened = false;
      DateTime date = selectedDate.add(Duration(
        hours: value?.hour ?? 0,
        minutes: value?.minute ?? 0,
        seconds: value?.second ?? 0,
      ));
      setState(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    FocusController.setContext(focusOrder, value);
    if (!isOpened &&
        focusOrder > FocusController.DEFAULT &&
        FocusController.isFocused()) {
      Future.delayed(const Duration(milliseconds: 300), () {
        onTap(context);
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
        autofocus: FocusController.isFocused(),
        onTap: () => onTap(context),
      ),
    );
  }
}
