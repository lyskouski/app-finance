// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/widgets/_forms/abstract_selector.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class MonthYearInput extends AbstractSelector {
  final Function setState;
  @override
  // ignore: overridden_fields
  final DateTime? value;

  const MonthYearInput({
    super.key,
    required this.setState,
    required this.value,
  }) : super();

  @override
  MonthYearInputState createState() => MonthYearInputState();
}

class MonthYearInputState extends AbstractSelectorState<MonthYearInput> {
  @override
  Future<void> onTap(context) async {
    DateTime currentDate = DateTime.now();
    const Duration dateRange = Duration(days: 20 * 365);
    DateTime firstDate = currentDate.subtract(dateRange);
    DateTime lastDate = currentDate.add(dateRange);
    final DateTime? selectedDate = await showMonthPicker(
      context: context,
      initialDate: widget.value ?? currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (selectedDate != null) {
      widget.setState(selectedDate);
      FocusController.onEditingComplete(focusOrder);
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
      child: ListTile(
        title: Text(
          widget.value != null ? DateFormat.yM(AppLocale.code).format(widget.value!) : AppLocale.labels.dateTooltip,
          style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
        ),
        onTap: () => onTap(context),
      ),
    );
  }
}
