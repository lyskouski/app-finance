// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

// ignore_for_file: deprecated_member_use

import 'package:app_finance/l10n/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart' as legacy;
import 'package:material_ui/material_ui.dart';

/// Localization delegates for the app.
///
/// `material_ui` defines its own [MaterialLocalizations] type, distinct from the
/// one in the deprecated `package:flutter/material.dart`. Third-party packages
/// that still build on the latter (e.g. `month_picker_dialog`,
/// `flutter_currency_picker`) look up the legacy types, so both generations are
/// registered. Drop the `legacy` entries once those packages migrate.
const List<LocalizationsDelegate<dynamic>> appLocalizationsDelegates = [
  AppLocalizations.delegate,
  ...GlobalMaterialLocalizations.delegates,
  legacy.GlobalMaterialLocalizations.delegate,
  legacy.GlobalCupertinoLocalizations.delegate,
];
