// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

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

class GoalAddPageState<T extends GoalAddPage>
    extends AbstractPageState<GoalAddPage> {
  String? title;
  IconData? icon;
  MaterialColor? color;
  Currency? currency;
  double? details;
  DateTime? closedAt;

  @override
  void initState() {
    title = widget.title;
    icon = widget.icon;
    color = widget.color;
    details = widget.details;
    currency = widget.currency;
    closedAt = widget.closedAt;
    super.initState();
  }

  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.createGoalHeader;
  }

  bool hasFormErrors() {
    bool isError = false;
    if (title == null || title!.isEmpty) {
      isError = true;
    }
    return isError;
  }

  void updateStorage() {
    super.state.add(
        AppDataType.goals,
        GoalAppData(
          title: title ?? '',
          initial: Exchange(store: super.state).reform(
              super.state.getTotal(AppDataType.accounts),
              Exchange.defaultCurrency,
              currency),
          progress: 0.0,
          color: color,
          hidden: false,
          currency: currency,
          icon: icon,
          details: details,
          closedAt: closedAt,
        ));
  }

  String getButtonName() {
    return AppLocalizations.of(context)!.createGoalTooltip;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    String title = getButtonName();
    FocusController.setContext(4);
    return SizedBox(
      width: constraints.maxWidth - ThemeHelper.getIndent() * 4,
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
              SizedBox(height: ThemeHelper.getIndent()),
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
    double indent = ThemeHelper.getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 3;
    int focusOrder = FocusController.DEFAULT;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${AppLocalizations.of(context)!.titleGoal}*',
                  style: textTheme.bodyLarge,
                ),
                Text(
                  '',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
            SimpleInput(
              value: title,
              tooltip: AppLocalizations.of(context)!.titleGoalTooltip,
              style: textTheme.numberMedium,
              setState: (value) => setState(() => title = value),
              focusOrder: focusOrder += 1,
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
                        // focusOrder: focusOrder += 1,
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
                        // focusOrder: focusOrder += 1,
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
                        color: Theme.of(context)
                            .colorScheme
                            .inversePrimary
                            .withOpacity(0.3),
                        width: double.infinity,
                        child: CurrencySelector(
                          value: currency,
                          setView: (Currency currency) => currency.code,
                          focusOrder: focusOrder += 1,
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
                        value: details != null ? details.toString() : '',
                        type: const TextInputType.numberWithOptions(
                            decimal: true),
                        tooltip: AppLocalizations.of(context)!.billSetTooltip,
                        style: textTheme.numberMedium,
                        formatter: [
                          SimpleInput.filterDouble,
                        ],
                        setState: (value) =>
                            setState(() => details = double.tryParse(value)),
                        focusOrder: focusOrder += 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: indent),
            Row(
              children: [
                Text(
                  '${AppLocalizations.of(context)!.closedAt}*',
                  style: textTheme.bodyLarge,
                ),
                Text(
                  '',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
            DateInput(
              style: textTheme.numberMedium,
              value: closedAt,
              setState: (value) => setState(() => closedAt = value),
              focusOrder: focusOrder += 1,
            ),
          ],
        ),
      ),
    );
  }
}
