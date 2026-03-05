// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_start_of_month.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/components/_core/component_data.dart';
import 'package:app_finance/design/generic/text_widget.dart';
import 'package:app_finance/design/wrapper/table_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComponentSummary extends StatelessWidget {
  final ComponentData data;

  const ComponentSummary(this.data, {super.key});

  _generateSummaryTable(AppData appState) {
    final exchange = Exchange(store: appState);
    DateTime startingDay = DateTime.now().getStartingDay(AppStartOfMonth.get());
    return [
      [
        TextWidget(' '),
        TextWidget(startingDay.getPreviousMonth(5).fullMonthYear()),
        TextWidget(startingDay.getPreviousMonth(4).fullMonthYear()),
        TextWidget(startingDay.getPreviousMonth(3).fullMonthYear()),
        TextWidget(startingDay.getPreviousMonth(2).fullMonthYear()),
        TextWidget(startingDay.getPreviousMonth(1).fullMonthYear()),
        TextWidget(startingDay.fullMonthYear()),
        TextWidget(AppLocale.labels.summary),
      ],
      [
        TextWidget(AppLocale.labels.budgetHeadline),
        TextWidget(' '),
        TextWidget(' '),
        TextWidget(' '),
        TextWidget(' '),
        TextWidget(' '),
        TextWidget(' '),
        TextWidget(' '),
      ],
      [
        TextWidget(AppLocale.labels.invoiceHeadline),
        TextWidget(' '),
        TextWidget(' '),
        TextWidget(' '),
        TextWidget(' '),
        TextWidget(' '),
        TextWidget(' '),
        TextWidget(' '),
      ],
      [
        TextWidget(AppLocale.labels.summary),
        TextWidget(' ---TBD--- '),
        TextWidget(' ---TBD--- '),
        TextWidget(' ---TBD--- '),
        TextWidget(' ---TBD--- '),
        TextWidget(' ---TBD--- '),
        TextWidget(' ---TBD--- '),
        TextWidget(' ---TBD--- '),
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent(0.5);
    return Consumer<AppData>(builder: (context, appState, _) {
      return LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth - indent * 4;
        return Flex(
          direction: Axis.horizontal,
          children: [
            TableWidget(
              shadowColor: context.colorScheme.onSurface.withValues(alpha: 0.1),
              width: width - 2 * indent,
              chunk: const [200, null, null, null, null, null, null, 100],
              data: _generateSummaryTable(appState),
            )
          ],
        );
      });
    });
  }
}

class ComponentSummaryForm extends StatefulWidget {
  final ComponentData data;
  final Function adjust;

  const ComponentSummaryForm(this.data, {super.key, required this.adjust});

  @override
  ComponentSummaryFormState createState() => ComponentSummaryFormState();
}

class ComponentSummaryFormState extends State<ComponentSummaryForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      padding: EdgeInsets.all(ThemeHelper.getIndent(4)),
      height: double.infinity,
      child: TextWrapper(AppLocale.labels.summary),
    );
  }
}
