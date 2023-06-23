// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/data.dart';
import 'package:app_finance/routes/account_add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AccountEditPage extends AccountAddPage {
  AccountEditPage({
    required uuid,
    required AppData state,
  }) : super(
          key: UniqueKey(),
          state: state,
          uuid: uuid,
        ) {
    var form = state.get('accounts', uuid);
    title = form.title;
    description = form.description;
    title = form.title;
    description = form.description;
    balance = form.details;
    color = form.color;
  }

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
    var data = widget.state.state['accounts'];
    final index = data['list'].indexWhere((item) => item.uuid == widget.uuid);
    if (index != -1) {
      data['list'][index] = (
        uuid: widget.uuid,
        title: widget.title,
        description: widget.description ?? '',
        details: widget.balance ?? 0.0,
        progress: 1.0,
        color: widget.color ?? Colors.red,
      );
    }
    widget.state.set('accounts', data);
  }
}
