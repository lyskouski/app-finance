// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/routes/abstract_page_state.dart';
import 'package:app_finance/widgets/subscription/other_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  SubscriptionPageState createState() => SubscriptionPageState();
}

class SubscriptionPageState extends AbstractPageState<SubscriptionPage> {
  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return ThemeHelper.emptyBox;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    double indent = ThemeHelper.getIndent();
    return Padding(
      padding: EdgeInsets.fromLTRB(indent, indent, indent, 0),
      child: Column(
        children: [
          Text(AppLocale.labels.subscription),
          const Divider(),
          defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS
              ? ThemeHelper.emptyBox
              : const OtherWidget(),
        ],
      ),
    );
  }

  @override
  String getTitle() {
    return AppLocale.labels.subscriptionHeadline;
  }
}
