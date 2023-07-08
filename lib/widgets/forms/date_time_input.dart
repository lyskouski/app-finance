// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/forms/date_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class DateTimeInput extends StatelessWidget {
  Function setState;
  DateTime value;
  TextStyle? style;
  double? width;

  DateTimeInput({
    super.key,
    required this.setState,
    required this.value,
    this.style,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    double indent =
        ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    double offset = width ?? MediaQuery.of(context).size.width - indent * 2;
    final locale = Localizations.localeOf(context).toString();
    final DateFormat formatterDate = DateFormat.yMd(locale);
    final DateFormat formatterTime = DateFormat.Hms(locale);
    DateTime currentDate = DateTime.now();
    const Duration dateRange = Duration(days: 20 * 365);
    DateTime firstDate = currentDate.subtract(dateRange);
    DateTime lastDate = currentDate.add(dateRange);

    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: offset * 0.6,
              ),
              child: DateInput(
                value: value,
                setState: setState,
                style: style,
              ),
            ),
          ),
          SizedBox(width: indent),
          Container(
            constraints: BoxConstraints(
              maxWidth: offset * 0.4,
            ),
            color:
                Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
            child: ListTile(
              title: Text(
                formatterTime.format(value),
                overflow: TextOverflow.ellipsis,
                style: style,
              ),
              onTap: () {
                DatePicker.showTimePicker(
                  context,
                  showTitleActions: true,
                  currentTime: value,
                  onConfirm: (dateTime) => setState(dateTime),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
