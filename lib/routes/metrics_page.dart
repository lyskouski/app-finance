// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/routes/abstract_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class MetricsPage extends AbstractPage {
  MetricsPage() : super();

  @override
  MetricsPageState createState() => MetricsPageState();
}

class MetricsPageState extends AbstractPageState<MetricsPage> {
  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return const SizedBox();
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return const SizedBox();
  }

  @override
  String getTitle(BuildContext context) {
    return AppLocalizations.of(context)!.metricsTooltip;
  }
}
