// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/required_widget.dart';
import 'package:app_finance/widgets/init/loading_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webdav_client/webdav_client.dart';

class RecoverTab extends StatefulWidget {
  const RecoverTab({super.key});

  @override
  SyncTabState createState() => SyncTabState();
}

class SyncTabState extends State<RecoverTab> {
  final username = TextEditingController();
  final password = TextEditingController();
  final link = TextEditingController();
  final path = TextEditingController(text: 'tmp.log');
  String message = '';
  bool inProgress = false;

  Client? _connect() {
    if (username.text.isEmpty || link.text.isEmpty || password.text.isEmpty) {
      setState(() => message = AppLocale.labels.isRequired);
      return null;
    }
    setState(() => inProgress = true);
    return newClient(link.text, user: username.text, password: password.text);
  }

  Future<void> save2WebDav() async {
    final client = _connect();
    if (client == null) {
      return;
    }
    List<int> codeUnits = [];
    await for (String line in TransactionLog.read()) {
      codeUnits.addAll(line.codeUnits);
      codeUnits.addAll('\n'.codeUnits);
    }
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    setState(() => message = '');
    await client.write(path.text, unit8List).catchError((err) {
      setState(() {
        message = AppLocale.labels.error(err.toString());
        inProgress = false;
      });
    });
    setState(() {
      inProgress = false;
      if (message == '') {
        message = AppLocale.labels.success;
      }
    });
  }

  Future<void> recover4WebDav() async {
    final client = _connect();
    if (client == null) {
      return;
    }
    List<int> uint8list = await client.read(path.text);
    List<String> lines = String.fromCharCodes(uint8list).split('\n');
    for (String line in lines) {
      TransactionLog.save(line, true);
    }
    setState(() {
      inProgress = false;
      message = AppLocale.labels.success;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double indent = ThemeHelper.getIndent(2);
    FocusController.init();

    return SingleChildScrollView(
      controller: FocusController.getController(runtimeType),
      child: Padding(
        padding: EdgeInsets.all(indent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (inProgress) ...[
              SizedBox(height: indent * 6),
              LoadingWidget(isLoading: inProgress),
            ] else ...[
              SizedBox(height: indent),
              Text(
                AppLocale.labels.webDav,
                style: textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              Text(
                message,
                style: textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.inversePrimary),
              ),
              SizedBox(height: indent),
              RequiredWidget(
                title: AppLocale.labels.link,
                showError: message != '' && link.text.isEmpty,
              ),
              SimpleInput(
                controller: link,
                type: TextInputType.url,
                style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
              ),
              SizedBox(height: indent),
              RequiredWidget(
                title: AppLocale.labels.username,
                showError: message != '' && username.text.isEmpty,
              ),
              SimpleInput(
                controller: username,
                style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
              ),
              SizedBox(height: indent),
              RequiredWidget(
                title: AppLocale.labels.password,
                showError: message != '' && password.text.isEmpty,
              ),
              SimpleInput(
                controller: password,
                type: TextInputType.visiblePassword,
                style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
              ),
              SizedBox(height: indent),
              RequiredWidget(
                title: AppLocale.labels.path,
                showError: message != '' && path.text.isEmpty,
              ),
              SimpleInput(
                controller: path,
                style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color),
              ),
              SizedBox(height: indent * 2),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  heroTag: 'recover_tab_save',
                  onPressed: save2WebDav,
                  tooltip: AppLocale.labels.saveTooltip,
                  child: Text(AppLocale.labels.saveTooltip),
                ),
              ),
              SizedBox(height: indent * 4),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  heroTag: 'recover_tab_recover',
                  onPressed: recover4WebDav,
                  tooltip: AppLocale.labels.recoveryTooltip,
                  child: Text(AppLocale.labels.recoveryTooltip),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
