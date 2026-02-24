// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/sorting_type.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/form/list_selector_page.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:flutter/material.dart';

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

  FntSelectorCallback? getItemBuilder() => null;

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return ListSelectorPage(
      options: SortingType.getList(),
      result: null,
      tooltip: AppLocale.labels.sortTooltip,
      itemBuilder: getItemBuilder(),
    );
  }
}
