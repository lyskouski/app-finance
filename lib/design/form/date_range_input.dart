// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/date_input.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangeInput extends DateInput {
  final DateTime? valueFrom;

  const DateRangeInput({super.key, required super.setState, required super.value, required this.valueFrom});

  @override
  DateRangeInputState createState() => DateRangeInputState();
}

class DateRangeInputState extends DateInputState<DateRangeInput> {
  @override
  Future<void> onTap(BuildContext context) async {
    showCustomDateRangePicker(
      context,
      dismissible: true,
      minimumDate: DateTime.now().subtract(const Duration(days: 365 * 5)), // 5 years back
      maximumDate: DateTime.now().add(const Duration(days: 30)),
      endDate: widget.value,
      startDate: widget.valueFrom,
      backgroundColor: context.colorScheme.surface,
      primaryColor: context.colorScheme.primary,
      onApplyClick: (start, end) {
        widget.setState(start, end);
        focusController.onEditingComplete(this);
      },
      onCancelClick: () => widget.setState(null, null),
    );
  }

  @override
  String formatDate(DateTime? date) {
    final DateFormat formatter = DateFormat.yMd(AppLocale.code);
    if (date == null && widget.valueFrom == null) {
      return '';
    }
    if (date == null && widget.valueFrom != null) {
      return '${formatter.format(widget.valueFrom!)} ...';
    }
    if (date != null && widget.valueFrom == null) {
      return '... ${formatter.format(date)}';
    }
    return '${formatter.format(widget.valueFrom!)} ... ${formatter.format(date!)}';
  }
}
