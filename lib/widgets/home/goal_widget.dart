// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class GoalWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final List<dynamic> state;

  const GoalWidget({
    super.key,
    required this.margin,
    required this.state,
  });

  double _calculateState(strStartDate, strEndDate) {
    DateTime startDate = DateTime.parse(strStartDate);
    DateTime endDate = DateTime.parse(strEndDate);
    DateTime currentDate = DateTime.now();
    if (endDate.isBefore(currentDate) ||
        endDate.isAtSameMomentAs(currentDate)) {
      return 1.0;
    } else if (currentDate.isBefore(startDate) ||
        startDate.isAtSameMomentAs(currentDate)) {
      return 0.0;
    } else {
      double totalDays = endDate.difference(startDate).inDays.toDouble();
      double currentDays = currentDate.difference(startDate).inDays.toDouble();
      return currentDays / totalDays;
    }
  }

  @override
  Widget build(context) {
    var theme = ThemeHelper(windowType: getWindowType(context));
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth =
        MediaQuery.of(context).size.width - theme.getIndent() * 2;

    final locale = Localizations.localeOf(context).toString();
    final DateFormat formatterDate = DateFormat.yMEd(locale);

    return Container(
      margin: margin,
      height: 50 + theme.getIndent() * 2,
      color: colorScheme.inversePrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FractionallySizedBox(
            widthFactor: 1.0,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        theme.getIndent(), theme.getIndent(), 0, 0),
                    child: Text(
                      AppLocalizations.of(context)!.goalHeadline,
                      style: textTheme.headlineSmall,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6,
                        ),
                        child: Tooltip(
                          message: state[0].title,
                          child: Padding(
                            padding: EdgeInsets.only(left: theme.getIndent()),
                            child: Text(
                              state[0].title,
                              style: textTheme.headlineMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.3,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: theme.getIndent()),
                          child: Text(
                            formatterDate.format(DateTime.parse(state[0].endDate)),
                            style: textTheme.headlineMedium,
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 8,
                    margin: EdgeInsets.fromLTRB(theme.getIndent(),
                        theme.getIndent() / 2, theme.getIndent(), 0),
                    child: LinearProgressIndicator(
                      value: state[0].progress,
                      backgroundColor: colorScheme.primary.withOpacity(0.3),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          colorScheme.onPrimaryContainer),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Transform.translate(
                offset: Offset(
                    theme.getIndent() * 1.5 +
                        screenWidth * _calculateState(state[0].startDate, state[0].endDate),
                    -6),
                child: Tooltip(
                  message: AppLocalizations.of(context)!.currentDate,
                  child: Container(
                    width: 4.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: colorScheme.inversePrimary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
