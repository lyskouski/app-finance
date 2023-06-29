// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/classes/data/abstract_app_data.dart';

class AccountAppData extends AbstractAppData {
  DateTime _closedAt;
  String type;

  AccountAppData({
    required super.title,
    required this.type,
    super.uuid,
    super.details,
    super.progress = 0.0,
    super.description,
    super.color,
    super.icon,
    super.currency,
    super.createdAt,
    super.createdAtFormatted,
    DateTime? closedAt,
    String? closedAtFormatted,
    super.hidden,
  }) : _closedAt = closedAt ?? (closedAtFormatted != null ? DateTime.parse(closedAtFormatted) : DateTime.now());

  @override
  AccountAppData clone() {
    return AccountAppData(
      uuid: super.uuid,
      title: super.title,
      type: type,
      details: super.details,
      progress: super.progress,
      description: super.description,
      color: super.color,
      icon: super.icon,
      currency: super.currency,
      createdAt: super.createdAt,
      closedAt: closedAt,
      hidden: super.hidden,
    );
  }

  DateTime get closedAt => _closedAt;
  set closedAt(DateTime value) => _closedAt = value;
  String get closedAtFormatted => getDateFormatted(_closedAt);
  set closedAtFormatted(String value) => _closedAt = DateTime.parse(value);

  String get detailsFormatted => getNumberFormatted(super.details);
}
