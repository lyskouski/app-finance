// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/purchase_controller.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_purchase.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/subscription/widgets/purchase_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleWidget extends StatelessWidget {
  const GoogleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final indent = ThemeHelper.getIndent(2);
    final purchases = context.watch<AppPurchase>();

    return Wrap(
      spacing: indent,
      runSpacing: indent,
      children: [
        PurchaseWidget(
          'assets/images/coffee.png',
          title: AppLocale.labels.subscriptionCoffee,
          product: purchases.product[PurchaseController.pCoffee],
          purchase: purchases.purchase[PurchaseController.pCoffee],
        ),
        PurchaseWidget(
          'assets/images/dinner.png',
          title: AppLocale.labels.subscriptionDinner,
          product: purchases.product[PurchaseController.pDinner],
          purchase: purchases.purchase[PurchaseController.pDinner],
        ),
        PurchaseWidget(
          'assets/images/sub_tiny.png',
          title: AppLocale.labels.subscriptionTiny,
          product: purchases.product[PurchaseController.pInitial],
          purchase: purchases.purchase[PurchaseController.pInitial],
        ),
      ],
    );
  }
}
