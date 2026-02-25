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
      ListSelectorItem(id: AppSortingType.amountDesc.name, name: AppLocale.labels.sortingAmountDesc),
      ListSelectorItem(id: AppSortingType.amountAsc.name, name: AppLocale.labels.sortingAmountAsc),
      ListSelectorItem(id: AppSortingType.createdAtDesc.name, name: AppLocale.labels.sortingCreatedAtDesc),
      ListSelectorItem(id: AppSortingType.createdAtAsc.name, name: AppLocale.labels.sortingCreatedAtAsc),
      ListSelectorItem(id: AppSortingType.titleDesc.name, name: AppLocale.labels.sortingTitleDesc),
      ListSelectorItem(id: AppSortingType.titleAsc.name, name: AppLocale.labels.sortingTitleAsc),
      ListSelectorItem(id: AppSortingType.updatedAtDesc.name, name: AppLocale.labels.sortingUpdatedAtDesc),
      ListSelectorItem(id: AppSortingType.updatedAtAsc.name, name: AppLocale.labels.sortingUpdatedAtAsc),
    ];
  }

  static ListSelectorItem? getItem(String? id) => getList().where((e) => e.id == id).firstOrNull;
}
