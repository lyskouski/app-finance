import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/customTheme.dart';
import 'package:app_finance/routes/home/baseListWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BaseWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String title;

  const BaseWidget({
    Key? key,
    required this.margin,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(context) {
    var theme = CustomTheme(windowType: getWindowType(context));
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
                        style: textTheme.labelSmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          theme.getIndent(), 0, 0, theme.getIndent()),
                      child: Text(
                        formatter.format(123456.789),
                        style: textTheme.displaySmall,
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
                    title: 'Description $title 1',
                    description: formatterDate.format(DateTime.parse('2023-06-17')),
                    details: formatter.format(12345.789),
                    progress: 0.5,
                    color: Colors.red,
                  ),
                  BaseLineWidget(
                    title: 'Description $title 2',
                    description: formatterDate.format(DateTime.parse('2023-06-16 22:10')),
                    details: formatter.format(1234.789),
                    progress: 0.8,
                    color: Colors.green,
                  ),
                  BaseLineWidget(
                    title: 'Description $title 3',
                    description: formatterDate.format(DateTime.parse('2023-06-15')),
                    details: formatter.format(123.789),
                    color: Colors.yellow,
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle "More" button pressed
                    },
                    child: Text('More'),
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
