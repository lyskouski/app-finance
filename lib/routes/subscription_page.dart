// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/subscription/other_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SubscriptionPage extends AbstractPage {
  SubscriptionPage() : super();

  @override
  SubscriptionPageState createState() => SubscriptionPageState();
}

class SubscriptionPageState extends AbstractPageState<SubscriptionPage> {
  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return const SizedBox();
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    double indent = helper.getIndent();
    return Padding(
      padding: EdgeInsets.fromLTRB(indent, indent, indent, 0),
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.subscription),
          const Divider(),
          defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS
              ? const SizedBox()
              : const OtherWidget(),
        ],
      ),
    );
  }

  @override
  String getTitle(BuildContext context) {
    return AppLocalizations.of(context)!.subscriptionHeadline;
  }
}
