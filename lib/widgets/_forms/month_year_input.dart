// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class MonthYearInput extends StatefulWidget {
  final Function setState;
  final DateTime? value;
  final TextStyle? style;
  final int focusOrder;

  const MonthYearInput({
    super.key,
    required this.setState,
    required this.value,
    this.style,
    this.focusOrder = FocusController.DEFAULT,
  });

  @override
  MonthYearInputState createState() => MonthYearInputState();
}

class MonthYearInputState extends State<MonthYearInput> {
  bool isOpened = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> onTap(context) async {
    DateTime currentDate = DateTime.now();
    const Duration dateRange = Duration(days: 20 * 365);
    DateTime firstDate = currentDate.subtract(dateRange);
    DateTime lastDate = currentDate.add(dateRange);
    setState(() => isOpened = true);
    final DateTime? selectedDate = await showMonthPicker(
      context: context,
      initialDate: widget.value ?? currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (selectedDate != null) {
      widget.setState(selectedDate);
      setState(() => isOpened = false);
      FocusController.resetFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final DateFormat formatterDate = DateFormat.yM(locale);
    if (!isOpened &&
        widget.value == null &&
        widget.focusOrder > FocusController.DEFAULT &&
        FocusController.isFocused()) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!isOpened && widget.value == null) {
          onTap(context);
        }
      });
    }
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
      child: ListTile(
        title: Text(
          widget.value != null ? formatterDate.format(widget.value!) : 'Select date',
          style: widget.style,
        ),
        onTap: () => onTap(context),
      ),
    );
  }
}
