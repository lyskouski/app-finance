// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes.dart' as routes;
import 'package:app_finance/routes/abstract_page.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';

class AccountAddPage extends AbstractPage {
  String? type;
  String? currency;
  DateTime? validTillDate;
  DateTime balanceUpdateDate = DateTime.now();
  double? balance;
  IconData? icon;
  Color? color;

  AccountAddPage({super.key, 
    required AppData state,
  }) : super(state: state);

  @override
  AccountAddPageState createState() => AccountAddPageState();
}

class AccountAddPageState extends AbstractPageState<AccountAddPage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.createAccountHeader;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    String title = AppLocalizations.of(context)!.createAccountTooltip;
    return SizedBox(
      width: constraints.maxWidth - helper.getIndent() * 4,
      child: FloatingActionButton(
        onPressed: () => {
          // Do stuff
          Navigator.popAndPushNamed(context, routes.accountRoute)
        },
        tooltip: title,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.save),
              SizedBox(height: helper.getIndent()),
              Text(title, style: Theme.of(context).textTheme.headlineMedium)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildContent(
      BuildContext context, BoxConstraints constraints, AppData state) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent =
        ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    DateTime currentDate = DateTime.now();
    const Duration dateRange = Duration(days: 20 * 365);
    DateTime firstDate = currentDate.subtract(dateRange);
    DateTime lastDate = currentDate.add(dateRange);
    final locale = Localizations.localeOf(context).toString();
    final DateFormat formatterDate = DateFormat.yMd(locale);
    final DateFormat formatterTime = DateFormat.Hms(locale);
    double offset = MediaQuery.of(context).size.width - indent * 3;
    double offsetTriple = offset - indent;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Type',
              style: textTheme.bodyLarge,
            ),
            Container(
              color:
                  Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
              width: double.infinity,
              child: DropdownButton<String>(
                isExpanded: true,
                value: widget.type,
                onChanged: (value) {
                  setState(() {
                    widget.type = value;
                  });
                },
                items: [
                  'Account Template 1',
                  'Account Template 2',
                  'Account Template 3'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: EdgeInsets.only(left: indent),
                      child: Text(value, style: textTheme.numberMedium),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: indent),
            Text(
              'Title',
              style: textTheme.bodyLarge,
            ),
            TextFormField(
              initialValue:
                  widget.balance != null ? widget.balance.toString() : '',
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: Theme.of(context)
                    .colorScheme
                    .inversePrimary
                    .withOpacity(0.3),
                hintText: 'Enter Account Identifier',
                hintStyle: textTheme.numberMedium,
              ),
              onChanged: (value) {
                setState(() {
                  widget.balance = double.parse(value);
                });
              },
            ),
            SizedBox(height: indent),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: offsetTriple * 0.2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Icon',
                        style: textTheme.bodyLarge,
                      ),
                      Container(
                        color: Theme.of(context)
                            .colorScheme
                            .inversePrimary
                            .withOpacity(0.3),
                        width: double.infinity,
                        child: DropdownButton<IconData>(
                          isExpanded: true,
                          value: widget.icon,
                          onChanged: (newIcon) {
                            setState(() {
                              widget.icon = newIcon;
                            });
                          },
                          items: [
                            Icons.home,
                            Icons.star,
                            Icons.favorite,
                            Icons.settings,
                            Icons.mail,
                          ].map((icon) {
                            return DropdownMenuItem<IconData>(
                                value: icon,
                                child: Center(
                                  child: Tooltip(
                                    message: icon.toString(),
                                    child: Icon(icon),
                                  ),
                                ));
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: indent),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: offsetTriple * 0.2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style: textTheme.bodyLarge,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          border: InputBorder.none,
                          fillColor: widget.color ??
                              Theme.of(context)
                                  .colorScheme
                                  .inversePrimary
                                  .withOpacity(0.3),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Select a color'),
                                    content: SingleChildScrollView(
                                      child: ColorPicker(
                                        pickerColor:
                                            widget.color ?? Colors.red,
                                        onColorChanged: (color) {
                                          setState(() {
                                            widget.color = color;
                                          });
                                        },
                                      ),
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Icon(Icons.color_lens),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: indent),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: offsetTriple * 0.6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Details',
                        style: textTheme.bodyLarge,
                      ),
                      TextFormField(
                        initialValue: widget.balance != null
                            ? widget.balance.toString()
                            : '',
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          border: InputBorder.none,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .inversePrimary
                              .withOpacity(0.3),
                          hintText: '****2345 - last 4 digits of number',
                          hintStyle: textTheme.numberMedium,
                        ),
                        onChanged: (value) {
                          setState(() {
                            widget.balance = double.parse(value);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: indent),
            Text(
              'Currency',
              style: textTheme.bodyLarge,
            ),
            Container(
              color:
                  Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
              width: double.infinity,
              child: DropdownButton<String>(
                isExpanded: true,
                value: widget.currency,
                onChanged: (value) {
                  setState(() {
                    widget.currency = value;
                  });
                },
                items: ['Currency 1', 'Currency 2', 'Currency 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: EdgeInsets.only(left: indent),
                      child: Text(value, style: textTheme.numberMedium),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: indent),
            Text(
              'Valid Till',
              style: textTheme.bodyLarge,
            ),
            Container(
              color:
                  Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
              child: ListTile(
                title: Text(
                  widget.validTillDate != null
                      ? formatterDate.format(widget.validTillDate!)
                      : 'Select date',
                  style: textTheme.numberMedium,
                ),
                onTap: () async {
                  final DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: widget.validTillDate ?? currentDate,
                    firstDate: firstDate,
                    lastDate: lastDate,
                  );
                  if (selectedDate != null) {
                    setState(() {
                      widget.validTillDate = selectedDate;
                    });
                  }
                },
              ),
            ),
            SizedBox(height: indent),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Balance Date Update',
                  style: textTheme.bodyLarge,
                ),
                const Tooltip(
                  message:
                      'Outcomes and Incomes before this date won\'t affect the balance',
                  child: Icon(Icons.info_outline),
                ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: offset * 0.6,
                      ),
                      color: Theme.of(context)
                          .colorScheme
                          .inversePrimary
                          .withOpacity(0.3),
                      child: ListTile(
                        title: Text(
                          formatterDate.format(widget.balanceUpdateDate),
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.numberMedium,
                        ),
                        onTap: () async {
                          final DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: widget.balanceUpdateDate,
                            firstDate: firstDate,
                            lastDate: lastDate,
                          );
                          if (selectedDate != null) {
                            setState(() {
                              widget.balanceUpdateDate = selectedDate;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: indent),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: offset * 0.4,
                    ),
                    color: Theme.of(context)
                        .colorScheme
                        .inversePrimary
                        .withOpacity(0.3),
                    child: ListTile(
                      title: Text(
                        formatterTime.format(widget.balanceUpdateDate),
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.numberMedium,
                      ),
                      onTap: () {
                        DatePicker.showTimePicker(
                          context,
                          showTitleActions: true,
                          currentTime: widget.balanceUpdateDate,
                          onChanged: (dateTime) {
                            // Handle date and time changes
                            setState(() {
                              Duration dateRange = Duration(
                                seconds: dateTime.second,
                                minutes: dateTime.minute,
                                hours: dateTime.hour,
                              );
                              widget.balanceUpdateDate.add(dateRange);
                            });
                          },
                          onConfirm: (dateTime) {
                            // Handle date and time confirmation
                            setState(() {
                              widget.balanceUpdateDate = dateTime;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: indent),
            Text(
              'Actual Balance',
              style: textTheme.bodyLarge,
            ),
            TextFormField(
              initialValue:
                  widget.balance != null ? widget.balance.toString() : '',
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: Theme.of(context)
                    .colorScheme
                    .inversePrimary
                    .withOpacity(0.3),
                hintText: 'Set Balance',
                hintStyle: textTheme.numberMedium,
              ),
              onChanged: (value) {
                setState(() {
                  widget.balance = double.parse(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
