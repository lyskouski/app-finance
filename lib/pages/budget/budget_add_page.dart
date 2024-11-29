// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/budget_type.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_add_page.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:app_finance/pages/budget/widgets/budget_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class BudgetAddPage extends AbstractAddPage {
  final String? uuid;
  final String? title;
  final String? type;
  final double? budgetLimit;
  final IconData? icon;
  final MaterialColor? color;
  final Currency? currency;

  const BudgetAddPage({
    super.key,
    this.uuid,
    this.title,
    this.type,
    this.budgetLimit,
    this.icon,
    this.color,
    this.currency,
  });

  @override
  BudgetAddPageState createState() => BudgetAddPageState();
}

class BudgetAddPageState<T extends BudgetAddPage> extends AbstractAddPageState<T> {
  late FocusController focus;
  late TextEditingController title;
  late String? type;
  late TextEditingController budgetLimit;
  IconData? icon;
  MaterialColor? color;
  Currency? currency;
  Map<int, double> amountSet = {};
  bool skip = false;

  @override
  void initState() {
    focus = FocusController();
    title = TextEditingController(text: widget.title);
    type = widget.type ?? AppBudgetType.month.name;
    budgetLimit = TextEditingController(text: widget.budgetLimit != null ? widget.budgetLimit.toString() : '');
    icon = widget.icon;
    color = widget.color;
    final currencyId = AppPreferences.get(AppPreferences.prefCurrency);
    currency = widget.currency ?? CurrencyProvider.find(currencyId);
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    title.dispose();
    budgetLimit.dispose();
    super.dispose();
  }

  @override
  String getTitle() => AppLocale.labels.createBudgetHeader;

  @override
  bool hasFormErrors() {
    setState(() => hasError = title.text.isEmpty || currency == null);
    return hasError;
  }

  @override
  void updateStorage() {
    if (currency != null) {
      CurrencyProvider.pin(currency!);
    }
    super.state.add(BudgetAppData(
          title: title.text,
          type: type ?? AppBudgetType.month.name,
          amountLimit: double.tryParse(budgetLimit.text) ?? 0.0,
          amountSet: amountSet,
          progress: 0.0,
          color: color ?? Colors.red,
          hidden: false,
          currency: currency,
          icon: icon,
          skip: skip,
        )..setState(state));
  }

  @override
  String getButtonName() => AppLocale.labels.createBudgetTooltip;

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
    final textTheme = context.textTheme;
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
              isRequired: true,
              controller: title,
              title: AppLocale.labels.title,
              tooltip: AppLocale.labels.titleBudgetTooltip,
              showError: hasError && title.text.isEmpty,
            ),
            InputWrapper.select(
              isRequired: true,
              isDisabled: widget.uuid != null,
              value: type,
              title: AppLocale.labels.budgetType,
              tooltip: AppLocale.labels.budgetType,
              showError: hasError && type == null,
              options: BudgetType.getList(),
              onChange: (value) => setState(() => type = value),
            ),
            RowWidget(
              indent: indent,
              maxWidth: width + indent,
              chunk: const [0.5, 0.5],
              children: [
                [
                  InputWrapper.icon(
                    value: icon,
                    title: AppLocale.labels.icon,
                    onChange: (value) => setState(() => icon = value),
                  ),
                ],
                [
                  InputWrapper.color(
                    value: color,
                    title: AppLocale.labels.color,
                    onChange: (value) => setState(() => color = value),
                  ),
                ],
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: AppDesign.getAlignment<TextDirection>(),
              children: [
                TextWrapper(
                  AppLocale.labels.budgetLimit,
                  style: textTheme.bodyLarge,
                ),
                amountSet.isEmpty
                    ? IconButton(
                        icon: const Icon(Icons.vertical_split),
                        tooltip: AppLocale.labels.splitTooltip,
                        onPressed: () => setState(() {
                          final result = Map<int, double>.from(amountSet);
                          for (int i = 1; i <= 12; i++) {
                            result[i] = 1.0;
                          }
                          amountSet = result;
                        }),
                      )
                    : IconButton(
                        icon: const Icon(Icons.delete),
                        tooltip: AppLocale.labels.splitCancelTooltip,
                        onPressed: () => setState(() => amountSet = {}),
                      ),
              ],
            ),
            SimpleInput(
              key: ValueKey(AppLocale.labels.budgetLimit),
              controller: budgetLimit,
              type: const TextInputType.numberWithOptions(decimal: true),
              tooltip: AppLocale.labels.balanceTooltip,
              formatter: [
                SimpleInputFormatter.filterDouble,
              ],
            ),
            BudgetTypeWidget(controller: budgetLimit),
            ThemeHelper.hIndent2x,
            if (amountSet.isNotEmpty) ...[
              Text(
                AppLocale.labels.budgetRelativeLimit,
                style: textTheme.bodyLarge,
              ),
              ...amountSet.entries.map((e) {
                return RowWidget(
                  indent: indent,
                  maxWidth: width + indent,
                  chunk: const [100, null],
                  children: [
                    [
                      Text(
                        DateTime(DateTime.now().year, e.key).fullMonth(),
                        style: textTheme.headlineMedium,
                      ),
                    ],
                    [
                      Container(
                        color: context.colorScheme.fieldBackground,
                        child: Slider(
                          value: e.value,
                          onChanged: (v) => setState(() => amountSet[e.key] = v),
                          min: 0.0,
                          max: 4.0,
                          divisions: 15,
                          label: e.value.toStringAsFixed(2),
                        ),
                      ),
                    ],
                  ],
                );
              }),
              ThemeHelper.hIndent2x,
            ],
            InputWrapper.currency(
              isRequired: true,
              showError: hasError && currency == null,
              value: currency,
              title: AppLocale.labels.currency,
              tooltip: AppLocale.labels.currencyTooltip,
              onChange: (value) => setState(() => currency = value),
            ),
            RowWidget(
              indent: indent,
              maxWidth: width + indent,
              chunk: const [20, null],
              children: [
                [Checkbox(value: skip, onChanged: (value) => setState(() => skip = value!))],
                [ThemeHelper.hIndent05, TextWrapper(AppLocale.labels.skipFromTotals)],
              ],
            ),
            ThemeHelper.hIndent2x,
          ],
        ),
      ),
    );
  }
}
