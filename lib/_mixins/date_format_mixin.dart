// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/widgets/_wrappers/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class _Assertion {
  int min = 0;
  int max = 0;
  int length = 0;
}

mixin DateFormatMixin {
  Widget showDateTimeHelper(BuildContext context) {
    return TableWidget(
      width: double.infinity,
      chunk: const [20, null, null],
      shadowColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
      data: [
        [Text(AppLocale.labels.symbol), Text(AppLocale.labels.meaning), Text(AppLocale.labels.example)],
        [const Text('y'), Text(AppLocale.labels.dtYear), const Text('2023')],
        [const Text('M'), Text(AppLocale.labels.dtMonth), const Text('July & 07')],
        [const Text('d'), Text(AppLocale.labels.dtDay), const Text('10')],
        [const Text('E'), Text(AppLocale.labels.dtNamedDay), const Text('Tuesday')],
        [const Text('h'), Text(AppLocale.labels.dtHalfHour), const Text('12')],
        [const Text('a'), Text(AppLocale.labels.dtAmPm), const Text('PM')],
        [const Text('H'), Text(AppLocale.labels.dtHour), const Text('18')],
        [const Text('m'), Text(AppLocale.labels.dtMinute), const Text('23')],
        [const Text('s'), Text(AppLocale.labels.dtSecond), const Text('48')],
        [const Text("'"), Text(AppLocale.labels.dtEscape), const Text("'Date='")],
        [const Text("''"), Text(AppLocale.labels.dtQuote), const Text("'o''clock'")],
      ],
    );
  }

  String detectFormat(List<String> data, String locale, [List<String>? ampm]) {
    ampm ??= [AppLocale.labels.dtAm, AppLocale.labels.dtPm];
    List<String?> format = [];
    Map<int, _Assertion> check = {};
    for (int i = 0; i < data.length; i++) {
      final value = splitDateTime(data[i]);
      if (format.length < value.length) {
        format.addAll(List<String?>.filled(value.length - format.length, null));
      }
      for (int j = 0; j < value.length; j++) {
        final nm = int.tryParse(value[j]);
        if (nm != null && nm > 0 && value[j].length >= 8) {
          format[j] = [
            'yyyy',
            'MM',
            'dd',
            if (value[j].length > 8) ...["'T'", 'HH'],
            if (value[j].length > 11) 'mm',
            if (value[j].length > 13) 'ss'
          ].join('');
        } else if (value[j] == "'") {
          format[j] = "''";
        } else if (value[j].contains(RegExp(r'[,.\\\/\:\|; -]'))) {
          format[j] = value[j];
        } else if (nm != null) {
          check[j] ??= _Assertion()
            ..min = nm
            ..max = nm
            ..length = value[j].length;
          check[j]!.min = check[j]!.min > nm ? nm : check[j]!.min;
          check[j]!.max = check[j]!.max < nm ? nm : check[j]!.max;
          check[j]!.length = check[j]!.length < value[j].length ? value[j].length : check[j]!.length;
        } else if (value.length > j + 1 && value[j + 1] == ',') {
          format[j] = 'E';
        } else if (ampm.contains(value[j].toLowerCase())) {
          format[j] = 'a';
        } else {
          format[j] = "'${value[j].replaceAll("'", "''")}'";
        }
      }
    }
    return _fillDates(format, check, locale).join('');
  }

  List<String> _fillDates(List<String?> format, Map<int, _Assertion> check, String locale) {
    bool isMonth = _isMonthFirst(locale);
    final timeDiv = format.where((v) => v == ':').length;
    final time = ['HH', 'mm', if (timeDiv > 1) 'ss'];
    final dmy = ['y', 'M', 'd'];
    final idxFist = format.indexOf(null);
    final firstDay = check[idxFist]?.max ?? 0;
    List<String> dates = isMonth && firstDay <= 12 ? ['M', 'd'] : ['d', 'M'];
    if (firstDay > 31 || check[idxFist]?.min == 0) {
      final idxSecond = format.indexOf(null, idxFist + 1);
      if (isMonth && (check[idxSecond]?.max ?? 0) > 12) {
        dates = dates.reversed.toList();
      }
      dates.insert(0, 'y');
    } else {
      dates.add('y');
    }
    final max = format.length - 1;
    for (int i = max; i >= 0; i--) {
      if (format[i] != null) {
        continue;
      }
      if (time.isNotEmpty && (i > 1 && format[i - 1] == ':' || i + 1 < max && format[i + 1] == ':')) {
        format[i] = time.removeLast();
      } else if (dmy.isNotEmpty && (i > 1 && format[i - 1] == '-' || i + 1 < max && format[i + 1] == '-')) {
        format[i] = dmy.removeLast();
      } else if (dates.isNotEmpty && check[i] != null) {
        format[i] = dates.removeLast();
      } else {
        format[i] = '?';
      }
      if (format[i] == 'y') {
        format[i] = List<String>.filled(check[i]?.length ?? 1, 'y').join('');
      }
    }
    return format.cast();
  }

  bool _isMonthFirst(String locale) {
    DateFormat dateFormat = DateFormat.yMd(locale);
    List<String> formattedDate = dateFormat.format(DateTime(2023, 10, 20)).split('/');
    return formattedDate.indexOf('10') < formattedDate.indexOf('20');
  }

  List<String> splitDateTime(String value) {
    RegExp regex = RegExp(r"\d+|[,.\\\/\:\|;-]|'| |\w+");
    return regex.allMatches(value).map((match) => match.group(0)!).toList();
  }
}
