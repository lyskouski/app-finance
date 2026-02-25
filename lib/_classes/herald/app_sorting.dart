// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/design_type.dart';
import 'package:app_finance/_configs/sorting_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSorting extends ValueNotifier<AppSortingType> {
  AppSorting() : super(get());

  static AppSortingType get([String? newValue]) {
    final name = newValue ?? AppPreferences.get(AppPreferences.prefSortingKey);
    return AppSortingType.values.where((e) => e.name == name).firstOrNull ?? AppSortingType.updatedAtDesc;
  }

  Future<void> set(String? newValue, [Function? callback]) async {
    final change = get(newValue);
    if (newValue == null) {
      await AppPreferences.clear(AppPreferences.prefSortingKey);
    } else if (change != value) {
      value = change;
      await AppPreferences.set(AppPreferences.prefSortingKey, newValue);
      if (callback != null) {
        callback();
      }
    } else {
      return;
    }
    notifyListeners();
  }

  String getKey(BuildContext context) {
    String? sortingKey = AppPreferences.get(AppPreferences.prefSortingKey);
    final design = Provider.of<AppDesign>(context, listen: false);
    if (sortingKey == null) {
      if (design.value == AppDesignType.germany) {
        sortingKey = AppSortingType.titleAsc.name;
      } else {
        sortingKey = AppSortingType.updatedAtDesc.name;
      }
    }
    return sortingKey;
  }

  int Function(dynamic, dynamic) getSortFunction(BuildContext context) {
    final sortingKey = AppSortingType.values.where((e) => e.name == getKey(context)).firstOrNull;
    return (dynamic a, dynamic b) {
      switch (sortingKey) {
        case AppSortingType.amountDesc:
          return b.details.compareTo(a.details);
        case AppSortingType.amountAsc:
          return a.details.compareTo(b.details);
        case AppSortingType.createdAtDesc:
          return b.createdAt.compareTo(a.createdAt);
        case AppSortingType.createdAtAsc:
          return a.createdAt.compareTo(b.createdAt);
        case AppSortingType.titleAsc:
          return a.title.toString().compareTo(b.title.toString());
        case AppSortingType.titleDesc:
          return b.title.toString().compareTo(a.title.toString());
        case AppSortingType.updatedAtDesc:
          return b.updatedAt.compareTo(a.updatedAt);
        case AppSortingType.updatedAtAsc:
          return a.updatedAt.compareTo(b.updatedAt);
        default:
          return 0;
      }
    };
  }
}
