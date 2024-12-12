// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/structure/payment_app_data.dart';
import 'package:app_finance/_configs/budget_type.dart';
import 'package:app_finance/_ext/data_ext.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:flutter/foundation.dart';
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
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        _updateWidget();
      }
    }
  }

  String _prepareData() {
    List<Map<String, String>> result = [];
    List<PaymentAppData> data = state.getList(AppDataType.payments).cast();
    data.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));
    for (PaymentAppData item in data) {
      dynamic obj = item.data.toDataObject(state);
      String type = AppLocale.labels.flowTypeInvoice;
      String symbol = '+';
      if (obj is BillAppData) {
        type = AppLocale.labels.bill;
        symbol = '-';
      } else if (obj is InvoiceAppData && obj.accountFrom != null) {
        type = AppLocale.labels.transferHeadline;
        symbol = '';
      }
      result.add({
        '"title"': '"$type: ${obj.title.replaceAll('"', "'")}"',
        '"description"': '"${item.description.replaceAll('"', "'")}, ${item.updatedAt.monthDay()}"',
        '"details"': '"$symbol${obj.detailsFormatted}"',
      });
    }
    return result.toString();
  }

  Future<void> _updateWidget() async {
    await HomeWidget.saveWidgetData<String>('payments_widget_data', _prepareData());
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
