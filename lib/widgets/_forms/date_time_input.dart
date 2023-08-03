// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/_forms/date_input.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class DateTimeInput extends StatelessWidget {
  final Function setState;
  final DateTime value;
  final TextStyle? style;
  final double? width;

  const DateTimeInput({
    super.key,
    required this.setState,
    required this.value,
    this.style,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    double offset = width ?? MediaQuery.of(context).size.width - indent * 2;
    final locale = Localizations.localeOf(context).toString();
    final DateFormat formatterTime = DateFormat.Hms(locale);

    return RowWidget(
      indent: indent,
      maxWidth: offset,
      chunk: const [0.6, 0.4],
      children: [
        [
          DateInput(
            value: value,
            setState: setState,
            style: style,
          ),
        ],
        [
          Container(
            color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
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
      ],
    );
  }
}
