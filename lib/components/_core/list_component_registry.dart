// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/def/list_selector_item.dart';
import 'package:app_finance/pages/_widgets/form/list_selector.dart';

enum ComponentRegistry {
  recent,
}

class ListComponentRegistryItem extends ListSelectorItem {
  final ComponentRegistry key;
  ListComponentRegistryItem({required this.key, required super.name}) : super(id: key.toString());
}

class ListComponentRegistry extends ListSelector {
  const ListComponentRegistry({
    super.key,
    required super.setState,
    required super.hintText,
    required super.hintStyle,
    super.options = const [],
    super.value = '',
  }) : super();

  @override
  List<ListComponentRegistryItem> get options {
    return [
      ListComponentRegistryItem(key: ComponentRegistry.recent, name: AppLocale.labels.cmpRecent),
    ];
  }
}
