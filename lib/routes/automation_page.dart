// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_wrappers/tab_widget.dart';
//import 'package:app_finance/widgets/automation/notification_tab.dart';
import 'package:flutter/material.dart';

class AutomationPage extends AbstractPage {
  AutomationPage() : super();

  @override
  AutomationPageState createState() => AutomationPageState();
}

class AutomationPageState extends AbstractPageState<AutomationPage> {
  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return ThemeHelper.emptyBox;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return const TabWidget(
      focus: 0,
      tabs: [
        /*
        if (Platform.isAndroid)
          Tab(
            icon: const Icon(Icons.message),
            text: AppLocale.labels.notifyHeadline,
          ),
          */
      ],
      children: [
        /*
        if (Platform.isAndroid) const NotificationTab(),
        */
      ],
    );
  }

  @override
  String getTitle() {
    return AppLocale.labels.automationHeadline;
  }
}
