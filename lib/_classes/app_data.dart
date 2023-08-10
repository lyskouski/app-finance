// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/data/bill_app_data.dart';
import 'package:app_finance/_classes/data/bill_recalculation.dart';
import 'package:app_finance/_classes/data/budget_app_data.dart';
import 'package:app_finance/_classes/data/budget_recalculation.dart';
import 'package:app_finance/_classes/data/currency_app_data.dart';
import 'package:app_finance/_classes/data/exchange.dart';
import 'package:app_finance/_classes/data/goal_app_data.dart';
import 'package:app_finance/_classes/data/goal_recalculation.dart';
import 'package:app_finance/_classes/data/summary_app_data.dart';
import 'package:app_finance/_classes/data/total_recalculation.dart';
import 'package:app_finance/_classes/data/transaction_log.dart';
import 'package:app_finance/_classes/data/transaction_log_data.dart';
import 'package:currency_picker/currency_picker.dart';
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
  bool isLoading = false;

  final _account = {
    AppAccountType.account: (),
    AppAccountType.cash: (),
    AppAccountType.debitCard: (),
    AppAccountType.creditCard: (),
    AppAccountType.deposit: (),
    AppAccountType.credit: (),
  };

  final _hashTable = HashMap<String, dynamic>();

  final _history = HashMap<String, List<TransactionLogData>>();

  final _data = {
    AppDataType.goals: SummaryAppData(total: 0, list: []),
    AppDataType.bills: SummaryAppData(total: 0, list: []),
    AppDataType.accounts: SummaryAppData(total: 0, list: []),
    AppDataType.budgets: SummaryAppData(total: 0, list: []),
    AppDataType.currencies: SummaryAppData(total: 0, list: [])
  };

  AppData() : super() {
    isLoading = true;
    Exchange(store: this).getDefaultCurrency();
    TransactionLog.load(this).then((_) async => await restate());
  }

  Future<void> restate() async {
    await updateTotals(AppDataType.values);
    isLoading = false;
    notifyListeners();
  }

  void _set(AppDataType property, dynamic value) {
    _hashTable[value.uuid] = value;
    _data[property]?.add(value.uuid, updatedAt: value.createdAt);
    if (!isLoading) {
      TransactionLog.save(value);
    }
    _notify(null);
  }

  void _notify(dynamic value) {
    if (!isLoading) {
      notifyListeners();
    }
  }

  dynamic add(AppDataType property, dynamic value) {
    value.uuid = const Uuid().v4();
    _update(property, null, value);
    return getByUuid(value.uuid);
  }

  void addLog(uuid, dynamic initial, dynamic initialValue, dynamic value, [String? ref]) {
    if (_history[uuid] == null) {
      _history[uuid] = [];
    }
    if (initialValue != value) {
      _history[uuid]!.add(TransactionLogData(
        timestamp: value.updatedAt,
        ref: ref,
        currency: initial.currency,
        name: 'details',
        changedFrom: initialValue,
        changedTo: value,
      ));
    }
  }

  void update(AppDataType property, String uuid, dynamic value, [bool createIfMissing = false]) {
    var initial = getByUuid(uuid, false);
    if (initial != null) {
      addLog(uuid, value, initial.details, value.details);
    }
    if (initial != null || createIfMissing) {
      _update(property, initial, value);
    }
  }

  Future<void> updateTotals(List<AppDataType> scope) async {
    final accountTotal = getTotal(AppDataType.accounts);
    final exchange = Exchange(store: this);
    final rec = TotalRecalculation(exchange: exchange);
    for (AppDataType type in scope) {
      await rec.updateTotal(type, _data[type], _hashTable);
    }
    if (scope.contains(AppDataType.accounts)) {
      rec.updateGoals(getList(AppDataType.goals, false), accountTotal, getTotal(AppDataType.accounts));
    }
  }

  void _update(AppDataType property, dynamic initial, dynamic change) {
    switch (property) {
      case AppDataType.accounts:
        _updateAccount(initial, change);
        break;
      case AppDataType.bills:
        _updateBill(initial, change);
        break;
      case AppDataType.budgets:
        _updateBudget(initial, change);
        break;
      case AppDataType.goals:
        _updateGoal(initial, change);
        break;
      case AppDataType.currencies:
        _updateCurrency(initial, change);
        break;
    }
  }

  void _updateAccount(AccountAppData? initial, AccountAppData change) {
    _set(AppDataType.accounts, change);
    if (!isLoading) {
      updateTotals([AppDataType.accounts]).then(_notify);
    }
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
    final rec = BillRecalculation(change: change, initial: initial)..exchange = Exchange(store: this);
    if (currAccount != null) {
      rec.updateAccount(currAccount, prevAccount);
      _data[AppDataType.accounts]?.add(change.account);
    }
    if (currBudget != null) {
      rec.updateBudget(currBudget, prevBudget);
      // addLog(currBudget.uuid, change, 0.0, change.details, change.uuid);
      _data[AppDataType.budgets]?.add(change.category);
    }
    _set(AppDataType.bills, change);
    if (!isLoading) {
      updateTotals([AppDataType.bills, AppDataType.accounts, AppDataType.budgets]).then(_notify);
    }
  }

  void _updateBudget(BudgetAppData? initial, BudgetAppData change) {
    BudgetRecalculation(change: change, initial: initial)
      ..exchange = Exchange(store: this)
      ..updateBudget();
    _set(AppDataType.budgets, change);
    if (!isLoading) {
      updateTotals([AppDataType.budgets]).then(_notify);
    }
  }

  void _updateGoal(GoalAppData? initial, GoalAppData change) {
    GoalRecalculation(change: change, initial: initial)
      ..exchange = Exchange(store: this)
      ..updateGoal();
    _set(AppDataType.goals, change);
    if (!isLoading) {
      updateTotals([AppDataType.goals]).then(_notify);
    }
  }

  void _updateCurrency(CurrencyAppData? initial, CurrencyAppData change) {
    _set(AppDataType.currencies, change);
    if (!isLoading) {
      updateTotals(AppDataType.values).then(_notify);
    }
  }

  dynamic get(AppDataType property) {
    return (
      list: getList(property),
      total: getTotal(property),
    );
  }

  List<dynamic> getList(AppDataType property, [bool isClone = true]) {
    return (_data[property]?.list ?? [])
        .map((uuid) => getByUuid(uuid, isClone))
        .where((element) => !element.hidden)
        .toList();
  }

  double getTotal(AppDataType property) {
    return _data[property]?.total ?? 0.0;
  }

  dynamic getByUuid(String uuid, [bool isClone = true]) {
    var obj = isClone ? _hashTable[uuid]?.clone() : _hashTable[uuid];
    obj?.setState(this);
    return obj;
  }

  dynamic getType(AppAccountType property) {
    return _account[property];
  }

  List<TransactionLogData>? getLog(String uuid) {
    return _history[uuid]?.reversed.toList();
  }
}
