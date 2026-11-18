// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:material_ui/material_ui.dart';

class IntegrationTarget {
  String? appAccount;
  String? category;
  DateTime from;

  IntegrationTarget({this.appAccount, this.category, required this.from});
}

class IntegrationAccountCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IntegrationTarget target;
  final AppData state;
  final bool isDisabled;
  final VoidCallback onChanged;
  final VoidCallback onImport;

  const IntegrationAccountCard({
    super.key,
    required this.title,
    required this.target,
    required this.state,
    required this.onChanged,
    required this.onImport,
    this.subtitle,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Card(
      margin: EdgeInsets.symmetric(vertical: ThemeHelper.getIndent()),
      child: Padding(
        padding: EdgeInsets.all(ThemeHelper.getIndent(2)),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            crossAxisAlignment: AppDesign.getAlignment(),
            children: [
              Text(title, style: textTheme.titleMedium),
              if (subtitle != null) Text(subtitle!),
              ThemeHelper.hIndent,
              InputWrapper(
                type: NamedInputType.accountSelector,
                title: AppLocale.labels.account,
                isRequired: true,
                value: target.appAccount != null ? state.getByUuid(target.appAccount!) : null,
                onChange: (value) {
                  target.appAccount = value?.uuid;
                  onChanged();
                },
                state: state,
                width: constraints.maxWidth,
              ),
              InputWrapper(
                type: NamedInputType.budgetSelector,
                title: AppLocale.labels.integrationDefaultBudgetCategory,
                isRequired: true,
                value: target.category != null ? state.getByUuid(target.category!) : null,
                onChange: (value) {
                  target.category = value?.uuid;
                  onChanged();
                },
                state: state,
                width: constraints.maxWidth,
              ),
              InputWrapper(
                type: NamedInputType.dateSelector,
                title: AppLocale.labels.integrationDateFrom,
                value: target.from,
                onChange: (value) {
                  target.from = value ?? target.from;
                  onChanged();
                },
              ),
              ThemeHelper.hIndent,
              FullSizedButtonWidget(
                icon: Icons.download,
                onPressed: onImport,
                title: AppLocale.labels.integrationImport,
                isDisabled: isDisabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
