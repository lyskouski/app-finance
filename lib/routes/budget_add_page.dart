// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_forms/color_selector.dart';
import 'package:app_finance/widgets/_forms/currency_selector.dart';
import 'package:app_finance/widgets/_forms/full_sized_button.dart';
import 'package:app_finance/widgets/_forms/icon_selector.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/required_widget.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BudgetAddPage extends AbstractPage {
  final String? title;
  final double? budgetLimit;
  final IconData? icon;
  final MaterialColor? color;
  final Currency? currency;

  BudgetAddPage({
    this.title,
    this.budgetLimit,
    this.icon,
    this.color,
    this.currency,
  }) : super();

  @override
  BudgetAddPageState createState() => BudgetAddPageState();
}

class BudgetAddPageState<T extends BudgetAddPage> extends AbstractPageState<BudgetAddPage> with SharedPreferencesMixin {
  late TextEditingController title;
  late TextEditingController budgetLimit;
  IconData? icon;
  MaterialColor? color;
  Currency? currency;
  bool hasError = false;

  @override
  void initState() {
    title = TextEditingController(text: widget.title);
    budgetLimit = TextEditingController(text: widget.budgetLimit != null ? widget.budgetLimit.toString() : '');
    icon = widget.icon;
    color = widget.color;
    final currencyId = getPreference(prefCurrency);
    currency = widget.currency ?? CurrencyProvider.findByCode(currencyId);
    super.initState();
  }

  @override
  String getTitle() {
    return AppLocale.labels.createBudgetHeader;
  }

  bool hasFormErrors() {
    setState(() => hasError = title.text.isEmpty);
    return hasError;
  }

  void updateStorage() {
    super.state.add(
        AppDataType.budgets,
        BudgetAppData(
          title: title.text,
          amountLimit: double.tryParse(budgetLimit.text) ?? 0.0,
          progress: 0.0,
          color: color ?? Colors.red,
          hidden: false,
          currency: currency,
          icon: icon,
        ));
  }

  String getButtonName() {
    return AppLocale.labels.createBudgetTooltip;
  }

  void triggerActionButton(NavigatorState nav) {
    setState(() {
      if (hasFormErrors()) {
        return;
      }
      updateStorage();
      nav.pop();
      nav.pop();
    });
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FullSizedButton(
      constraints: constraints,
      setState: () => triggerActionButton(nav),
      title: getButtonName(),
      icon: Icons.save,
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent = ThemeHelper.getIndent(2);
    double offset = ThemeHelper.getWidth(context, 6);

    return SingleChildScrollView(
      controller: FocusController.getController(runtimeType),
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequiredWidget(title: AppLocale.labels.title, showError: hasError && title.text.isEmpty),
            SimpleInput(
              controller: title,
              tooltip: AppLocale.labels.titleBudgetTooltip,
              style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
            ),
            SizedBox(height: indent),
            RowWidget(
              indent: indent,
              maxWidth: offset,
              chunk: const [0.5, 0.5],
              children: [
                [
                  Text(
                    AppLocale.labels.icon,
                    style: textTheme.bodyLarge,
                  ),
                  IconSelector(
                    value: icon,
                    setState: (value) => setState(() => icon = value),
                  ),
                ],
                [
                  Text(
                    AppLocale.labels.color,
                    style: textTheme.bodyLarge,
                  ),
                  ColorSelector(
                    value: color,
                    setState: (value) => setState(() => color = value),
                  ),
                ],
              ],
            ),
            SizedBox(height: indent),
            Text(
              AppLocale.labels.budgetLimit,
              style: textTheme.bodyLarge,
            ),
            SimpleInput(
              controller: budgetLimit,
              type: const TextInputType.numberWithOptions(decimal: true),
              tooltip: AppLocale.labels.balanceTooltip,
              style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
              formatter: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}')),
              ],
            ),
            SizedBox(height: indent),
            Text(
              AppLocale.labels.currency,
              style: textTheme.bodyLarge,
            ),
            Container(
              color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
              width: offset + indent,
              child: CurrencySelector(
                value: currency?.code,
                setState: (value) => setState(() => currency = value),
              ),
            ),
            SizedBox(height: indent),
          ],
        ),
      ),
    );
  }
}
