// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/widgets/_forms/abstract_selector.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class MonthYearInput extends AbstractSelector {
  final Function setState;
  final TextStyle? style;
  @override
  // ignore: overridden_fields
  final DateTime? value;

  MonthYearInput({
    super.key,
    required this.setState,
    required this.value,
    this.style,
  });

  @override
  Future<void> onTap(context) async {
    DateTime currentDate = DateTime.now();
    const Duration dateRange = Duration(days: 20 * 365);
    DateTime firstDate = currentDate.subtract(dateRange);
    DateTime lastDate = currentDate.add(dateRange);
    final DateTime? selectedDate = await showMonthPicker(
      context: context,
      initialDate: value ?? currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (selectedDate != null) {
      setState(selectedDate);
      FocusController.onEditingComplete(focusOrder);
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
      child: ListTile(
        title: Text(
          value != null ? DateFormat.yM(AppLocale.code).format(value!) : AppLocale.labels.dateTooltip,
          style: style,
        ),
        onTap: () => onTap(context),
      ),
    );
  }
}
