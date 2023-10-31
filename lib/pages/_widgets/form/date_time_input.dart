// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/pages/_widgets/form/abstract_selector.dart';
import 'package:app_finance/pages/_widgets/form/date_input.dart';
import 'package:app_finance/pages/_widgets/wrapper/row_widget.dart';
import 'package:flutter/material.dart';
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
  Future<void> onTap(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(widget.value),
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (time != null) {
      widget.setState(DateTime(widget.value.year, widget.value.month, widget.value.day, time.hour, time.minute));
      focusController.onEditingComplete(this);
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    double indent = ThemeHelper.getIndent(2);
    double width = widget.width ?? ThemeHelper.getWidth(context, 4);
    final DateFormat formatterTime = DateFormat.Hms(AppLocale.code);
    final textTheme = context.textTheme;

    return RowWidget(
      indent: indent,
      maxWidth: width + indent,
      chunk: const [0.6, 0.4],
      children: [
        [
          DateInput(
            value: widget.value,
            setState: widget.setState,
          ),
        ],
        [
          Container(
            color: context.colorScheme.fieldBackground,
            child: ListTile(
              focusNode: focus,
              autofocus: focusController.isFocused(this),
              title: Text(
                formatterTime.format(widget.value),
                overflow: TextOverflow.ellipsis,
                style: textTheme.numberMedium,
              ),
              onTap: () => onTap(context),
            ),
          ),
        ],
      ],
    );
  }
}
