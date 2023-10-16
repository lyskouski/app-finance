// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/purchase_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class AppPurchase extends ChangeNotifier {
  late PurchaseController controller = PurchaseController(_update);
  Map<String, ProductDetails> product = {};
  Map<String, List<PurchaseDetails>> purchase = {};

  AppPurchase() {
    if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
      _load();
    }
  }

  Future<void> _load() async {
    for (var item in await controller.load()) {
      product[item.id] = item;
    }
    notifyListeners();
  }

  void _update(List<PurchaseDetails> scope) {
    for (var item in scope) {
      if (!product.containsKey(item.productID)) {
        purchase[item.productID] = <PurchaseDetails>[];
      }
      purchase[item.productID]!.add(item);
    }
    notifyListeners();
  }
}
