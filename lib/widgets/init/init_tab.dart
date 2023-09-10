// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/init/loading_widget.dart';
import 'package:flutter/material.dart';

class InitTab extends AbstractPage {
  const InitTab({super.key});

  @override
  InitTabState createState() => InitTabState();
}

class InitTabState extends AbstractPageState<InitTab> {
  @override
  Drawer? buildDrawer() {
    return null;
  }

  @override
  AppBar buildBar(BuildContext context, [bool isBottom = false]) {
    final text = Text(
      getTitle(),
      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
    );
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: 40,
      automaticallyImplyLeading: false,
      actions: const [],
      title: isBottom ? text : Center(child: text),
    );
  }

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return ThemeHelper.emptyBox;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return LoadingWidget(isLoading: super.state.isLoading);
  }

  @override
  String getTitle() {
    return AppLocale.labels.appInitHeadline;
  }
}
