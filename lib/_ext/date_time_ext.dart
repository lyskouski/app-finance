// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String yMEd() {
    DateFormat formatterDate;
    try {
      formatterDate = DateFormat.yMEd(AppLocale.code);
    } catch (e) {
      formatterDate = DateFormat.yMEd('en_US');
    }
    return formatterDate.format(this);
  }

  String yearMonth() {
    DateFormat formatterDate;
    try {
      formatterDate = DateFormat.yM(AppLocale.code);
    } catch (e) {
      formatterDate = DateFormat.yM('en_US');
    }
    return formatterDate.format(this);
  }

  String monthDay() {
    DateFormat formatterDate;
    try {
      formatterDate = DateFormat.MMMMd(AppLocale.code);
    } catch (e) {
      formatterDate = DateFormat.MMMMd('en_US');
    }
    return formatterDate.format(this);
  }

  String dateTime() {
    DateFormat formatterDate;
    DateFormat formatterTime;
    try {
      formatterDate = DateFormat.yMMMd(AppLocale.code);
      formatterTime = DateFormat.jms(AppLocale.code);
    } catch (e) {
      formatterDate = DateFormat.yMMMd('en_US');
      formatterTime = DateFormat.jms('en_US');
    }
    return '${formatterTime.format(this)}, ${formatterDate.format(this)}';
  }
}
