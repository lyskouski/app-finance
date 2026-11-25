// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String prefPrivacyPolicy = 'privacyPolicy';
  static const String prefDoEncrypt = 'doEncrypt';
  static const String prefAccount = 'account';
  static const String prefBudget = 'budget';
  static const String prefCurrency = 'currency';
  static const String prefTheme = 'themeMode';
  static const String prefLocale = 'localeMode';
  static const String prefDesign = 'localeDesign';
  static const String prefExpand = 'expand';
  static const String prefPeer = 'p2p_host';
  static const String prefP2P = 'p2p_spot';
  static const String prefZoom = 'zoom';
  static const String prefColor = 'color';
  static const String prefPalette = 'palette';
  static const String prefPaletteDark = 'palette_dark';
  static const String prefVersion = 'version';
  static const String prefWeekStartDay = 'weekStartDay';
  static const String prefMonthStartDay = 'monthStartDay';
  static const String prefPrivacyKey = 'privacyKey';
  static const String prefIsOTP = 'isOTP';
  static const String prefIsBio = 'isBio';
  static const String prefRecoveryKey = 'recoveryKey';
  static const String prefSortingKey = 'sortingKey';
  static const String prefBudgetPositive = 'budgetPositive';
  static const String prefAkahu = 'akahu';
  static const String prefAkahuTokens = 'akahuTokens';
  static const String prefFinTs = 'fints';
  static const String prefFinTsState = 'fintsState';
  static const String prefSimpleFin = 'simplefin';
  static const String prefSimpleFinAccess = 'simplefinAccess';
  static const String prefEnableBanking = 'enablebanking';
  static const String prefEnableBankingKey = 'enablebankingKey';
  static const String prefEnableBankingSession = 'enablebankingSession';
  static const String prefTeller = 'teller';
  static const String prefTellerCertificate = 'tellerCertificate';
  static const String prefTellerKey = 'tellerKey';
  static const String prefTellerEnrollments = 'tellerEnrollments';
  static const String prefStarling = 'starling';
  static const String prefStarlingToken = 'starlingToken';
  static const String prefUp = 'upBanking';
  static const String prefUpToken = 'upBankingToken';
  static const String prefWise = 'wise';
  static const String prefWiseToken = 'wiseToken';
  static const String prefInvestec = 'investec';
  static const String prefInvestecCredentials = 'investecCredentials';
  static const String prefPrivatBank = 'privatbank';
  static const String prefPrivatBankToken = 'privatbankToken';
  static const String prefMonobank = 'monobank';
  static const String prefMonobankToken = 'monobankToken';
  static const String prefMonzo = 'monzo';
  static const String prefMonzoSecret = 'monzoSecret';
  static const String prefMonzoTokens = 'monzoTokens';
  static const String prefNotification = 'notificationParser';

  static const String isActive = 'true';
  static const String isInactive = 'false';

  static late SharedPreferences pref;

  static Future<void> set(String key, String value) async {
    await pref.setString(key, value);
  }

  static Future<void> clear(String key) async {
    await pref.remove(key);
  }

  static String? get(String key) {
    return pref.getString(key);
  }
}
