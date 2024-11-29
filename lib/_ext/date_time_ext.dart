// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  DateTime getPreviousDay([int day = DateTime.monday]) {
    int daysToSubtract = weekday - day;
    if (daysToSubtract < 0) {
      daysToSubtract += 7;
    }
    return subtract(Duration(
      days: daysToSubtract,
      hours: hour,
      minutes: minute,
      seconds: second,
      milliseconds: millisecond,
      microseconds: microsecond,
    ));
  }

  DateTime getStartingDay([int startingDay = 1]) {
    if (startingDay <= day) {
      return DateTime(year, month, startingDay);
    } else {
      DateTime previousMonth = DateTime(year, month - 1);
      if (month == 1) {
        previousMonth = DateTime(year - 1, 12);
      }
      return DateTime(previousMonth.year, previousMonth.month, startingDay);
    }
  }

  DateTime getNextMonth() => DateTime(year, month + 1, day, hour, minute, second);

  DateTime getPreviousMonth(int monthDelta) => DateTime(year, month - monthDelta, day, hour, minute, second);

  DateTime getNextYear() => DateTime(year + 1, month, day, hour, minute, second);

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

  String fullMonth() {
    DateFormat formatterDate;
    try {
      formatterDate = DateFormat.MMMM(AppLocale.code);
    } catch (e) {
      formatterDate = DateFormat.MMMM('en_US');
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
