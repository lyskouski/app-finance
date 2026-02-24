// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/design/form/list_selector_item.dart';

enum AppSortingType {
  amountDesc,
  amountAsc,
  createdAtDesc,
  createdAtAsc,
  titleAsc,
  titleDesc,
  updatedAtDesc,
  updatedAtAsc,
}

class SortingType {
  static List<ListSelectorItem> getList() {
    return [
      ListSelectorItem(id: AppSortingType.amountDesc.toString(), name: AppLocale.labels.sortingAmountDesc),
      ListSelectorItem(id: AppSortingType.amountAsc.toString(), name: AppLocale.labels.sortingAmountAsc),
      ListSelectorItem(id: AppSortingType.createdAtDesc.toString(), name: AppLocale.labels.sortingCreatedAtDesc),
      ListSelectorItem(id: AppSortingType.createdAtAsc.toString(), name: AppLocale.labels.sortingCreatedAtAsc),
      ListSelectorItem(id: AppSortingType.titleAsc.toString(), name: AppLocale.labels.sortingTitleAsc),
      ListSelectorItem(id: AppSortingType.titleDesc.toString(), name: AppLocale.labels.sortingTitleDesc),
      ListSelectorItem(id: AppSortingType.updatedAtDesc.toString(), name: AppLocale.labels.sortingUpdatedAtDesc),
      ListSelectorItem(id: AppSortingType.updatedAtAsc.toString(), name: AppLocale.labels.sortingUpdatedAtAsc),
    ];
  }

  static String getLabel(String id) => getList().firstWhere((e) => e.id == id).name;

  static bool contains(String id, List<AppSortingType> type) => type.map((e) => e.toString()).contains(id);
}
