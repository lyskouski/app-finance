// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/generic/notification_bar.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_totp_auth/simple_totp_auth.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  SecurityPageState createState() => SecurityPageState();
}

class SecurityPageState extends AbstractPageState<SecurityPage> {
  late FocusController focus;
  late TextEditingController password;
  late TextEditingController passwordRepeat;
  late TextEditingController otpCode;

  @override
  void initState() {
    focus = FocusController();
    password = TextEditingController();
    passwordRepeat = TextEditingController();
    otpCode = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    password.dispose();
    passwordRepeat.dispose();
    otpCode.dispose();
    super.dispose();
  }

  @override
  String getButtonName() => AppLocale.labels.saveSettingsTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) => FullSizedButtonWidget(
        constraints: constraints,
        controller: focus,
        onPressed: () => triggerActionButton(),
        title: getButtonName(),
        icon: Icons.save,
      );

  void triggerActionButton() {
    if (password.text.isEmpty || passwordRepeat.text.isEmpty) {
      NotificationBar.showSnackBar(context, AppLocale.labels.securePasswordEmpty, true);
      return;
    }
    if (password.text != passwordRepeat.text) {
      NotificationBar.showSnackBar(context, AppLocale.labels.securePasswordNotMatch, true);
      return;
    }

    final secret = AppPreferences.get(AppPreferences.prefPrivacyKey) ?? '';
    final totp = TOTP(secret: secret);
    final code = totp.now();
    if (otpCode.text.isNotEmpty && otpCode.text != code) {
      NotificationBar.showSnackBar(context, AppLocale.labels.secureOtpCodeInvalid, true);
      return;
    }

    AppPreferences.set(AppPreferences.prefIsOTP, AppPreferences.isActive);
    AppPreferences.set(AppPreferences.prefRecoveryKey, password.text);
    NotificationBar.showSnackBar(context, AppLocale.labels.settingsSaved);
  }

  @override
  String getTitle() => AppLocale.labels.securityHeadline;

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final indent = ThemeHelper.getIndent();
    final textTheme = context.textTheme;
    final secret = AppPreferences.get(AppPreferences.prefPrivacyKey) ?? '';
    final totp = TOTP(secret: secret);
    final totpUrl = totp.generateOTPAuthURI(issuer: 'Fingrom', account: 'support@tercad.pl');
    return SingleScrollWrapper(
      controller: focus,
      child: Padding(
        padding: EdgeInsets.all(indent),
        child: Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            InputWrapper.text(
              title: AppLocale.labels.securePassword,
              controller: password,
              isRequired: true,
              inputType: TextInputType.visiblePassword,
            ),
            InputWrapper.text(
              title: AppLocale.labels.securePasswordRepeat,
              controller: passwordRepeat,
              isRequired: true,
              inputType: TextInputType.visiblePassword,
            ),
            TOTPQrWidget(
              secret: secret,
              issuer: 'Fingrom',
              accountName: 'support@tercad.pl',
              width: 200,
              height: 200,
              color: Colors.white,
            ),
            Container(
              padding: EdgeInsets.all(indent),
              color: context.colorScheme.fieldBackground,
              child: SelectableText(
                totpUrl,
                style: textTheme.bodyLarge,
                onTap: () {
                  Clipboard.setData(ClipboardData(text: totpUrl));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppLocale.labels.copiedToClipboard)),
                  );
                },
              ),
            ),
            ThemeHelper.hIndent2x,
            InputWrapper.text(
              title: AppLocale.labels.secureOtpCode,
              controller: otpCode,
            ),
          ],
        ),
      ),
    );
  }
}
