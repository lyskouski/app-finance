// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/generic/loading_widget.dart';
import 'package:app_finance/pages/settings/widgets/recover_tab/nav_button_widget.dart';
import 'package:app_finance/pages/settings/widgets/recover_tab/recover_file_form.dart';
import 'package:app_finance/pages/settings/widgets/recover_tab/recover_webdav_form.dart';
import 'package:app_finance/pages/settings/widgets/recover_tab/recovery_type.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecoverTab extends StatefulWidget {
  const RecoverTab({super.key});

  @override
  SyncTabState createState() => SyncTabState();
}

class SyncTabState extends State<RecoverTab> {
  late FocusController focus;
  late AppData state;
  String message = '';
  bool inProgress = false;
  RecoveryType type = RecoveryType.none;

  @override
  void initState() {
    focus = FocusController();
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  void cbType(RecoveryType value) => setState(() {
        type = value;
        message = '';
      });

  void cbMessage(String mssg) => setState(() => message = mssg);

  void cbProgress(bool state) => setState(() => inProgress = state);

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent(2);
    Function form;
    if (inProgress) {
      form = () => Column(
            crossAxisAlignment: AppDesign.getAlignment(),
            children: [
              SizedBox(height: ThemeHelper.getIndent(12)),
              LoadingWidget(isLoading: inProgress),
            ],
          );
    } else {
      form = () => switch (type) {
            RecoveryType.webdav => RecoverWebdavForm(
                cbFinal: state.flush,
                cbMessage: cbMessage,
                cbProgress: cbProgress,
                cbType: cbType,
                message: message,
              ),
            RecoveryType.file => RecoverFileForm(
                cbFinal: state.flush,
                cbMessage: cbMessage,
                cbProgress: cbProgress,
                cbType: cbType,
                message: message,
              ),
            _ => Column(
                crossAxisAlignment: AppDesign.getAlignment(),
                children: [
                  ThemeHelper.hIndent2x,
                  NavButtonWidget(
                    name: AppLocale.labels.webDav,
                    nav: RecoveryType.webdav,
                    callback: cbType,
                  ),
                  ThemeHelper.hIndent2x,
                  NavButtonWidget(
                    name: AppLocale.labels.transactionFile,
                    nav: RecoveryType.file,
                    callback: cbType,
                  ),
                ],
              ),
          };
    }
    return Consumer<AppData>(builder: (context, appState, _) {
      state = appState;
      return SingleScrollWrapper(
        controller: focus,
        child: Padding(
          padding: EdgeInsets.all(indent),
          child: form(),
        ),
      );
    });
  }
}
