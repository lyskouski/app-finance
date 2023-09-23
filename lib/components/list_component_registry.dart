// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/widgets/form/list_selector.dart';

enum ComponentRegistry {
  recent,
}

class ListComponentRegistry extends ListSelector {
  ListComponentRegistry({
    super.key,
    required super.setState,
    required super.hintText,
    required super.hintStyle,
    super.options = const [],
    super.value,
  }) : super();

  @override
  List<ListSelectorItem> get options {
    return [
      ListSelectorItem(id: ComponentRegistry.recent.toString(), name: AppLocale.labels.cmpRecent),
    ];
  }
}
