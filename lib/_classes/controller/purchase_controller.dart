// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';

class PurchaseController {
  static const pCoffee = 'fin_consumable_coffee';
  static const pDinner = 'fin_consumable_dinner';
  static const pSubApple = 'fin_subscription_tiny';
  static const pSubGoogle = 'fin-subscription-tiny';

  static InAppPurchase iap = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  Function? callback;

  PurchaseController([this.callback]) {
    final purchaseUpdated = iap.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _onUpdate,
      onDone: dispose,
      onError: _onError,
    );
  }

  dispose() {
    _subscription.cancel();
  }

  void _onError(dynamic error) {
    // ... trace error
  }

  Future<void> _onUpdate(List<PurchaseDetails> purchaseDetailsList) async {
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.pendingCompletePurchase) {
        await iap.completePurchase(purchaseDetails);
      }
    }
    if (callback != null) {
      callback!(purchaseDetailsList);
    }
  }

  Future<List<ProductDetails>> load() async {
    final available = await iap.isAvailable();
    if (!available) {
      return [];
    }
    final response = await iap.queryProductDetails(<String>{
      pCoffee,
      pDinner,
      pSubApple,
      pSubGoogle,
    });
    return response.productDetails;
  }

  static Future<void> buy(ProductDetails product) async {
    final purchaseParam = PurchaseParam(productDetails: product);
    if (product.id.contains('subscription')) {
      await iap.buyNonConsumable(purchaseParam: purchaseParam);
    } else {
      await iap.buyConsumable(purchaseParam: purchaseParam);
    }
  }
}
