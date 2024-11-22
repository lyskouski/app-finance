// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/pages/_interfaces/interface_page_inject.dart';
import 'package:flutter/material.dart';

class PaymentsTab extends StatefulWidget {
  final FnPageCallback callback;

  const PaymentsTab({
    super.key,
    required this.callback,
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

  String getButtonName() => AppLocale.labels.createIncomeTooltip;

  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FullSizedButtonWidget(
      constraints: constraints,
      onPressed: () => nav.pushNamed(AppRoute.homeRoute),
      title: getButtonName(),
      icon: Icons.add_alert_sharp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
