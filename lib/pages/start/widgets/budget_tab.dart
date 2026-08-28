// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/pages/budget/budget_add_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetTab extends BudgetAddPage {
  final bool isFirstBoot;
  final Function() setState;
  final Function(Widget btn) setButton;

  const BudgetTab({
    super.key,
    required this.isFirstBoot,
    required this.setState,
    required this.setButton,
  });

  @override
  BudgetTabState createState() => BudgetTabState();
}

class BudgetTabState extends BudgetAddPageState<BudgetTab> {
  @override
  void triggerActionButton(NavigatorState nav) {
    setState(() {
      if (hasFormErrors()) {
        return;
      }
      updateStorage();
      AppPreferences.set(AppPreferences.prefBudget, super.state.getList(AppDataType.budgets).first?.uuid);
      widget.setState();
    });
  }

  Widget _nextButton(BuildContext context, BoxConstraints constraints) => FullSizedButtonWidget(
        constraints: constraints,
        controller: focus,
        onPressed: () => widget.setState(),
        title: AppLocale.labels.goNextTooltip,
        icon: Icons.exit_to_app_rounded,
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (context, appState, _) {
      state = appState;
      final isCreated = state.getList(AppDataType.budgets).isNotEmpty;
      return Padding(
        padding: EdgeInsets.only(top: ThemeHelper.getIndent(2)),
        child: LayoutBuilder(builder: (context, constraints) {
          if (widget.isFirstBoot) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.setButton(
                isCreated ? _nextButton(context, constraints) : buildButton(context, constraints),
              );
            });
            return ThemeHelper.emptyBox;
          }
          if (isCreated) {
            return Center(child: Text(AppLocale.labels.isCreated));
          }
          return buildContent(context, constraints);
        }),
      );
    });
  }
}
