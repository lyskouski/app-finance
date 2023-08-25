// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/storage/transaction_log/file_protocol.dart';
import 'package:app_finance/_classes/storage/transaction_log/web_dav_data.dart';
import 'package:app_finance/_classes/storage/transaction_log/web_dav_protocol.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/required_widget.dart';
import 'package:app_finance/widgets/_wrappers/tap_widget.dart';
import 'package:app_finance/widgets/_wrappers/toolbar_button_widget.dart';
import 'package:app_finance/widgets/init/loading_widget.dart';
import 'package:flutter/material.dart';

enum RecoveryType { none, webdav, file }

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
  RecoveryType type = RecoveryType.none;
  double indent = ThemeHelper.getIndent(2);

  late final WebDavProtocol webDav;
  late final FileProtocol file;

  @override
  void initState() {
    cbMessage(String mssg) => setState(() => message = mssg);
    cbProgress(bool state) => setState(() => inProgress = state);
    webDav = WebDavProtocol(callbackMessage: cbMessage, callbackProgress: cbProgress);
    file = FileProtocol(callbackMessage: cbMessage, callbackProgress: cbProgress);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FocusController.init();

    Widget form;
    switch (type) {
      case RecoveryType.webdav:
        form = buildWebDavForm(context);
        break;
      case RecoveryType.file:
        form = buildFileForm(context);
        break;
      default:
        form = buildListOfChoices(context);
    }

    return SingleChildScrollView(
      controller: FocusController.getController(runtimeType),
      child: Padding(
        padding: EdgeInsets.all(indent),
        child: inProgress ? buildProgressBar(context) : form,
      ),
    );
  }

  Widget _navButton(BuildContext context, String name, RecoveryType nav, [IconData icon = Icons.arrow_right]) {
    final textTheme = Theme.of(context).textTheme;
    return TapWidget(
      onTap: () => setState(() => type = nav),
      tooltip: name,
      child: Row(
        children: [
          ToolbarButtonWidget(
            offset: const Offset(0, 0),
            borderColor: Theme.of(context).colorScheme.inversePrimary,
            child: IconButton(
              hoverColor: Colors.transparent,
              icon: Icon(icon),
              onPressed: () => setState(() => type = nav),
            ),
          ),
          SizedBox(width: indent),
          Text(name, style: textTheme.bodyLarge),
        ],
      ),
    );
  }

  Widget buildListOfChoices(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: indent),
        _navButton(context, AppLocale.labels.webDav, RecoveryType.webdav),
        SizedBox(height: indent),
        _navButton(context, AppLocale.labels.transactionFile, RecoveryType.file),
      ],
    );
  }

  Widget buildFileForm(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: indent),
        _navButton(context, AppLocale.labels.transactionFile, RecoveryType.none, Icons.arrow_left),
        Text(
          message,
          style: textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.inversePrimary),
        ),
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
            onPressed: () => file.save(path.text),
            tooltip: AppLocale.labels.saveTooltip,
            child: Text(AppLocale.labels.saveTooltip),
          ),
        ),
        SizedBox(height: indent * 4),
        SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            heroTag: 'recover_tab_recover',
            onPressed: () => file.load(path.text),
            tooltip: AppLocale.labels.recoveryTooltip,
            child: Text(AppLocale.labels.recoveryTooltip),
          ),
        ),
      ],
    );
  }

  Widget buildWebDavForm(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: indent),
        _navButton(context, AppLocale.labels.webDav, RecoveryType.none, Icons.arrow_left),
        Text(
          message,
          style: textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.inversePrimary),
        ),
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
            onPressed: () => webDav.load(WebDavData(
              link: link.text,
              username: username.text,
              password: password.text,
              path: path.text,
            )),
            tooltip: AppLocale.labels.recoveryTooltip,
            child: Text(AppLocale.labels.recoveryTooltip),
          ),
        ),
      ],
    );
  }

  Widget buildProgressBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: ThemeHelper.getIndent(12)),
        LoadingWidget(isLoading: inProgress),
      ],
    );
  }
}
