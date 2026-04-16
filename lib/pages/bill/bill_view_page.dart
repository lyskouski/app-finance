// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/flow_state_machine.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/wrapper/background_wrapper.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/bill/widgets/bill_header_widget.dart';
import 'package:app_finance/design/wrapper/confirmation_wrapper.dart';
import 'package:app_finance/pages/bill/widgets/bill_line_widget.dart';
import 'package:flutter/material.dart';

class BillViewPage extends StatefulWidget {
  final String uuid;

  const BillViewPage({
    super.key,
    required this.uuid,
  });

  @override
  BillViewPageState createState() => BillViewPageState();
}

class BillViewPageState extends AbstractPageState<BillViewPage> {
  bool isFormShown = false;
  late TextEditingController description;
  late TextEditingController bill;
  late TextEditingController budget;

  void initState() {
    super.initState();
    description = TextEditingController();
    bill = TextEditingController();
    budget = TextEditingController();
  }

  @override
  void dispose() {
    description.dispose();
    bill.dispose();
    budget.dispose();
    super.dispose();
  }

  @override
  String getTitle() => (state.getByUuid(widget.uuid) as BillAppData).title;

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    double indent = ThemeHelper.getIndent(4);
    NavigatorState nav = Navigator.of(context);
    return Container(
      margin: EdgeInsets.only(left: 2 * indent, right: 2 * indent),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        FloatingActionButton(
          heroTag: 'bill_view_page_edit',
          onPressed: () => nav.pushNamed(AppRoute.billEditRoute, arguments: {routeArguments.uuid: widget.uuid}),
          tooltip: AppLocale.labels.editBillTooltip,
          child: const Icon(Icons.edit),
        ),
        FloatingActionButton(
          heroTag: 'bill_view_page_deactivate',
          onPressed: () => ConfirmationWrapper.show(
            context,
            () => FlowStateMachine.deactivate(nav, store: super.state, uuid: widget.uuid),
          ),
          tooltip: AppLocale.labels.deleteBillTooltip,
          child: const Icon(Icons.delete),
        ),
      ]),
    );
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
    splitItem.category = budget.text;
    splitItem.title = '${item.title}: ${description.text}';
    splitItem.childOf = item.uuid;
    state.add(splitItem);
    setState(() => isFormShown = false);
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final indent = ThemeHelper.getIndent();
    final item = state.getByUuid(widget.uuid) as BillAppData;
    budget.text = item.category;
    bill.text = item.details.toString();
    final width = ThemeHelper.getWidth(context, 2, constraints);
    final bills = state
        .getStream<BillAppData>(AppDataType.bills, filter: (e) => e.childOf != widget.uuid)
        .toList()
        .cast<BillAppData>();
    return Padding(
      padding: EdgeInsets.only(top: indent),
      child: Column(
        children: [
          BillHeaderWidget(
            item: item,
            width: width,
          ),
          ThemeHelper.hIndent05,
          const Divider(height: 2),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(indent),
              child: Column(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: bills.length,
                    itemBuilder: (_, int index) {
                      BillAppData item = bills[index];
                      final account = state.getByUuid(item.account);
                      final budget = state.getByUuid(item.category);
                      return BackgroundWrapper(
                        index: index,
                        child: BillLineWidget(
                          width: width - 2 * indent,
                          uuid: item.uuid ?? '',
                          title: item.title,
                          details: item.detailsFormatted,
                          description: item.description,
                          color: item.color ?? Colors.transparent,
                          icon: item.icon ?? Icons.question_mark,
                          descriptionColor: account?.color ?? Colors.transparent,
                          iconTooltip: budget?.title ?? '?',
                        ),
                      );
                    },
                  ),
                  if (isFormShown) ...[
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
                      value: state.getByUuid(budget.text),
                      title: AppLocale.labels.budget,
                      tooltip: AppLocale.labels.titleBudgetTooltip,
                      state: state,
                      onChange: (value) => setState(() => budget.text = value?.uuid ?? ''),
                      width: width - 2 * indent,
                    ),
                    ThemeHelper.hIndent,
                    FullSizedButtonWidget(
                      onPressed: saveAction,
                      title: AppLocale.labels.saveSettingsTooltip,
                      icon: Icons.save_outlined,
                    ),
                  ],
                  if (!isFormShown)
                    FullSizedButtonWidget(
                      onPressed: () => setState(() => isFormShown = true),
                      title: AppLocale.labels.splitHeadline,
                      icon: Icons.account_balance_wallet_outlined,
                    ),
                  const Divider(),
                  // Images
                  ThemeHelper.formEndBox,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
