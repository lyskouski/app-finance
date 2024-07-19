// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/design_type.dart';

typedef LanguageDef = ({
  String id,
  String name,
});

const languageList = <LanguageDef>[
  (id: 'ar', name: 'اللغة العربية (AR)'),
  (id: 'az', name: 'Azərbaycanlı (AZ)'),
  (id: 'be', name: 'Тарашкевіца (BE)'),
  (id: 'be_EU', name: 'Latsinka (BE)'),
  (id: 'zh', name: '简体中文 (ZH-CN)'),
  (id: 'en', name: 'English (EN-US)'),
  (id: 'fr', name: 'Français (FR)'),
  (id: 'de', name: 'Deutsch (DE)'),
  (id: 'hi', name: 'हिंदी (HI-IN)'),
  (id: 'it', name: 'Italiano (IT)'),
  (id: 'ja', name: '日本語 (JA)'),
  (id: 'fa', name: 'فارسی (FA)'),
  (id: 'pl', name: 'Polski (PL)'),
  (id: 'pt', name: 'Português Europeu (PT)'),
  (id: 'pt_BR', name: 'Português Brasileiro (PTB)'),
  (id: 'es', name: 'Español (ES)'),
  (id: 'tr', name: 'Türk dili (TR)'),
  (id: 'uk', name: 'Українська (UK-UA)'),
  (id: 'uz', name: 'O\'zbek (UZ)'),
];

String languageDesign(String? value) => switch (value) {
      'ar' => AppDesignType.rtlGeneral.name,
      'ge' => AppDesignType.germany.name,
      'zh' => AppDesignType.asiaGeneral.name,
      'fa' => AppDesignType.rtlGeneral.name,
      _ => AppDesignType.global.name,
    };
