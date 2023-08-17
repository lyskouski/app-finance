// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/app_locale.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/init/loading_widget.dart';
import 'package:flutter/material.dart';

class InitPage extends AbstractPage {
  InitPage() : super();

  @override
  InitPageState createState() => InitPageState();
}

class InitPageState extends AbstractPageState<InitPage> {
  @override
  Drawer? buildDrawer() {
    return null;
  }

  @override
  AppBar buildBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: 40,
      automaticallyImplyLeading: false,
      actions: const [],
      title: Center(
        child: Text(
          getTitle(context),
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
    );
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return const SizedBox();
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return LoadingWidget(isLoading: super.state.isLoading);
  }

  @override
  String getTitle(BuildContext context) {
    return AppLocale.labels.appInitHeadline;
  }
}
