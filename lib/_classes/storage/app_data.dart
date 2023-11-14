// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';
import 'package:app_finance/_classes/controller/iterator_controller.dart';
import 'package:app_finance/_classes/herald/app_sync.dart';
import 'package:app_finance/_classes/math/goal_recalculation.dart';
import 'package:app_finance/_classes/math/invoice_recalculation.dart';
import 'package:app_finance/_classes/storage/history_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/math/bill_recalculation.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/math/budget_recalculation.dart';
import 'package:app_finance/_classes/structure/currency_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/structure/summary_app_data.dart';
import 'package:app_finance/_classes/math/total_recalculation.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_ext/iterable_ext.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum AppDataType {
  goals,
  bills,
  accounts,
  budgets,
  currencies,
  invoice,
}

typedef AppDataGetter = ({
  List<dynamic> list,
  double total,
  InterfaceIterator stream,
});

class AppData extends ChangeNotifier {
  final AppSync appSync;
  bool isLoading = false;
  final _hashTable = HashMap<String, dynamic>();
  final _data = <AppDataType, SummaryAppData>{};

  AppData(this.appSync) : super() {
    isLoading = true;
    for (var key in AppDataType.values) {
      _data[key] = SummaryAppData();
    }
    Exchange(store: this).getDefaultCurrency();
    TransactionLog.load(this).then((_) async => await restate()).then((_) => appSync.follow(AppData, _stream));
  }

  @override
  dispose() {
    super.dispose();
    appSync.unfollow(AppData);
  }

  void _stream(String value) {
    try {
      TransactionLog.add(this, value, true, true);
    } catch (e) {
      //...
    }
  }

  Future<void> flush() async {
    isLoading = true;
    _hashTable.clear();
    _data.updateAll((key, value) => SummaryAppData(total: 0, list: []));
    await TransactionLog.load(this);
    await restate();
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
      appSync.send(value.toStream());
    }
    _notify();
  }

  void _notify([_]) {
    if (!isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
    }
  }

  dynamic add(InterfaceAppData value, [String? uuid]) {
    value.uuid = uuid ?? const Uuid().v4();
    _update(null, value);
    return getByUuid(value.uuid!);
  }

  void update(String uuid, InterfaceAppData value, [bool createIfMissing = false]) {
    var initial = getByUuid(uuid, false);
    if (initial != null || createIfMissing) {
      _update(initial, value);
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

  void _update(InterfaceAppData? initial, InterfaceAppData change) {
    switch (change.getType()) {
      case AppDataType.accounts:
        _updateAccount(initial as AccountAppData?, change as AccountAppData);
        HistoryData.addLog(change.uuid, change, initial?.details ?? 0.0, change.details);
        break;
      case AppDataType.bills:
        (change as BillAppData).setState(this);
        _updateBill(initial as BillAppData?, change);
        break;
      case AppDataType.budgets:
        (change as BudgetAppData).setState(this);
        _updateBudget(initial as BudgetAppData?, change);
        HistoryData.addLog(change.uuid, change, initial?.amountLimit ?? 0.0, change.amountLimit);
        break;
      case AppDataType.goals:
        _updateGoal(initial as GoalAppData?, change as GoalAppData);
        break;
      case AppDataType.currencies:
        _updateCurrency(initial as CurrencyAppData?, change as CurrencyAppData);
        HistoryData.addLog(change.uuid, change, initial?.details ?? 0.0, change.details);
        break;
      case AppDataType.invoice:
        (change as InvoiceAppData).setState(this);
        _updateInvoice(initial as InvoiceAppData?, change);
        break;
    }
  }

  void _updateInvoice(InvoiceAppData? initial, InvoiceAppData change) {
    _set(AppDataType.invoice, change);
    AccountAppData? currAccount = getByUuid(change.account, false);
    AccountAppData? prevAccount;
    if (initial != null) {
      prevAccount = getByUuid(initial.account, false);
      if (prevAccount != null) {
        _data[AppDataType.accounts]?.add(initial.account);
      }
    }
    if (currAccount != null) {
      final rec = InvoiceRecalculation(change, initial)..exchange = Exchange(store: this);
      rec.updateAccount(currAccount, prevAccount);
      _data[AppDataType.accounts]?.add(change.account);
      if (change.accountFrom != null) {
        rec.updateAccount(getByUuid(change.accountFrom!, false),
            initial != null && initial.accountFrom != null ? getByUuid(initial.accountFrom!, false) : null, true);
        _data[AppDataType.accounts]?.add(change.accountFrom!);
      }
    }
    if (!isLoading) {
      updateTotals([AppDataType.accounts]).then(_notify);
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

  AppDataGetter get(AppDataType property) {
    return (
      list: getList(property),
      total: getTotal(property),
      stream: getStream<InterfaceAppData>(property),
    );
  }

  List<dynamic> getList(AppDataType property, [bool isClone = true]) {
    return (_data[property]?.list ?? [])
        .map((uuid) => getByUuid(uuid, isClone))
        .where((element) => !element.hidden)
        .toList();
  }

  InterfaceIterator getStream<M extends InterfaceAppData>(AppDataType property,
          {bool inverse = true, double? boundary, Function? filter}) =>
      _data[property]!.origin.toStream<M>(
            inverse,
            transform: getByUuid,
            boundary: boundary,
            filter: (M v) => v.hidden || filter?.call(v) == true,
          );

  List<dynamic> getActualList(AppDataType property, [bool isClone = true]) {
    return (_data[property]?.listActual ?? [])
        .map((uuid) => getByUuid(uuid, isClone))
        .where((element) => !element.hidden)
        .toList();
  }

  double getTotal(AppDataType property) {
    return _data[property]?.total ?? 0.0;
  }

  dynamic getByUuid(String uuid, [bool isClone = true]) {
    if (uuid == '') return null;
    var obj = isClone ? _hashTable[uuid]?.clone() : _hashTable[uuid];
    if (obj is BillAppData || obj is BudgetAppData || obj is InvoiceAppData) {
      obj.setState(this);
    }
    return obj;
  }
}
