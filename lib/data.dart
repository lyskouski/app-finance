// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/data/account_recalculation.dart';
import 'package:app_finance/_classes/data/bill_app_data.dart';
import 'package:app_finance/_classes/data/bill_recalculation.dart';
import 'package:app_finance/_classes/data/budget_app_data.dart';
import 'package:app_finance/_classes/data/budget_recalculation.dart';
import 'package:app_finance/_classes/data/currency_app_data.dart';
import 'package:app_finance/_classes/data/goal_app_data.dart';
import 'package:app_finance/_classes/data/goal_recalculation.dart';
import 'package:app_finance/_classes/data/summary_app_data.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum AppDataType {
  goals,
  bills,
  accounts,
  budgets,
  currencies,
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
    'xxxxxxxx-xxx0-1xxx-yxxx-xxxxxxxxxxxx': GoalAppData(
      uuid: 'xxxxxxxx-xxx0-1xxx-yxxx-xxxxxxxxxxxx',
      title: 'Publish the book',
      details: 12349.098,
      progress: 0.6,
      createdAtFormatted: '2023-01-01 00:00',
      closedAtFormatted: '2023-12-01 00:00',
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
      amountLimit: 12345789.098,
      progress: 0.5,
      color: Colors.red,
      hidden: false,
    ),
    'xxxxxxxx-xxxx-5xxx-yxxx-xxxxxxxxxxxx': BudgetAppData(
      uuid: 'xxxxxxxx-xxxx-5xxx-yxxx-xxxxxxxxxxxx',
      title: 'Description budgets 2',
      amountLimit: 1234.789,
      progress: 0.8,
      color: Colors.green,
      hidden: false,
    ),
    'xxxxxxxx-xxxx-6xxx-yxxx-xxxxxxxxxxxx': BudgetAppData(
      uuid: 'xxxxxxxx-xxxx-6xxx-yxxx-xxxxxxxxxxxx',
      title: 'Description budgets 3',
      amountLimit: 123.789,
      progress: 1.5,
      color: Colors.yellow,
      hidden: false,
    ),
  });

  final _data = {
    AppDataType.goals: SummaryAppData(
      total: 123.45,
      list: [
        'xxxxxxxx-xxx0-1xxx-yxxx-xxxxxxxxxxxx',
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
    AppDataType.currencies: SummaryAppData(
      total: 0,
      list: [],
    )
  };

  void _set(AppDataType property, dynamic value) {
    _hashTable[value.uuid] = value;
    _data[property]?.add(value.uuid);
    notifyListeners();
  }

  dynamic add(AppDataType property, dynamic value) {
    value.uuid = const Uuid().v4();
    _update(property, null, value);
    return getByUuid(value.uuid);
  }

  void update(AppDataType property, String uuid, dynamic value) {
    var initial = getByUuid(uuid, false);
    if (initial != null) {
      _update(property, initial, value);
    }
  }

  void _update(AppDataType property, dynamic initial, dynamic change) {
    switch (property) {
      case AppDataType.accounts:
        return _updateAccount(initial, change);
      case AppDataType.bills:
        return _updateBill(initial, change);
      case AppDataType.budgets:
        return _updateBudget(initial, change);
      case AppDataType.goals:
        return _updateGoal(initial, change);
      case AppDataType.currencies:
        return _updateCurrency(initial, change);
    }
  }

  void _updateAccount(AccountAppData? initial, AccountAppData change) {
    var calc = AccountRecalculation(change: change, initial: initial)
        .updateTotal(_data[AppDataType.accounts], _hashTable);
    if (initial != null) {
      var goalList = getList(AppDataType.goals, false)
          .where((dynamic goal) => goal.progress < 1.0);
      calc.updateGoals(goalList);
    }
    _set(AppDataType.accounts, change);
  }

  void _updateBill(BillAppData? initial, BillAppData change) {
    AccountAppData? currAccount = getByUuid(change.account, false);
    AccountAppData? prevAccount;
    BudgetAppData? currBudget = getByUuid(change.category, false);
    BudgetAppData? prevBudget;
    if (initial != null) {
      prevAccount = getByUuid(initial.account, false);
      if (prevAccount != null) {
        _data[AppDataType.accounts]?.add(initial.account);
      }
      prevBudget = getByUuid(initial.category, false);
      if (prevBudget != null) {
        _data[AppDataType.budgets]?.add(initial.category);
      }
    }
    final rec = BillRecalculation(change: change, initial: initial)
        .updateTotal(_data[AppDataType.bills], _hashTable);
    if (currAccount != null) {
      rec.updateAccounts(currAccount, prevAccount);
      _data[AppDataType.accounts]?.add(change.account);
    }
    if (currBudget != null) {
      rec.updateBudget(currBudget, prevBudget);
      _data[AppDataType.budgets]?.add(change.category);
    }
    _set(AppDataType.bills, change);
  }

  void _updateBudget(BudgetAppData? initial, BudgetAppData change) {
    BudgetRecalculation(change: change, initial: initial)
        .updateBudget()
        .updateTotal(_data[AppDataType.budgets], _hashTable);
    _set(AppDataType.budgets, change);
  }

  void _updateGoal(GoalAppData? initial, GoalAppData change) {
    GoalRecalculation(change: change, initial: initial)
        .updateGoal()
        .updateTotal(_data[AppDataType.goals], _hashTable);
    _set(AppDataType.goals, change);
  }

  void _updateCurrency(CurrencyAppData? initial, CurrencyAppData change) {
    _set(AppDataType.currencies, change);
    // TBD: Update totals for Budget and Account
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
        .where((element) => !element.hidden)
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
