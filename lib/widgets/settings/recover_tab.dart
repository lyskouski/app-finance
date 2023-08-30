// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/init/loading_widget.dart';
import 'package:app_finance/widgets/settings/recover_tab/nav_button_widget.dart';
import 'package:app_finance/widgets/settings/recover_tab/recover_file_form.dart';
import 'package:app_finance/widgets/settings/recover_tab/recover_webdav_form.dart';
import 'package:app_finance/widgets/settings/recover_tab/recovery_type.dart';
import 'package:flutter/material.dart';

class RecoverTab extends StatefulWidget {
  final Function callback;

  const RecoverTab({super.key, required this.callback});

  @override
  SyncTabState createState() => SyncTabState();
}

class SyncTabState extends State<RecoverTab> {
  String message = '';
  bool inProgress = false;
  RecoveryType type = RecoveryType.none;

  void cbType(RecoveryType value) => setState(() {
        type = value;
        message = '';
      });

  void cbMessage(String mssg) => setState(() => message = mssg);

  void cbProgress(bool state) => setState(() => inProgress = state);

  @override
  Widget build(BuildContext context) {
    FocusController.init();
    double indent = ThemeHelper.getIndent(2);
    Widget form;
    if (inProgress) {
      form = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ThemeHelper.getIndent(12)),
          LoadingWidget(isLoading: inProgress),
        ],
      );
    } else {
      switch (type) {
        case RecoveryType.webdav:
          form = RecoverWebdavForm(
            cbFinal: widget.callback,
            cbMessage: cbMessage,
            cbProgress: cbProgress,
            cbType: cbType,
            message: message,
          );
          break;
        case RecoveryType.file:
          form = RecoverFileForm(
            cbFinal: widget.callback,
            cbMessage: cbMessage,
            cbProgress: cbProgress,
            cbType: cbType,
            message: message,
          );
          break;
        default:
          form = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: indent),
              NavButtonWidget(
                name: AppLocale.labels.webDav,
                nav: RecoveryType.webdav,
                callback: cbType,
              ),
              SizedBox(height: indent),
              NavButtonWidget(
                name: AppLocale.labels.transactionFile,
                nav: RecoveryType.file,
                callback: cbType,
              ),
            ],
          );
      }
    }
    return SingleChildScrollView(
      controller: FocusController.getController(runtimeType),
      child: Padding(
        padding: EdgeInsets.all(indent),
        child: form,
      ),
    );
  }
}
