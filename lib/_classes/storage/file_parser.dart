// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:async';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/widgets/form/list_selector.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:intl/intl.dart';

typedef SearchFunction = Function(AppDataType type, String value);
typedef AddFunction = InterfaceAppData Function(InterfaceAppData item);

class FileParser {
  static const attrBillUuid = 'billUuid';
  static const attrAccountName = 'accountName';
  static const attrCategoryName = 'categoryName';
  static const attrBillAmount = 'billAmount';
  static const attrBillType = 'billType';
  static const attrBillDate = 'billDate';
  static const attrBillCurrency = 'billCurrency';
  static const attrBillComment = 'billComment';
  static const defDateFormat = 'dateFormat';

  List<String> columnMap;
  SearchFunction search;
  AddFunction add;

  String? _defaultCurrency;
  final _cache = <AppDataType, Map<String, String?>>{};

  FileParser({
    required this.search,
    required this.add,
    this.columnMap = const [],
  });

  static List<ListSelectorItem> getMappingTypes() {
    final account = AppLocale.labels.account;
    final budget = AppLocale.labels.budget;
    final bill = AppLocale.labels.bill;
    final mapping = [
      ListSelectorItem(id: '', name: '-- ${AppLocale.labels.ignoreTooltip} --'),
      ListSelectorItem(id: attrAccountName, name: '$account: ${AppLocale.labels.title}'),
      ListSelectorItem(id: attrCategoryName, name: '$budget: ${AppLocale.labels.title}'),
      ListSelectorItem(id: attrBillAmount, name: '$bill: ${AppLocale.labels.expense}'),
      ListSelectorItem(id: attrBillType, name: '$bill: ${AppLocale.labels.flowTypeTooltip}'),
      ListSelectorItem(id: attrBillDate, name: '$bill: ${AppLocale.labels.expenseDateTime}'),
      ListSelectorItem(id: attrBillCurrency, name: '$bill: ${AppLocale.labels.currency}'),
      ListSelectorItem(id: attrBillComment, name: '$bill: ${AppLocale.labels.description}'),
      ListSelectorItem(id: attrBillUuid, name: '$bill: ${AppLocale.labels.uuid}'),
    ];
    mapping.sort((a, b) => a.name.compareTo(b.name));
    return mapping;
  }

  Future<InterfaceAppData> parseFileLine(List<dynamic> line, Map<String, dynamic> def) async {
    final defaultAccount = def[attrAccountName];
    final defaultBudget = def[attrCategoryName];
    final dateFormat = def[defDateFormat];
    _defaultCurrency = def[attrBillCurrency];

    dynamic amount = _get(line, attrBillAmount);
    if (amount is String) {
      amount = double.tryParse(amount);
    }
    dynamic newItem;
    dynamic account = await _find(AppDataType.accounts, line, _get(line, attrAccountName), defaultAccount);
    String? uuid = _get(line, attrBillUuid);
    String? dateValue = _get(line, attrBillDate);
    DateTime? date;
    if (dateValue != null) {
      try {
        date = DateFormat(dateFormat).parse(dateValue);
      } catch (e) {
        date = DateTime.parse(dateValue);
      }
    }
    if (_get(line, attrBillType) == AppLocale.labels.flowTypeInvoice) {
      newItem = InvoiceAppData(
        uuid: uuid,
        account: account,
        title: _get(line, attrBillComment).toString(),
        details: 0.0 + amount,
        createdAt: date,
        updatedAt: date,
        currency: _getCurrency(line, _defaultCurrency),
        hidden: false,
      );
    } else {
      newItem = BillAppData(
        uuid: uuid,
        account: account,
        category: await _find(AppDataType.budgets, line, _get(line, attrCategoryName), defaultBudget),
        title: _get(line, attrBillComment).toString(),
        details: 0.0 + amount,
        createdAt: date,
        updatedAt: date,
        currency: _getCurrency(line, _defaultCurrency),
        hidden: false,
      );
    }
    return newItem;
  }

  Future<String> _find(AppDataType type, List<dynamic> line, dynamic value, String? def) async {
    if (value == null) {
      return def ?? '';
    }
    String? uuid;
    if (_cache[type] == null) {
      _cache[type] = <String, String?>{};
    }
    if (_cache[type]?[value] != null) {
      uuid = _cache[type]?[value];
    } else {
      final item = search(type, value);
      uuid = item?.uuid;
      _cache[type]![value] = uuid ?? '';
    }
    return uuid ?? await _new(type, line, value);
  }

  Future<String> _new(AppDataType type, List<dynamic> line, dynamic value) async {
    InterfaceAppData newItem;
    if (type == AppDataType.accounts) {
      newItem = AccountAppData(
        title: value,
        type: AppAccountType.account.toString(),
        details: 0.0,
        currency: _getCurrency(line, _defaultCurrency),
        hidden: false,
      );
    } else {
      newItem = BudgetAppData(
        title: value,
        currency: _getCurrency(line, _defaultCurrency),
        hidden: false,
      );
    }
    newItem = add(newItem);
    _cache[type]![value] = newItem.uuid;
    return newItem.uuid!;
  }

  dynamic _get(List<dynamic> line, String type) {
    final index = columnMap.indexOf(type);
    return index >= 0 ? line[index] : null;
  }

  Currency? _getCurrency(List<dynamic> line, String? def) {
    return CurrencyProvider.findByCode(_get(line, attrBillCurrency) ?? def);
  }
}
