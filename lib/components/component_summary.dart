// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_start_of_month.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/_ext/string_ext.dart';
import 'package:app_finance/components/_core/component_data.dart';
import 'package:app_finance/components/widgets/account_widget.dart';
import 'package:app_finance/components/widgets/bill_widget.dart';
import 'package:app_finance/components/widgets/budget_widget.dart';
import 'package:app_finance/components/widgets/payment_widget.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/design/form/list_selector.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/generic/base_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComponentSummary extends StatelessWidget {
  final ComponentData data;

  const ComponentSummary(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent(0.5);
    EdgeInsets margin = EdgeInsets.all(indent);
    DateTime startingDay = DateTime.now().getStartingDay(AppStartOfMonth.get());
    return Consumer<AppData>(builder: (context, appState, _) {
      final exchange = Exchange(store: appState);
      return LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth - indent * 4;
        return Flex(
          direction: Axis.horizontal,
          children: [ThemeHelper.emptyBox],
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
