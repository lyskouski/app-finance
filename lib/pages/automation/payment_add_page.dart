// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/payment_app_data.dart';
import 'package:app_finance/_configs/budget_type.dart';
import 'package:app_finance/_configs/payment_type.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_add_page.dart';
import 'package:app_finance/pages/bill/widgets/expenses_tab.dart';
import 'package:app_finance/pages/bill/widgets/income_tab.dart';
import 'package:app_finance/pages/bill/widgets/transfer_tab.dart';
import 'package:flutter/material.dart';

class PaymentAddPage extends AbstractAddPage {
  const PaymentAddPage({super.key});

  @override
  PaymentAddPageState createState() => PaymentAddPageState();
}

class PaymentAddPageState<T extends PaymentAddPage> extends AbstractAddPageState<T> {
  late FocusController focus;
  bool hasErrors = false;
  String? itemType;
  String? intervalType;
  dynamic item;
  DateTime? updatedAt;
  final GlobalKey<ExpensesTabState> expensesTabKey = GlobalKey();
  final GlobalKey<IncomeTabState> incomeTabKey = GlobalKey();
  final GlobalKey<TransferTabState> transferTabKey = GlobalKey();

  @override
  void initState() {
    focus = FocusController();
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

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
  String getButtonName() => AppLocale.labels.createPaymentTooltip;

  @override
  String getTitle() => AppLocale.labels.paymentsHeadline;

  @override
  bool hasFormErrors() {
    setState(() => hasErrors = itemType == null || intervalType == null);
    return hasErrors;
  }

  dynamic getValues() {
    dynamic values;
    if (itemType == AppPaymentType.bill.name) {
      values = expensesTabKey.currentState?.getValues();
    }
    if (itemType == AppPaymentType.invoice.name) {
      values = incomeTabKey.currentState?.getValues();
    }
    if (itemType == AppPaymentType.transfer.name) {
      values = transferTabKey.currentState?.getValues();
    }
    values?.setState(state);
    return values;
  }

  @override
  void updateStorage() {
    final values = getValues();
    state.add(PaymentAppData(
      title: intervalType ?? AppBudgetType.month.name,
      data: values.toFile(),
      updatedAt: values.createdAt,
    ));
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    double indent = ThemeHelper.getIndent(2);
    final isLeft = ScreenHelper.state().isLeftBar;
    return SingleScrollWrapper(
      controller: focus,
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, indent),
        child: Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            InputWrapper.select(
              isRequired: true,
              value: intervalType,
              title: AppLocale.labels.paymentType,
              tooltip: AppLocale.labels.paymentType,
              showError: hasErrors && intervalType == null,
              options: BudgetType.getList(),
              onChange: (value) => setState(() => intervalType = value),
            ),
            InputWrapper.select(
              isRequired: true,
              value: itemType,
              title: AppLocale.labels.billTypeTooltip,
              tooltip: AppLocale.labels.billTypeTooltip,
              showError: hasErrors && itemType == null,
              options: PaymentType.getList(),
              onChange: (value) => setState(() => itemType = value),
            ),
            const Divider(),
            if (itemType == AppPaymentType.bill.name)
              ExpensesTab(
                key: expensesTabKey,
                state: state,
                isLeft: isLeft,
                callback: (_) => null,
                account: item?.account,
                budget: item?.category,
                currency: item?.currency,
                bill: item?.details,
                description: item?.title,
                createdAt: updatedAt,
              ),
            if (itemType == AppPaymentType.invoice.name)
              IncomeTab(
                key: incomeTabKey,
                state: state,
                isLeft: isLeft,
                callback: (_) => null,
                account: item?.account,
                amount: item?.details,
                currency: item?.currency,
                description: item?.description,
                createdAt: updatedAt,
              ),
            if (itemType == AppPaymentType.transfer.name)
              TransferTab(
                key: transferTabKey,
                state: state,
                isLeft: isLeft,
                callback: (_) => null,
                accountTo: item?.account,
                accountFrom: item?.accountFrom,
                amount: item?.details,
                currency: item?.currency,
                description: item?.description,
                createdAt: updatedAt,
              ),
          ],
        ),
      ),
    );
  }
}
