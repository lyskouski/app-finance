// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/transaction_log/web_dav_data.dart';
import 'package:app_finance/_classes/storage/transaction_log/web_dav_protocol.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/required_widget.dart';
import 'package:app_finance/widgets/settings/recover_tab/nav_button_widget.dart';
import 'package:app_finance/widgets/settings/recover_tab/recovery_type.dart';
import 'package:flutter/material.dart';

class RecoverWebdavForm extends StatefulWidget {
  final Function cbMessage;
  final Function cbProgress;
  final Function cbType;
  final Function cbFinal;
  final String message;

  const RecoverWebdavForm({
    super.key,
    required this.cbMessage,
    required this.cbProgress,
    required this.cbType,
    required this.cbFinal,
    this.message = '',
  });

  @override
  RecoverWebdavFormState createState() => RecoverWebdavFormState();
}

class RecoverWebdavFormState extends State<RecoverWebdavForm> {
  late final WebDavProtocol webDav;
  final username = TextEditingController();
  final password = TextEditingController();
  final link = TextEditingController();
  final path = TextEditingController(text: 'tmp.log');
  bool isEncrypted = true;

  @override
  void initState() {
    webDav = WebDavProtocol(callbackMessage: widget.cbMessage, callbackProgress: widget.cbProgress);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent(2);
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ThemeHelper.hIndent2x,
        NavButtonWidget(
          name: AppLocale.labels.webDav,
          nav: RecoveryType.none,
          icon: Icons.arrow_left,
          callback: widget.cbType,
        ),
        Text(
          widget.message,
          style: textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        RequiredWidget(
          title: AppLocale.labels.link,
          showError: widget.message != '' && link.text.isEmpty,
        ),
        SimpleInput(
          controller: link,
          type: TextInputType.url,
        ),
        ThemeHelper.hIndent2x,
        RequiredWidget(
          title: AppLocale.labels.username,
          showError: widget.message != '' && username.text.isEmpty,
        ),
        SimpleInput(
          controller: username,
        ),
        ThemeHelper.hIndent2x,
        RequiredWidget(
          title: AppLocale.labels.password,
          showError: widget.message != '' && password.text.isEmpty,
        ),
        SimpleInput(
          controller: password,
          type: TextInputType.visiblePassword,
        ),
        ThemeHelper.hIndent2x,
        RequiredWidget(
          title: AppLocale.labels.path,
          showError: widget.message != '' && path.text.isEmpty,
        ),
        SimpleInput(
          controller: path,
        ),
        Row(
          children: [
            Checkbox(value: isEncrypted, onChanged: (value) => setState(() => isEncrypted = value!)),
            Text(AppLocale.labels.isEncrypted),
          ],
        ),
        ThemeHelper.hIndent4x,
        SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            heroTag: 'recover_tab_save',
            onPressed: () => webDav.save(WebDavData(
              link: link.text,
              username: username.text,
              password: password.text,
              path: path.text,
            )),
            tooltip: AppLocale.labels.saveTooltip,
            child: Text(AppLocale.labels.saveTooltip),
          ),
        ),
        SizedBox(height: indent * 4),
        SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            heroTag: 'recover_tab_recover',
            onPressed: () => webDav
                .load(
                  WebDavData(
                    link: link.text,
                    username: username.text,
                    password: password.text,
                    path: path.text,
                  ),
                  isEncrypted,
                )
                .then((_) => widget.cbFinal()),
            tooltip: AppLocale.labels.recoveryTooltip,
            child: Text(AppLocale.labels.recoveryTooltip),
          ),
        ),
      ],
    );
  }
}
