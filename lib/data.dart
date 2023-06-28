// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:collection';

import 'package:app_finance/classes/account_app_data.dart';
import 'package:app_finance/classes/bill_app_data.dart';
import 'package:app_finance/classes/budget_app_data.dart';
import 'package:app_finance/classes/goal_app_data.dart';
import 'package:app_finance/classes/summary_app_data.dart';
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

  final _hashTable = HashMap<String, dynamic>.from({
    'xxxxxxxx-xxxx-0xxx-yxxx-xxxxxxxxxxxx': GoalAppData(
      uuid: 'xxxxxxxx-xxxx-0xxx-yxxx-xxxxxxxxxxxx',
      title: 'Implement new functionality to reach the goal of MVP',
      details: 12345789.098,
      progress: 0.3,
      createdAtFormatted: '2022-01-01 00:00',
      closedAtFormatted: '2024-09-01 00:00',
    ),
    'xxxxxxxx-xxxx-01xx-yxxx-xxxxxxxxxxxx': BillAppData(
      uuid: 'xxxxxxxx-xxxx-01xx-yxxx-xxxxxxxxxxxx',
      account: 'xxxxxxxx-xxxx-1xxx-yxxx-xxxxxxxxxxxx',
      category: 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx',
      title: 'Description BILLS with a long explanation',
      createdAtFormatted: '2023-06-17',
      details: 12345789.098,
      hidden: false,
    ),
    'xxxxxxxx-xxxx-02xx-yxxx-xxxxxxxxxxxx': BillAppData(
      uuid: 'xxxxxxxx-xxxx-02xx-yxxx-xxxxxxxxxxxx',
      account: '',
      category: '',
      title: 'Description BILLS 2',
      createdAtFormatted: '2023-06-16 22:10',
      details: 1234.789,
      hidden: false,
    ),
    'xxxxxxxx-xxxx-03xx-yxxx-xxxxxxxxxxxx': BillAppData(
      uuid: 'xxxxxxxx-xxxx-03xx-yxxx-xxxxxxxxxxxx',
      account: '',
      category: '',
      title: 'Description BILLS 3',
      createdAtFormatted: '2023-06-15',
      details: 123.789,
      hidden: false,
    ),
    'xxxxxxxx-xxxx-1xxx-yxxx-xxxxxxxxxxxx': AccountAppData(
      uuid: 'xxxxxxxx-xxxx-1xxx-yxxx-xxxxxxxxxxxx',
      title: 'Description of Account with a long explanation',
      type: AppAccountType.account.toString(),
      description: '****1234',
      details: 12345789.098,
      progress: 0.5,
      color: Colors.red,
      hidden: false,
    ),
    'xxxxxxxx-xxxx-2xxx-yxxx-xxxxxxxxxxxx': AccountAppData(
      uuid: 'xxxxxxxx-xxxx-2xxx-yxxx-xxxxxxxxxxxx',
      title: 'MasterCard',
      type: AppAccountType.debitCard.toString(),
      description: '*****5432',
      details: 1234.789,
      progress: 0.8,
      color: Colors.green,
      hidden: false,
    ),
    'xxxxxxxx-xxxx-3xxx-yxxx-xxxxxxxxxxxx': AccountAppData(
      uuid: 'xxxxxxxx-xxxx-3xxx-yxxx-xxxxxxxxxxxx',
      title: 'Visa Credit Card',
      type: AppAccountType.creditCard.toString(),
      description: '****3224',
      details: 123.789,
      progress: 1.0,
      color: Colors.yellow,
      hidden: false,
    ),
    'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx': BudgetAppData(
      uuid: 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx',
      title: 'Description budgets with a long explanation',
      details: 12345789.098,
      progress: 0.5,
      color: Colors.red,
      hidden: false,
    ),
    'xxxxxxxx-xxxx-5xxx-yxxx-xxxxxxxxxxxx': BudgetAppData(
      uuid: 'xxxxxxxx-xxxx-5xxx-yxxx-xxxxxxxxxxxx',
      title: 'Description budgets 2',
      details: 1234.789,
      progress: 0.8,
      color: Colors.green,
      hidden: false,
    ),
    'xxxxxxxx-xxxx-6xxx-yxxx-xxxxxxxxxxxx': BudgetAppData(
      uuid: 'xxxxxxxx-xxxx-6xxx-yxxx-xxxxxxxxxxxx',
      title: 'Description budgets 3',
      details: 123.789,
      progress: 1.5,
      color: Colors.yellow,
      hidden: false,
    ),
  });

  final _data = {
    AppDataType.goals: SummaryAppData(
      total: 123.45,
      list: [
        'xxxxxxxx-xxxx-0xxx-yxxx-xxxxxxxxxxxx',
      ],
    ),
    AppDataType.bills: SummaryAppData(total: 123456.789, list: [
      'xxxxxxxx-xxxx-01xx-yxxx-xxxxxxxxxxxx',
      'xxxxxxxx-xxxx-02xx-yxxx-xxxxxxxxxxxx',
      'xxxxxxxx-xxxx-03xx-yxxx-xxxxxxxxxxxx',
    ]),
    AppDataType.accounts: SummaryAppData(
      total: 123456.789,
      list: [
        'xxxxxxxx-xxxx-1xxx-yxxx-xxxxxxxxxxxx',
        'xxxxxxxx-xxxx-2xxx-yxxx-xxxxxxxxxxxx',
        'xxxxxxxx-xxxx-3xxx-yxxx-xxxxxxxxxxxx',
      ],
    ),
    AppDataType.budgets: SummaryAppData(
      total: 123456.789,
      list: [
        'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx',
        'xxxxxxxx-xxxx-5xxx-yxxx-xxxxxxxxxxxx',
        'xxxxxxxx-xxxx-6xxx-yxxx-xxxxxxxxxxxx',
      ],
    ),
  };

  void _set(AppDataType property, dynamic value) {
    _hashTable[value.uuid] = value;
    _data[property]?.add(value.uuid);
    notifyListeners();
  }

  void add(AppDataType property, dynamic value) {
    value.uuid = const Uuid().v4();
    switch (property) {
      case AppDataType.accounts:
        return _updateAccount(null, value);
      case AppDataType.bills:
        return _updateBill(null, value);
      case AppDataType.budgets:
        return _updateBudget(null, value);
      case AppDataType.goals:
        return _updateGoal(null, value);
    }
  }

  void update(AppDataType property, String uuid, dynamic value) {
    if (_hashTable[uuid] != null) {
      var data = getByUuid(uuid, false);
      switch (property) {
        case AppDataType.accounts:
          return _updateAccount(data, value);
        case AppDataType.bills:
          return _updateBill(data, value);
        case AppDataType.budgets:
          return _updateBudget(data, value);
        case AppDataType.goals:
          return _updateGoal(data, value);
      }
    }
  }

  void _updateAccount(AccountAppData? initial, AccountAppData change) {
    if (initial != null) {
      var goalList = getList(AppDataType.goals, false)
          .where((dynamic goal) => goal.progress < 1.0);
      if (goalList.isNotEmpty) {
        double delta = (change.details - initial.details) / goalList.length;
        int index = 0;
        goalList.forEach((dynamic goal) {
          index++;
          double progress = _getProgress(goal.details, goal.progress, delta);
          if (progress > 1.0) {
            if (index < goalList.length) {
              delta += goal.details * (progress - 1.0) / (goalList.length - index);
            }
            progress = 1.0;
          }
          goal.progress = progress;
        });
      }
    }
    _set(AppDataType.accounts, change);
  }

  void _updateBill(BillAppData? initial, BillAppData change) {
    AccountAppData currAccount = getByUuid(change.account, false);
    BudgetAppData currBudget = getByUuid(change.category, false);
    if (initial != null) {
      AccountAppData prevAccount = getByUuid(initial.account, false);
      BudgetAppData prevBudget = getByUuid(initial.category, false);
      if (currAccount.uuid != prevAccount.uuid) {
        prevAccount.details += initial.details;
        prevBudget.progress = _getProgress(
            prevBudget.amountLimit, prevBudget.progress, -initial.details);
        currAccount.details -= change.details;
        currBudget.progress = _getProgress(
            currBudget.amountLimit, currBudget.progress, change.details);
        _data[AppDataType.budgets]?.add(initial.category);
        _data[AppDataType.accounts]?.add(initial.account);
      } else {
        double delta = change.details - initial.details;
        currAccount.details -= delta;
        currBudget.progress =
            _getProgress(currBudget.amountLimit, currBudget.progress, delta);
      }
    } else {
      currAccount.details -= change.details;
      currBudget.progress = _getProgress(
          currBudget.amountLimit, currBudget.progress, change.details);
    }
    _data[AppDataType.budgets]?.add(change.category);
    _data[AppDataType.accounts]?.add(change.account);
    _set(AppDataType.bills, change);
  }

  void _updateBudget(BudgetAppData? initial, BudgetAppData change) {
    if (initial != null && change.amountLimit > 0) {
      change.progress =
          (change.amountLimit - initial.amountLimit * initial.progress) /
              change.amountLimit;
    } else {
      change.progress = 0.0;
    }
    _set(AppDataType.budgets, change);
  }

  double _getProgress(double amount, double progress, double delta) {
    if (amount > 0) {
      progress = (amount * progress + delta) / amount;
    } else {
      progress = 0.0;
    }
    return progress;
  }

  void _updateGoal(GoalAppData? initial, GoalAppData change) {
    _set(AppDataType.goals, change);
  }

  dynamic get(AppDataType property) {
    return (
      list: getList(property),
      total: getTotal(property),
    );
  }

  List<dynamic> getList(AppDataType property, [bool isClone = true]) {
    SummaryAppData(total: 1, list: ['test']);
    return (_data[property]?.list ?? [])
        .map((uuid) => getByUuid(uuid, isClone).setState(this))
        .toList();
  }

  double getTotal(AppDataType property) {
    return _data[property]?.total ?? 0.0;
  }

  dynamic getByUuid(String uuid, [bool isClone = true]) {
    return isClone ? _hashTable[uuid]?.clone() : _hashTable[uuid];
  }

  dynamic getType(AppAccountType property) {
    return _account[property];
  }
}
