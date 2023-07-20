// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/init/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';

class InitPage extends AbstractPage {
  InitPage() : super();

  @override
  InitPageState createState() => InitPageState();
}

class InitPageState extends AbstractPageState<InitPage>
    with SharedPreferencesMixin {
  bool isConfirmed = false;
  bool isTriggered = false;

  @override
  void initState() {
    super.initState();
    getPreference(prefPrivacyPolicy)
        .then((state) => setState(() => isConfirmed = state != null));
  }

  @override
  Drawer? buildDrawer() {
    return null;
  }

  @override
  AppBar buildBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
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

  void handleNextStep(context) {
    Navigator.popAndPushNamed(context, AppRoute.homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (context, appState, _) {
      if (!(appState.isLoading || isTriggered)) {
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            if (!isTriggered) {
              handleNextStep(context);
            }
            isTriggered = true;
          });
        });
      }
      return super.build(context);
    });
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return LoadingWidget(isLoading: super.state.isLoading);
  }

  @override
  String getTitle(BuildContext context) {
    return AppLocalizations.of(context)!.appInitHeadline;
  }
}
