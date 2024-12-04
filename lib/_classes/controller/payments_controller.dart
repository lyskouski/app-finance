// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:math';

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/payment_app_data.dart';
import 'package:app_finance/_configs/budget_type.dart';
import 'package:app_finance/_ext/data_ext.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:home_widget/home_widget.dart';

class PaymentsController {
  final AppData state;

  PaymentsController(this.state) {
    final data = state.getList(AppDataType.payments).cast();
    DateTime now = DateTime.now();
    for (PaymentAppData item in data) {
      item = item.clone();
      bool needUpdate = false;
      while (item.updatedAt.isBefore(now)) {
        needUpdate = true;
        dynamic obj = item.data.toDataObject(state);
        obj.createdAt = item.updatedAt;
        obj.updatedAt = item.updatedAt;
        obj.payment = item.uuid;
        state.add(obj);
        if (item.title == AppBudgetType.week.name) {
          item.updatedAt = item.updatedAt.add(const Duration(days: 7));
        } else if (item.title == AppBudgetType.year.name) {
          item.updatedAt = item.updatedAt.getNextYear();
        } else {
          item.updatedAt = item.updatedAt.getNextMonth();
        }
      }
      if (needUpdate) {
        state.update(item.uuid!, item);
      }
    }
    // TODO: create iOS Widget
    if (Platform.isAndroid) {
      //  updateWidget();
    }
  }

  Future<void> updateWidget() async {
    var data = 'TEST_DATA ${Random().nextInt(100)}';
    print(['updateWidget', data]);
    await HomeWidget.saveWidgetData<String>('payments_widget_data', data);
    await HomeWidget.updateWidget(
      name: 'PaymentsWidgetProvider',
      //  iOSName: 'PaymentsWidget',
    );
    if (Platform.isAndroid) {
      await HomeWidget.updateWidget(
        qualifiedAndroidName: 'com.tercad.fingrom.PaymentsWidgetService',
      );
    }
  }
}
