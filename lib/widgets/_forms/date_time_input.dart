// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_forms/abstract_selector.dart';
import 'package:app_finance/widgets/_forms/date_input.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class DateTimeInput extends AbstractSelector {
  final Function setState;
  @override
  // ignore: overridden_fields
  final DateTime value;
  final double? width;

  const DateTimeInput({
    super.key,
    required this.setState,
    required this.value,
    this.width,
  }) : super(value: value);

  @override
  DateTimeInputState createState() => DateTimeInputState();
}

class DateTimeInputState extends AbstractSelectorState<DateTimeInput> {
  @override
  void onTap(BuildContext context) {
    DatePicker.showTimePicker(context, showTitleActions: true, currentTime: widget.value, onConfirm: (dateTime) {
      widget.setState(dateTime);
      FocusController.onEditingComplete(focusOrder);
    });
  }

  @override
  Widget buildContent(BuildContext context) {
    double indent = ThemeHelper.getIndent(2);
    double width = widget.width ?? ThemeHelper.getWidth(context, 4);
    final DateFormat formatterTime = DateFormat.Hms(AppLocale.code);

    return RowWidget(
      indent: indent,
      maxWidth: width + indent,
      chunk: const [0.6, 0.4],
      children: [
        [
          DateInput(
            value: widget.value,
            setState: setState,
          ),
        ],
        [
          Container(
            color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
            child: ListTile(
              focusNode: focus,
              autofocus: isFocused,
              title: Text(
                formatterTime.format(widget.value),
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => onTap(context),
            ),
          ),
        ],
      ],
    );
  }
}
