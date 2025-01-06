// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/design/form/list_selector_item.dart';

enum AppAutomationType { week, month, year, days }

class AutomationType {
  static List<ListSelectorItem> getList() {
    return [
      ListSelectorItem(id: AppAutomationType.week.name, name: AppLocale.labels.budgetTypeWeek),
      ListSelectorItem(id: AppAutomationType.month.name, name: AppLocale.labels.budgetTypeMonth),
      ListSelectorItem(id: AppAutomationType.year.name, name: AppLocale.labels.budgetTypeYear),
      ListSelectorItem(id: AppAutomationType.days.name, name: AppLocale.labels.automationTypeDays),
    ];
  }

  static String getLabel(String id) => getList().firstWhere((e) => e.id == id).name;

  static bool contains(String id, List<AppAutomationType> type) => type.map((e) => e.toString()).contains(id);
}
