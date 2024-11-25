// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/components/widgets/payment_widget.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/pages/_interfaces/interface_page_inject.dart';
import 'package:flutter/material.dart';

class PaymentsTab extends StatefulWidget {
  final FnPageCallback callback;
  final AppData state;

  const PaymentsTab({
    super.key,
    required this.callback,
    required this.state,
  });

  @override
  PaymentsTabState createState() => PaymentsTabState();
}

class PaymentsTabState extends State<PaymentsTab> {
  @override
  void initState() {
    widget.callback((
      buildButton: buildButton,
      buttonName: getButtonName(),
      title: AppLocale.labels.paymentsHeadline,
    ));
    super.initState();
  }

  String getButtonName() => AppLocale.labels.createPaymentTooltip;

  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FullSizedButtonWidget(
      constraints: constraints,
      onPressed: () => nav.pushNamed(AppRoute.automationPaymentRoute),
      title: getButtonName(),
      icon: Icons.add_alert_sharp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PaymentWidget(
      data: widget.state.getList(AppDataType.payments).cast(),
      state: widget.state,
      margin: EdgeInsets.fromLTRB(0, ThemeHelper.getIndent(), 0, ThemeHelper.barHeight),
    );
  }
}
