// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_forms/color_selector.dart';
import 'package:app_finance/widgets/_forms/currency_selector.dart';
import 'package:app_finance/widgets/_forms/date_input.dart';
import 'package:app_finance/widgets/_forms/full_sized_button.dart';
import 'package:app_finance/widgets/_forms/icon_selector.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/required_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

class GoalAddPage extends AbstractPage {
  final String? title;
  final IconData? icon;
  final MaterialColor? color;
  final Currency? currency;
  final double? details;
  final DateTime? closedAt;

  GoalAddPage({
    this.title,
    this.icon,
    this.color,
    this.currency,
    this.details,
    this.closedAt,
  }) : super();

  @override
  GoalAddPageState createState() => GoalAddPageState();
}

class GoalAddPageState<T extends GoalAddPage> extends AbstractPageState<GoalAddPage> {
  late TextEditingController title;
  IconData? icon;
  MaterialColor? color;
  Currency? currency;
  late TextEditingController details;
  DateTime? closedAt;
  bool hasError = false;

  @override
  void initState() {
    title = TextEditingController(text: widget.title);
    icon = widget.icon;
    color = widget.color;
    details = TextEditingController(text: widget.details != null ? widget.details.toString() : '');
    currency = widget.currency;
    closedAt = widget.closedAt;
    super.initState();
  }

  @override
  String getTitle() {
    return AppLocale.labels.createGoalHeader;
  }

  bool hasFormErrors() {
    setState(() => hasError = title.text.isEmpty || closedAt == null);
    return hasError;
  }

  void updateStorage() {
    super.state.add(
        AppDataType.goals,
        GoalAppData(
          title: title.text,
          initial: Exchange(store: super.state)
              .reform(super.state.getTotal(AppDataType.accounts), Exchange.defaultCurrency, currency),
          progress: 0.0,
          color: color,
          hidden: false,
          currency: currency,
          icon: icon,
          details: double.tryParse(details.text) ?? 0.0,
          closedAt: closedAt,
        ));
  }

  String getButtonName() {
    return AppLocale.labels.createGoalTooltip;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FullSizedButton(
      constraints: constraints,
      setState: () => {
        setState(() {
          if (hasFormErrors()) {
            return;
          }
          updateStorage();
          nav.pop();
          nav.pop();
        })
      },
      title: getButtonName(),
      icon: Icons.save,
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent = ThemeHelper.getIndent(2);
    double width = ThemeHelper.getWidth(context, 6);

    return SingleChildScrollView(
      controller: FocusController.getController(runtimeType),
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequiredWidget(title: AppLocale.labels.titleGoal, showError: hasError && title.text.isEmpty),
            SimpleInput(
              controller: title,
              tooltip: AppLocale.labels.titleGoalTooltip,
              style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
            ),
            SizedBox(height: indent),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: width * 0.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocale.labels.icon,
                        style: textTheme.bodyLarge,
                      ),
                      IconSelector(
                        value: icon,
                        setState: (value) => setState(() => icon = value),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: indent),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: width * 0.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocale.labels.color,
                        style: textTheme.bodyLarge,
                      ),
                      ColorSelector(
                        value: color,
                        setState: (value) => setState(() => color = value),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: indent),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: width * 0.3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocale.labels.currency,
                        style: textTheme.bodyLarge,
                      ),
                      Container(
                        color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
                        width: double.infinity,
                        child: CurrencySelector(
                          value: currency?.code,
                          setView: (Currency currency) => currency.code,
                          setState: (value) => setState(() => currency = value),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: indent),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: width * 0.7,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocale.labels.targetAmount,
                        style: textTheme.bodyLarge,
                      ),
                      SimpleInput(
                        controller: details,
                        type: const TextInputType.numberWithOptions(decimal: true),
                        tooltip: AppLocale.labels.billSetTooltip,
                        style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
                        formatter: [
                          SimpleInput.filterDouble,
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: indent),
            RequiredWidget(title: AppLocale.labels.closedAt, showError: hasError && closedAt == null),
            DateInput(
              style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
              value: closedAt,
              setState: (value) => setState(() => closedAt = value),
            ),
          ],
        ),
      ),
    );
  }
}
