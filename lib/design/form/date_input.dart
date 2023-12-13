// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/abstract_selector.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends AbstractSelector {
  final Function setState;
  @override
  // ignore: overridden_fields
  final DateTime? value;
  final bool withLabel;

  const DateInput({
    super.key,
    required this.setState,
    required this.value,
    this.withLabel = false,
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
          hours: widget.value?.hour ?? 0,
          minutes: widget.value?.minute ?? 0,
          seconds: widget.value?.second ?? 0,
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
    final labelStyle = context.textTheme.tooltipSmall.copyWith(color: style.color?.withOpacity(0.4));
    final hintStyle = context.textTheme.tooltipMedium.copyWith(overflow: TextOverflow.ellipsis);
    return Container(
      color: context.colorScheme.fieldBackground,
      child: ListTile(
        title: widget.value != null
            ? widget.withLabel
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWrapper(AppLocale.labels.dateTooltip, style: labelStyle),
                      TextWrapper(formatterDate.format(widget.value!), style: style),
                    ],
                  )
                : TextWrapper(formatterDate.format(widget.value!), style: style)
            : TextWrapper(AppLocale.labels.dateTooltip, style: hintStyle),
        focusNode: focus,
        autofocus: focusController.isFocused(this),
        onTap: () => onTap(context),
      ),
    );
  }
}
