// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends StatefulWidget {
  final Function setState;
  final DateTime? value;
  final TextStyle? style;
  final int focusOrder;

  const DateInput({
    super.key,
    required this.setState,
    required this.value,
    this.style,
    this.focusOrder = FocusController.DEFAULT,
  });

  @override
  DateInputState createState() => DateInputState();
}

class DateInputState extends State<DateInput> {
  bool isOpened = false;

  Future<void> onTap(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    const Duration dateRange = Duration(days: 20 * 365);
    DateTime firstDate = currentDate.subtract(dateRange);
    DateTime lastDate = currentDate.add(dateRange);
    setState(() => isOpened = true);
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.value ?? currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (selectedDate != null) {
      if (widget.value != null) {
        selectedDate = selectedDate.add(Duration(
          hours: widget.value!.hour,
          minutes: widget.value!.minute,
          seconds: widget.value!.second,
        ));
      }
      widget.setState(selectedDate);
      setState(() => isOpened = false);
      FocusController.resetFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    FocusController.setContext(widget.focusOrder, widget.value);
    if (!isOpened &&
        widget.focusOrder > FocusController.DEFAULT &&
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
          widget.value != null
              ? formatterDate.format(widget.value!)
              : 'Select date',
          style: widget.style,
        ),
        autofocus: FocusController.isFocused(),
        onTap: () => onTap(context),
      ),
    );
  }
}
