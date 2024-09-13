// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/transaction_log/file_protocol.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/wrapper/required_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:app_finance/pages/settings/widgets/recover_tab/nav_button_widget.dart';
import 'package:app_finance/pages/settings/widgets/recover_tab/recovery_type.dart';
import 'package:flutter/material.dart';

class RecoverFileForm extends StatefulWidget {
  final Function cbMessage;
  final Function cbProgress;
  final Function cbType;
  final Function cbFinal;
  final String message;

  const RecoverFileForm({
    super.key,
    required this.cbMessage,
    required this.cbProgress,
    required this.cbType,
    required this.cbFinal,
    this.message = '',
  });

  @override
  RecoverFileFormState createState() => RecoverFileFormState();
}

class RecoverFileFormState extends State<RecoverFileForm> {
  final path = TextEditingController(text: 'tmp.log');
  bool isEncrypted = true;
  bool isCleaned = false;
  late final FileProtocol file;

  @override
  void initState() {
    file = FileProtocol(callbackMessage: widget.cbMessage, callbackProgress: widget.cbProgress);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Column(
      crossAxisAlignment: AppDesign.getAlignment(),
      children: [
        ThemeHelper.hIndent2x,
        NavButtonWidget(
          name: AppLocale.labels.transactionFile,
          nav: RecoveryType.none,
          icon: Icons.arrow_left,
          callback: widget.cbType,
        ),
        Text(
          widget.message,
          style: textTheme.headlineMedium?.copyWith(color: context.colorScheme.inversePrimary),
        ),
        RequiredWidget(
          title: AppLocale.labels.path,
          showError: widget.message != '' && path.text.isEmpty,
        ),
        SimpleInput(
          controller: path,
        ),
        ThemeHelper.hIndent4x,
        SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            heroTag: 'recover_tab_save',
            onPressed: () => file.save(path.text),
            tooltip: AppLocale.labels.saveTooltip,
            child: Text(AppLocale.labels.saveTooltip),
          ),
        ),
        ThemeHelper.hIndent4x,
        Row(
          children: [
            Checkbox(value: isEncrypted, onChanged: (value) => setState(() => isEncrypted = value!)),
            TextWrapper(AppLocale.labels.isEncrypted),
          ],
        ),
        ThemeHelper.hIndent,
        Row(
          children: [
            Checkbox(value: isCleaned, onChanged: (value) => setState(() => isCleaned = value!)),
            TextWrapper(AppLocale.labels.isCleaned),
          ],
        ),
        ThemeHelper.hIndent2x,
        SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            heroTag: 'recover_tab_recover',
            onPressed: () => file.load(path.text, isEncrypted, isCleaned).then((_) => widget.cbFinal()),
            tooltip: AppLocale.labels.recoveryTooltip,
            child: Text(AppLocale.labels.recoveryTooltip),
          ),
        ),
      ],
    );
  }
}
