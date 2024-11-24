// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/_interfaces/interface_page_inject.dart';
import 'package:app_finance/pages/automation/widgets/payments_tab.dart';
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
  PageInject? inject;

  @override
  String getTitle() => inject?.title ?? AppLocale.labels.automationHeadline;

  @override
  String getButtonName() => inject?.buttonName ?? '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) =>
      inject?.buildButton(context, constraints) ?? ThemeHelper.emptyBox;

  void update(PageInject data) {
    if (data != inject) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() => inject = data));
    }
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final isLeft = ScreenHelper.state().isLeftBar;
    return Column(
      children: [
        Expanded(
          child: TabWidget(
            type: TabType.secondary,
            isLeft: isLeft,
            tabs: [
              Tab(icon: const Icon(Icons.free_cancellation_rounded), text: AppLocale.labels.paymentsHeadline),
              Tab(icon: const Icon(Icons.sync), text: AppLocale.labels.syncHeadline),
              // if (Platform.isAndroid)
              // Tab(icon: const Icon(Icons.message), text: AppLocale.labels.notifyHeadline),
            ],
            children: [
              PaymentsTab(callback: update, state: state),
              SyncTab(callback: update),
              //if (Platform.isAndroid) NotificationTab(),
            ],
          ),
        ),
      ],
    );
  }
}
