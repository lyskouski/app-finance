// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/data/exchange.dart';
import 'package:app_finance/_classes/data/goal_app_data.dart';
import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_forms/color_selector.dart';
import 'package:app_finance/widgets/_forms/currency_selector.dart';
import 'package:app_finance/widgets/_forms/date_input.dart';
import 'package:app_finance/widgets/_forms/icon_selector.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/required_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

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
  String getTitle(context) {
    return AppLocalizations.of(context)!.createGoalHeader;
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
    return AppLocalizations.of(context)!.createGoalTooltip;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    String title = getButtonName();
    return SizedBox(
      width: constraints.maxWidth - helper.getIndent() * 4,
      child: FloatingActionButton(
        onPressed: () => {
          setState(() {
            if (hasFormErrors()) {
              return;
            }
            updateStorage();
            Navigator.pop(context);
            Navigator.pop(context);
          })
        },
        focusNode: FocusController.getFocusNode(),
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
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent = ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 3;

    return SingleChildScrollView(
      controller: FocusController.getController(),
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequiredWidget(title: AppLocalizations.of(context)!.titleGoal, showError: hasError && title.text.isEmpty),
            SimpleInput(
              controller: title,
              tooltip: AppLocalizations.of(context)!.titleGoalTooltip,
              style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
            ),
            SizedBox(height: indent),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: offset * 0.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.icon,
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
                    maxWidth: offset * 0.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.color,
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
                    maxWidth: offset * 0.3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.currency,
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
                    maxWidth: offset * 0.7,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.targetAmount,
                        style: textTheme.bodyLarge,
                      ),
                      SimpleInput(
                        controller: details,
                        type: const TextInputType.numberWithOptions(decimal: true),
                        tooltip: AppLocalizations.of(context)!.billSetTooltip,
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
            RequiredWidget(title: AppLocalizations.of(context)!.closedAt, showError: hasError && closedAt == null),
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
