// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/design/form/list_selector_item.dart';

enum AppBudgetType { week, month, year }

class BudgetType {
  static List<ListSelectorItem> getList() {
    return [
      ListSelectorItem(id: AppBudgetType.week.name, name: AppLocale.labels.budgetTypeWeek),
      ListSelectorItem(id: AppBudgetType.month.name, name: AppLocale.labels.budgetTypeMonth),
      ListSelectorItem(id: AppBudgetType.year.name, name: AppLocale.labels.budgetTypeYear),
    ];
  }

  static String getLabel(String id) => getList().firstWhere((e) => e.id == id).name;

  static bool contains(String id, List<AppBudgetType> type) => type.map((e) => e.toString()).contains(id);
}
