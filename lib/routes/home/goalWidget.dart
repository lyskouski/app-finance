import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/customTheme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoalWidget extends StatelessWidget {
  EdgeInsetsGeometry margin;
  String title;
  String startDate;
  String endDate;

  GoalWidget({
    super.key,
    required this.margin,
    required this.title,
    required this.startDate,
    required this.endDate,
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
    var theme = CustomTheme(windowType: getWindowType(context));
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
                      'Goals',
                      style: textTheme.headlineSmall,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Tooltip(
                        message: title,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Padding(
                            padding: EdgeInsets.only(left: theme.getIndent()),
                            child: Text(
                              title,
                              style: textTheme.headlineMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: theme.getIndent()),
                        child: Text(
                          formatterDate.format(DateTime.parse(endDate)),
                          style: textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 8,
                    margin: EdgeInsets.fromLTRB(theme.getIndent(),
                        theme.getIndent() / 2, theme.getIndent(), 0),
                    child: LinearProgressIndicator(
                      value: 0.4,
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
                        screenWidth * _calculateState(startDate, endDate),
                    -6),
                child: Tooltip(
                  message: 'Current Date',
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
