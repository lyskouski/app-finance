// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/abstract_app_data.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BudgetAppData extends AbstractAppData {
  BudgetAppData({
    required super.title,
    super.uuid,
    super.details,
    super.progress = 0.0,
    super.color,
    super.icon,
    super.currency,
    super.createdAt,
    super.createdAtFormatted,
    amountLimit,
    super.hidden,
  });

  @override
  BudgetAppData clone() {
    return BudgetAppData(
      title: super.title,
      uuid: super.uuid,
      details: super.details,
      progress: super.progress,
      color: super.color,
      icon: super.icon,
      currency: super.currency,
      createdAt: super.createdAt,
      amountLimit: amountLimit,
      hidden: super.hidden,
    );
  }

  @override
  double get details => super.details * (1 - super.progress);

  String get detailsFormatted{
    String left = AppLocalizations.of(getContext()!)!.left;
    return '${getNumberFormatted(details)} $left';
  }

  double get amountLimit => super.details;
  set amountLimit(double value) => super.details = value;

  @override
  String get description =>
      '${getNumberFormatted(super.details * super.progress)} / ${getNumberFormatted(super.details)}';

  @override
  set description(String? value) => {};
}
