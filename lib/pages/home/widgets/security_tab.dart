// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/generic/notification_bar.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:flutter/material.dart';
import 'package:simple_totp_auth/simple_totp_auth.dart';

class SecurityTab extends StatefulWidget {
  final VoidCallback onSuccess;

  const SecurityTab({super.key, required this.onSuccess});

  @override
  SecurityTabState createState() => SecurityTabState();
}

class SecurityTabState extends AbstractPageState<SecurityTab> {
  late FocusController focus;
  late TextEditingController password;

  @override
  void initState() {
    focus = FocusController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Drawer? buildDrawer() => null;

  @override
  List<Widget> getBarActions(NavigatorState nav) => [];

  @override
  Widget? getBarLeading(NavigatorState nav) => null;

  @override
  String getTitle() => AppLocale.labels.securityHeadline;

  @override
  String getButtonName() => AppLocale.labels.btnConfirm;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) => FullSizedButtonWidget(
        constraints: constraints,
        controller: focus,
        onPressed: () => triggerActionButton(),
        title: getButtonName(),
        icon: Icons.password,
      );

  void triggerActionButton() {
    if (password.text.isEmpty) {
      NotificationBar.showSnackBar(context, AppLocale.labels.securePasswordEmpty, true);
      return;
    }
    final secret = AppPreferences.get(AppPreferences.prefPrivacyKey) ?? '';
    if (password.text != TOTP(secret: secret).now()) {
      NotificationBar.showSnackBar(context, AppLocale.labels.secureOtpCodeInvalid, true);
      final key = AppPreferences.get(AppPreferences.prefRecoveryKey) ?? '';
      if (EncryptionHandler.getHashString(password.text) != key) {
        NotificationBar.showSnackBar(context, AppLocale.labels.securePasswordNotMatch, true);
        return;
      }
    }
    widget.onSuccess();
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final indent = ThemeHelper.getIndent();
    return SingleScrollWrapper(
      controller: focus,
      child: Padding(
        padding: EdgeInsets.all(indent),
        child: Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            InputWrapper.text(
              title: '${AppLocale.labels.secureOtpCode} / ${AppLocale.labels.securePassword}',
              controller: password,
              isRequired: true,
            ),
          ],
        ),
      ),
    );
  }
}
