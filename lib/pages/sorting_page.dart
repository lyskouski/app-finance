// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_sorting.dart';
import 'package:app_finance/_configs/sorting_type.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/design/form/list_selector_page.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortingPage extends StatefulWidget {
  const SortingPage({super.key});

  @override
  SortingPageState createState() => SortingPageState();
}

class SortingPageState extends AbstractPageState<SortingPage> {
  @override
  String getTitle() => AppLocale.labels.sortTooltip;

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) => ThemeHelper.emptyBox;

  @override
  List<Widget> getBarActions(NavigatorState nav) => [ThemeHelper.emptyBox];

  @override
  Widget? buildNavigation() => null;

  @override
  Widget? getBarLeading(NavigatorState nav) => ThemeHelper.emptyBox;

  Future<void> onTap(ListSelectorItem? item, NavigatorState nav, AppSorting sorting) async {
    await sorting.set(item?.id);
    nav.pop();
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final nav = Navigator.of(context);
    final sorting = Provider.of<AppSorting>(context, listen: true);
    return ListSelectorPage<ListSelectorItem>(
      options: SortingType.getList(),
      result: SortingType.getItem(sorting.getKey(context)),
      tooltip: AppLocale.labels.sortTooltip,
      onTap: (item) => onTap(item, nav, sorting),
    );
  }
}
