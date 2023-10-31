// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/abstract_selector.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends AbstractSelector {
  final Function setState;
  @override
  // ignore: overridden_fields
  final DateTime? value;

  const DateInput({
    super.key,
    required this.setState,
    required this.value,
  }) : super(value: value);

  @override
  DateInputState createState() => DateInputState();
}

class DateInputState extends AbstractSelectorState<DateInput> {
  @override
  Future<void> onTap(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    const Duration dateRange = Duration(days: 20 * 365);
    DateTime firstDate = currentDate.subtract(dateRange);
    DateTime lastDate = currentDate.add(dateRange);
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.value ?? currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
      initialEntryMode: DatePickerEntryMode.input,
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
      focusController.onEditingComplete(this);
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    final style = context.textTheme.numberMedium;
    final DateFormat formatterDate = DateFormat.yMd(AppLocale.code);
    return Container(
      color: context.colorScheme.fieldBackground,
      child: ListTile(
        title: widget.value != null
            ? Text(
                formatterDate.format(widget.value!),
                style: style,
              )
            : Text(
                AppLocale.labels.dateTooltip,
                style: style.copyWith(color: style.color?.withOpacity(0.4)),
              ),
        focusNode: focus,
        autofocus: focusController.isFocused(this),
        onTap: () => onTap(context),
      ),
    );
  }
}
