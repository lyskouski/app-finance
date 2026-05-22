// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/abstract_selector.dart';
import 'package:app_finance/design/form/date_input.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
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
  Future<TimeOfDay?> _showCompactTimePicker(BuildContext context) {
    final initial = TimeOfDay.fromDateTime(widget.value);
    final indent = ThemeHelper.getIndent(2);
    return showModalBottomSheet<TimeOfDay>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (sheetContext) {
        int hour = initial.hour;
        int minute = initial.minute;
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                indent,
                indent,
                indent,
                MediaQuery.of(context).viewInsets.bottom + indent,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppLocale.labels.balanceDate,
                      style: sheetContext.textTheme.titleMedium,
                    ),
                    SizedBox(height: indent),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<int>(
                            initialValue: hour,
                            decoration: InputDecoration(
                              labelText: AppLocale.labels.hour,
                              border: const OutlineInputBorder(),
                            ),
                            items: List<DropdownMenuItem<int>>.generate(
                              24,
                              (index) => DropdownMenuItem<int>(
                                value: index,
                                child: Text(index.toString().padLeft(2, '0')),
                              ),
                            ),
                            onChanged: (value) {
                              if (value != null) {
                                setModalState(() => hour = value);
                              }
                            },
                          ),
                        ),
                        SizedBox(width: indent),
                        Expanded(
                          child: DropdownButtonFormField<int>(
                            initialValue: minute,
                            decoration: InputDecoration(
                              labelText: AppLocale.labels.minute,
                              border: const OutlineInputBorder(),
                            ),
                            items: List<DropdownMenuItem<int>>.generate(
                              60,
                              (index) => DropdownMenuItem<int>(
                                value: index,
                                child: Text(index.toString().padLeft(2, '0')),
                              ),
                            ),
                            onChanged: (value) {
                              if (value != null) {
                                setModalState(() => minute = value);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: indent),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(sheetContext).pop(),
                          child: Text(AppLocale.labels.btnCancel),
                        ),
                        SizedBox(width: indent),
                        FilledButton(
                          style: FilledButton.styleFrom(foregroundColor: sheetContext.colorScheme.surface),
                          onPressed: () => Navigator.of(sheetContext).pop(TimeOfDay(hour: hour, minute: minute)),
                          child: Text(AppLocale.labels.btnConfirm),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> onTap(BuildContext context) async {
    final time = await _showCompactTimePicker(context);
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
          Material(
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
