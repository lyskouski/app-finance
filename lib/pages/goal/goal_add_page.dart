// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_add_page.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class GoalAddPage extends AbstractAddPage {
  final String? title;
  final IconData? icon;
  final MaterialColor? color;
  final Currency? currency;
  final double? details;
  final DateTime? closedAt;

  const GoalAddPage({
    super.key,
    this.title,
    this.icon,
    this.color,
    this.currency,
    this.details,
    this.closedAt,
  });

  @override
  GoalAddPageState createState() => GoalAddPageState();
}

class GoalAddPageState<T extends GoalAddPage> extends AbstractAddPageState<GoalAddPage> {
  late FocusController focus;
  late TextEditingController title;
  late TextEditingController details;
  IconData? icon;
  MaterialColor? color;
  Currency? currency;
  DateTime? closedAt;

  @override
  void initState() {
    focus = FocusController();
    title = TextEditingController(text: widget.title);
    icon = widget.icon;
    color = widget.color;
    details = TextEditingController(text: widget.details != null ? widget.details.toString() : '');
    final currencyId = AppPreferences.get(AppPreferences.prefCurrency);
    currency = widget.currency ?? CurrencyProvider.find(currencyId);
    closedAt = widget.closedAt;
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    title.dispose();
    details.dispose();
    super.dispose();
  }

  @override
  String getTitle() => AppLocale.labels.createGoalHeader;

  @override
  bool hasFormErrors() {
    setState(() => hasError = title.text.isEmpty || closedAt == null);
    return hasError;
  }

  @override
  void updateStorage() {
    if (currency != null) {
      CurrencyProvider.pin(currency!);
    }
    state.add(GoalAppData(
      title: title.text,
      initial: Exchange(store: state).reform(state.getTotal(AppDataType.accounts), Exchange.defaultCurrency, currency),
      progress: 0.0,
      color: color,
      hidden: false,
      currency: currency,
      icon: icon,
      details: double.tryParse(details.text) ?? 0.0,
      closedAt: closedAt,
    ));
  }

  @override
  String getButtonName() => AppLocale.labels.createGoalTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FullSizedButtonWidget(
      constraints: constraints,
      controller: focus,
      onPressed: () => triggerActionButton(nav),
      title: getButtonName(),
      icon: Icons.save,
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    double indent = ThemeHelper.getIndent(2);
    double width = ThemeHelper.getWidth(context, 6, constraints);

    return SingleScrollWrapper(
      controller: focus,
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 240),
        child: Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            InputWrapper.text(
              title: AppLocale.labels.titleGoal,
              showError: hasError && title.text.isEmpty,
              controller: title,
              isRequired: true,
              tooltip: AppLocale.labels.titleGoalTooltip,
            ),
            RowWidget(
              indent: indent,
              maxWidth: width + indent,
              alignment: AppDesign.getAlignment<MainAxisAlignment>(),
              chunk: const [null, null],
              children: [
                [
                  InputWrapper.icon(
                    title: AppLocale.labels.icon,
                    value: icon,
                    onChange: (value) => setState(() => icon = value),
                  ),
                ],
                [
                  InputWrapper.color(
                    title: AppLocale.labels.color,
                    value: color,
                    onChange: (value) => setState(() => color = value),
                  ),
                ],
              ],
            ),
            RowWidget(
              indent: indent,
              maxWidth: width + indent,
              alignment: AppDesign.getAlignment<MainAxisAlignment>(),
              chunk: const [100, null],
              children: [
                [
                  InputWrapper.currency(
                    title: AppLocale.labels.currency,
                    type: NamedInputType.currencyShort,
                    value: currency,
                    tooltip: AppLocale.labels.currencyTooltip,
                    onChange: (value) => setState(() => currency = value),
                  ),
                ],
                [
                  InputWrapper.text(
                    title: AppLocale.labels.targetAmount,
                    controller: details,
                    inputType: const TextInputType.numberWithOptions(decimal: true),
                    tooltip: AppLocale.labels.billSetTooltip,
                    formatter: [
                      SimpleInputFormatter.filterDouble,
                    ],
                  ),
                ],
              ],
            ),
            InputWrapper(
              title: AppLocale.labels.closedAt,
              type: NamedInputType.dateSelector,
              showError: hasError && closedAt == null,
              value: closedAt,
              onChange: (value) => setState(() => closedAt = value),
            ),
          ],
        ),
      ),
    );
  }
}
