// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/customTextTheme.dart';
import 'package:app_finance/helpers/themeHelper.dart';
import 'package:app_finance/widgets/home/baseListWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BaseWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String title;
  final double? offset;

  const BaseWidget({
    Key? key,
    required this.margin,
    required this.title,
    this.offset,
  }) : super(key: key);

  @override
  Widget build(context) {
    var theme = ThemeHelper(windowType: getWindowType(context));
    final locale = Localizations.localeOf(context).toString();
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: '\$',
      decimalDigits: 2,
    );
    final DateFormat formatterDate = DateFormat.MMMMd(locale);

    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedBox(
              widthFactor: 1.0,
              child: Container(
                color: colorScheme.inverseSurface.withOpacity(0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          theme.getIndent(), theme.getIndent(), 0, 0),
                      child: Text(
                        title,
                        style: textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          theme.getIndent(), 0, 0, theme.getIndent()),
                      child: Text(
                        formatter.format(123456.789),
                        style: textTheme.numberLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: theme.getIndent()),
                  BaseLineWidget(
                    title: 'Description $title 1 with a long explanation',
                    description: formatterDate.format(DateTime.parse('2023-06-17')),
                    details: formatter.format(12345789.098),
                    progress: 0.5,
                    color: Colors.red,
                    offset: offset ?? MediaQuery.of(context).size.width,
                  ),
                  BaseLineWidget(
                    title: 'Description $title 2',
                    description: formatterDate.format(DateTime.parse('2023-06-16 22:10')),
                    details: formatter.format(1234.789),
                    progress: 0.8,
                    color: Colors.green,
                    offset: offset ?? MediaQuery.of(context).size.width,
                  ),
                  BaseLineWidget(
                    title: 'Description $title 3',
                    description: formatterDate.format(DateTime.parse('2023-06-15')),
                    details: formatter.format(123.789),
                    color: Colors.yellow,
                    offset: offset ?? MediaQuery.of(context).size.width,
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle "More" button pressed
                    },
                    child: Text(AppLocalizations.of(context)!.btnMore),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
