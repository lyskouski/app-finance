// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/payment_type.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/form/list_selector.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_add_page.dart';
import 'package:flutter/material.dart';

class PaymentAddPage extends AbstractAddPage {
  const PaymentAddPage({super.key});

  @override
  PaymentAddPageState createState() => PaymentAddPageState();
}

class PaymentAddPageState extends AbstractAddPageState<PaymentAddPage> {
  late FocusController focus;
  String? itemType;

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
    // TODO: implement hasFormErrors
    throw UnimplementedError();
  }

  @override
  void updateStorage() {
    // TODO: implement updateStorage
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    double indent = ThemeHelper.getIndent(2);
    final textTheme = context.textTheme;
    return SingleScrollWrapper(
      controller: focus,
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 240),
        child: Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            Text(
              AppLocale.labels.billTypeTooltip,
              style: textTheme.bodyLarge,
            ),
            ListSelector<ListSelectorItem>(
              value: itemType != null ? ListSelectorItem(id: itemType!, name: '') : null,
              hintText: AppLocale.labels.billTypeTooltip,
              options: PaymentType.getList(),
              setState: (value) => setState(() => itemType = value?.id),
            ),
          ],
        ),
      ),
    );
  }
}
