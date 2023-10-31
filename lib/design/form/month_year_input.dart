// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/abstract_selector.dart';
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
  });

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
      focusController.onEditingComplete(this);
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    final style = context.textTheme.numberMedium;
    return Container(
      color: context.colorScheme.fieldBackground,
      child: ListTile(
        title: widget.value != null
            ? Text(
                DateFormat.yM(AppLocale.code).format(widget.value!),
                style: style,
              )
            : Text(
                AppLocale.labels.dateTooltip,
                style: style.copyWith(color: style.color?.withOpacity(0.4)),
              ),
        onTap: () => onTap(context),
      ),
    );
  }
}
