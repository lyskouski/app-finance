// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/widgets/automation/sync_tab.dart';
//import 'package:app_finance/widgets/automation/notification_tab.dart';
import 'package:flutter/material.dart';

class AutomationPage extends StatefulWidget {
  const AutomationPage({super.key});

  @override
  AutomationPageState createState() => AutomationPageState();
}

class AutomationPageState extends AbstractPageState<AutomationPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return ThemeHelper.emptyBox;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final indent = ThemeHelper.getIndent();
    return Padding(
      padding: EdgeInsets.only(top: indent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TabBar.secondary(
            controller: _tabController,
            tabs: <Widget>[
              Tab(icon: const Icon(Icons.sync), text: AppLocale.labels.syncHeadline),
              // if (Platform.isAndroid)
              // Tab(icon: const Icon(Icons.message), text: AppLocale.labels.notifyHeadline),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(indent, 0, indent, 0),
              child: TabBarView(
                controller: _tabController,
                children: const [
                  SyncTab(),
                  //if (Platform.isAndroid) NotificationTab(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  String getTitle() {
    return AppLocale.labels.automationHeadline;
  }
}
