// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/automation/widgets/sync_tab.dart';
import 'package:app_finance/design/wrapper/tab_widget.dart';
//import 'package:app_finance/pages/automation/widgets/notification_tab.dart';
import 'package:flutter/material.dart';

class AutomationPage extends StatefulWidget {
  const AutomationPage({super.key});

  @override
  AutomationPageState createState() => AutomationPageState();
}

class AutomationPageState extends AbstractPageState<AutomationPage> with TickerProviderStateMixin {
  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return ThemeHelper.emptyBox;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    bool isLeft = ThemeHelper.isNavRight(context, constraints);
    return Column(
      children: [
        Expanded(
          child: TabWidget(
            type: TabType.secondary,
            isLeft: isLeft,
            tabs: [
              Tab(icon: const Icon(Icons.sync), text: AppLocale.labels.syncHeadline),
              // if (Platform.isAndroid)
              // Tab(icon: const Icon(Icons.message), text: AppLocale.labels.notifyHeadline),
              const Tab(text: ''), // ERR: 'destinations.length >= 2': is not true
            ],
            children: const [
              SyncTab(),
              //if (Platform.isAndroid) NotificationTab(),
              ThemeHelper.emptyBox,
            ],
          ),
        ),
      ],
    );
  }

  @override
  String getTitle() {
    return AppLocale.labels.automationHeadline;
  }
}
