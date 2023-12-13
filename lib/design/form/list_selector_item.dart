// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:dart_intl_search/dart_intl_search.dart';
import 'package:flutter/material.dart' show Widget, BuildContext, Theme, Locale;

class ListSelectorItem {
  final String id;
  final String name;

  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextWrapper(toString(), style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color));
  }

  Widget suggest(BuildContext context) => build(context);

  bool match(String search) => search.isPartOf(name, Locale(AppLocale.code));

  bool equal(dynamic val) => id == val;

  @override
  toString() => name;

  ListSelectorItem({required this.id, required this.name});
}
