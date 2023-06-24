// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/routes/account_add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AccountEditPage extends AccountAddPage {
  String uuid;
  bool isFirstRun = true;

  AccountEditPage({
    required this.uuid,
  }) : super();

  @override
  AccountEditPageState createState() => AccountEditPageState();
}

class AccountEditPageState extends AccountAddPageState<AccountEditPage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.editAccountHeader;
  }

  @override
  void updateStorage() {
    String uuid = (widget as AccountEditPage).uuid;
    var data = widget.state?.state['accounts'];
    final index = data['list'].indexWhere((item) => item.uuid == uuid);
    if (index != -1) {
      data['list'][index] = (
        uuid: uuid,
        title: widget.title,
        description: widget.description ?? '',
        details: widget.balance ?? 0.0,
        progress: 1.0,
        color: widget.color ?? Colors.red,
        hidden: false,
      );
    }
    widget.state?.set('accounts', data);
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    if ((widget as AccountEditPage).isFirstRun) {
      (widget as AccountEditPage).isFirstRun = false;
      var form = widget.state?.get('accounts', (widget as AccountEditPage).uuid);
      widget.title = form.title;
      widget.description = form.description;
      widget.balance = form.details;
      widget.color = form.color;
    }
    return super.buildContent(context, constraints);
  }
}
