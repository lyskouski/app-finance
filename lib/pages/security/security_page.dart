// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:flutter/material.dart';
import 'package:simple_totp_auth/simple_totp_auth.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  SecurityPageState createState() => SecurityPageState();
}

class SecurityPageState extends AbstractPageState<SecurityPage> {
  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) => ThemeHelper.emptyBox;

  @override
  String getTitle() => AppLocale.labels.securityHeadline;

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final indent = ThemeHelper.getIndent();
    final secret = AppPreferences.get(AppPreferences.prefPrivacyKey) ?? '';
    return Padding(
      padding: EdgeInsets.fromLTRB(indent, indent, indent, 0),
      child: Column(
        children: [
          TOTPQrWidget(
            secret: secret,
            issuer: 'Fingrom',
            accountName: 'support@tercad.pl',
            width: 200,
            height: 200,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
