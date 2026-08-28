// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/button/link_widget.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:flutter/material.dart';

class BillSplitPage extends StatefulWidget {
  final String uuid;

  const BillSplitPage({
    super.key,
    required this.uuid,
  });

  @override
  BillSplitPageState createState() => BillSplitPageState();
}

class BillSplitPageState extends AbstractPageState<BillSplitPage> {
  late FocusController focus;
  late TextEditingController description;
  late TextEditingController bill;
  String? budget;

  @override
  void initState() {
    super.initState();
    focus = FocusController();
    description = TextEditingController();
    bill = TextEditingController();
  }

  @override
  void dispose() {
    description.dispose();
    bill.dispose();
    super.dispose();
  }

  @override
  String getTitle() => AppLocale.labels.splitHeadline;

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return Container();
  }

  void saveAction() {
    double amount = double.tryParse(bill.text) ?? 0.0;
    final item = state.getByUuid(widget.uuid).clone() as BillAppData;
    item.details -= amount;
    item.hasChild = true;
    state.update(item.uuid ?? '', item);
    final splitItem = item.clone();
    splitItem.uuid = null;
    splitItem.details = amount;
    splitItem.category = budget ?? item.category;
    splitItem.title = '${item.title}: ${description.text}';
    splitItem.childOf = item.uuid;
    state.add(splitItem);
    Navigator.of(context).pop();
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final indent = ThemeHelper.getIndent();
    final item = state.getByUuid(widget.uuid) as BillAppData;
    final width = ThemeHelper.getWidth(context, 2, constraints);

    return SingleScrollWrapper(
      controller: focus,
      child: Container(
        padding: EdgeInsets.all(indent),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: LinkWidget(
                AppLocale.labels.btnCancel,
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            ThemeHelper.hIndent,
            // Form
            InputWrapper.text(
              title: AppLocale.labels.description,
              controller: description,
              tooltip: AppLocale.labels.descriptionTooltip,
            ),
            InputWrapper.text(
              title: AppLocale.labels.expense,
              isRequired: true,
              controller: bill,
              tooltip: AppLocale.labels.billSetTooltip,
              inputType: const TextInputType.numberWithOptions(decimal: true),
              formatter: [SimpleInputFormatter.filterDouble],
            ),
            InputWrapper(
              type: NamedInputType.budgetSelector,
              isRequired: true,
              value: state.getByUuid(budget ?? item.category),
              title: AppLocale.labels.budget,
              tooltip: AppLocale.labels.titleBudgetTooltip,
              state: state,
              onChange: (value) => setState(() => budget = value?.uuid),
              width: width - 2 * indent,
            ),
            ThemeHelper.hIndent,
            FullSizedButtonWidget(
              onPressed: saveAction,
              title: AppLocale.labels.saveSettingsTooltip,
              icon: Icons.save_outlined,
            ),
            ThemeHelper.formEndBox,
          ],
        ),
      ),
    );
  }
}
