// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/classes/abstract_app_data.dart';
import 'package:app_finance/classes/account_app_data.dart';
import 'package:app_finance/classes/bill_app_data.dart';
import 'package:app_finance/classes/budget_app_data.dart';
import 'package:app_finance/classes/goal_app_data.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum AppDataType {
  goals,
  bills,
  accounts,
  budgets,
}

enum AppAccountType {
  account,
  cash,
  debitCard,
  creditCard,
  deposit,
  credit,
}

class AppData extends ChangeNotifier {
  final _account = {
    AppAccountType.account: (),
    AppAccountType.cash: (),
    AppAccountType.debitCard: (),
    AppAccountType.creditCard: (),
    AppAccountType.deposit: (),
    AppAccountType.credit: (),
  };

  final _data = {
    AppDataType.goals: {
      'total': 123.45,
      'list': [
        GoalAppData(
          uuid: 'xxxxxxxx-xxxx-0xxx-yxxx-xxxxxxxxxxxx',
          title: 'Implement new functionality to reach the goal of MVP',
          details: 12345789.098,
          progress: 0.3,
          createdAtFormatted: '2022-01-01 00:00',
          closedAtFormatted: '2024-09-01 00:00',
        ),
      ]
    },
    AppDataType.bills: {
      'total': 123456.789,
      'list': [
        BillAppData(
          account: 'xxxxxxxx-xxxx-1xxx-yxxx-xxxxxxxxxxxx',
          category: 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx',
          uuid: 'xxxxxxxx-xxxx-01xx-yxxx-xxxxxxxxxxxx',
          title: 'Description BILLS with a long explanation',
          createdAtFormatted: '2023-06-17',
          details: 12345789.098,
          hidden: false,
        ),
        BillAppData(
          account: '',
          category: '',
          uuid: 'xxxxxxxx-xxxx-02xx-yxxx-xxxxxxxxxxxx',
          title: 'Description BILLS 2',
          createdAtFormatted: '2023-06-16 22:10',
          details: 1234.789,
          hidden: false,
        ),
        BillAppData(
          account: '',
          category: '',
          uuid: 'xxxxxxxx-xxxx-03xx-yxxx-xxxxxxxxxxxx',
          title: 'Description BILLS 3',
          createdAtFormatted: '2023-06-15',
          details: 123.789,
          hidden: false,
        ),
      ]
    },
    AppDataType.accounts: {
      'total': 123456.789,
      'list': [
        AccountAppData(
          uuid: 'xxxxxxxx-xxxx-1xxx-yxxx-xxxxxxxxxxxx',
          title: 'Description of Account with a long explanation',
          type: AppAccountType.account.toString(),
          description: '****1234',
          details: 12345789.098,
          progress: 0.5,
          color: Colors.red,
          hidden: false,
        ),
        AccountAppData(
          uuid: 'xxxxxxxx-xxxx-2xxx-yxxx-xxxxxxxxxxxx',
          title: 'MasterCard',
          type: AppAccountType.debitCard.toString(),
          description: '*****5432',
          details: 1234.789,
          progress: 0.8,
          color: Colors.green,
          hidden: false,
        ),
        AccountAppData(
          uuid: 'xxxxxxxx-xxxx-3xxx-yxxx-xxxxxxxxxxxx',
          title: 'Visa Credit Card',
          type: AppAccountType.creditCard.toString(),
          description: '****3224',
          details: 123.789,
          progress: 1.0,
          color: Colors.yellow,
          hidden: false,
        ),
      ],
    },
    AppDataType.budgets: {
      'total': 123456.789,
      'list': [
        BudgetAppData(
          uuid: 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx',
          title: 'Description budgets with a long explanation',
          details: 12345789.098,
          progress: 0.5,
          color: Colors.red,
          hidden: false,
        ),
        BudgetAppData(
          uuid: 'xxxxxxxx-xxxx-5xxx-yxxx-xxxxxxxxxxxx',
          title: 'Description budgets 2',
          details: 1234.789,
          progress: 0.8,
          color: Colors.green,
          hidden: false,
        ),
        BudgetAppData(
          uuid: 'xxxxxxxx-xxxx-6xxx-yxxx-xxxxxxxxxxxx',
          title: 'Description budgets 3',
          details: 123.789,
          progress: 1.5,
          color: Colors.yellow,
          hidden: false,
        ),
      ],
    },
  };

  void set(AppDataType property, dynamic value) {
    _data[property] = value;
    notifyListeners();
  }

  void add(AppDataType property, dynamic value) {
    var data = (_data[property] as Map);
    value.uuid = const Uuid().v4();
    data['list'].insert(0, value);
    set(property, data);
  }

  void update(AppDataType property, String uuid, dynamic value) {
    var data = (_data[property] as Map);
    final index = data['list'].indexWhere((item) => item.uuid == uuid);
    if (index != -1) {
      data['list'][index] = value;
      set(property, data);
    }
  }

  dynamic get(AppDataType property) {
    var data = (_data[property] as Map);
    return (
      total: data['total'],
      list: data['list'].map((e) => e.setState(this)).toList(),
    );
  }

  double getTotal(AppDataType property) {
    return (_data[property] as Map)['total'];
  }

  dynamic getByUuid(AppDataType property, String uuid) {
    var scope = (_data[property] as Map)['list'];
    return scope.cast<dynamic>().firstWhere(
          (item) => item.uuid == uuid,
          orElse: () => null,
        );
  }

  dynamic getType(AppAccountType property) {
    return _account[property];
  }
}
