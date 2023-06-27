// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/classes/abstract_app_data.dart';
import 'package:app_finance/classes/account_app_data.dart';
import 'package:app_finance/classes/budget_app_data.dart';
import 'package:app_finance/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';

class BillAppData extends AbstractAppData {
  String account;
  String category;

  BillAppData({
    required this.account,
    required this.category,
    super.uuid,
    super.title = '',
    super.details,
    super.currency,
    super.createdAt,
    super.createdAtFormatted,
    super.hidden,
  });

  String get detailsFormatted => getNumberFormatted(super.details);

  @override
  String get description {
    final locale = Localizations.localeOf(getContext()!).toString();
    final DateFormat formatterDate = DateFormat.MMMMd(locale);
    AccountAppData? type = getState()?.getByUuid(account);
    String from = AppLocalizations.of(getContext()!)!.from;
    return formatterDate.format(super.createdAt) +
        (type?.description != null ? ' ($from "${type?.description}")' : '');
  }

  @override
  MaterialColor? get color {
    BudgetAppData? budget = getState()?.getByUuid(category);
    return budget?.color;
  }
}
