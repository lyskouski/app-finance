// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/widgets/form/abstract_selector.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends AbstractSelector {
  final Function setState;
  @override
  // ignore: overridden_fields
  final DateTime? value;

  DateInput({
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
      FocusController.onEditingComplete(widget.focusOrder);
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    final textTheme = context.textTheme;
    final style = textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color);
    final DateFormat formatterDate = DateFormat.yMd(AppLocale.code);
    return Container(
      color: context.colorScheme.inversePrimary.withOpacity(0.3),
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
        focusNode: widget.focus,
        autofocus: isFocused,
        onTap: () => onTap(context),
      ),
    );
  }
}
