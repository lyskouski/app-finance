// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/abstract_selector.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class MonthYearInput extends AbstractSelector {
  final Function setState;
  @override
  // ignore: overridden_fields
  final DateTime? value;
  final bool withLabel;
  final String? labelText;

  const MonthYearInput({
    super.key,
    required this.setState,
    required this.value,
    this.withLabel = false,
    this.labelText,
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
    final indent = ThemeHelper.getIndent();
    Widget title = widget.value != null
        ? TextWrapper(
            DateFormat.yM(AppLocale.code).format(widget.value!),
            style: context.textTheme.numberMedium,
          )
        : TextWrapper(
            AppLocale.labels.dateTooltip,
            style: context.textTheme.tooltipMedium,
          );
    return Container(
      color: context.colorScheme.fieldBackground,
      child: ListTile(
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.fromLTRB(
          indent,
          widget.value != null && widget.withLabel ? 0 : 1,
          0,
          widget.value != null && widget.withLabel ? 2 : 1,
        ),
        title: widget.value != null
            ? widget.withLabel
                ? Column(
                    mainAxisAlignment: AppDesign.getAlignment<MainAxisAlignment>(),
                    crossAxisAlignment: AppDesign.getAlignment(),
                    children: [
                      TextWrapper(widget.labelText ?? '...', style: context.textTheme.tooltipSmall),
                      title,
                    ],
                  )
                : title
            : title,
        onTap: () => onTap(context),
      ),
    );
  }
}
