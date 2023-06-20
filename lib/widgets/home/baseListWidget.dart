import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/charts/barVerticalSingle.dart';
import 'package:app_finance/customTextTheme.dart';
import 'package:app_finance/helpers/themeHelper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BaseLineWidget extends StatelessWidget {
  final String title;
  final String details;
  final String description;
  final double progress;
  final Color color;
  final double offset;

  const BaseLineWidget({
    required this.title,
    required this.details,
    required this.description,
    this.progress = 1,
    required this.color,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    var theme = ThemeHelper(windowType: getWindowType(context));
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BarVerticalSingle(value: progress, height: 24, color: color),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Tooltip(
                        message: title,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: offset * 0.6 - theme.getIndent() * 2,
                          ),
                          child: Text(
                            title,
                            style: textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Text(
                        description,
                        style: textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(theme.getIndent()),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.4,
                ),
                child: Text(
                  details,
                  style: textTheme.numberMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
