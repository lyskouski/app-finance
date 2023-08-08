// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:io';
import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/_forms/list_selector.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';

class ImportTab extends StatefulWidget {
  const ImportTab({super.key});

  @override
  ImportTabState createState() => ImportTabState();
}

class ImportTabState extends State<ImportTab> with SharedPreferencesMixin {
  late AppData state;
  List<List<dynamic>>? fileContent;
  String? errorMessage;
  List<String> columnMap = [];

  final attrAccountName = 'accountName';
  final attrCategoryName = 'categoryName';
  final attrBillAmount = 'billAmount';
  final attrBillType = 'billType';
  final attrBillDate = 'billDate';
  final attrBillCurrency = 'billCurrency';
  final attrBillComment = 'billComment';

  List<ListSelectorItem> getMappingTypes(BuildContext context) {
    final account = AppLocalizations.of(context)!.account;
    final budget = AppLocalizations.of(context)!.budget;
    final bill = AppLocalizations.of(context)!.bill;
    final mapping = [
      ListSelectorItem(id: '', name: '-- ${AppLocalizations.of(context)!.ignoreTooltip} --'),
      ListSelectorItem(id: attrAccountName, name: '$account: ${AppLocalizations.of(context)!.title}'),
      ListSelectorItem(id: attrCategoryName, name: '$budget: ${AppLocalizations.of(context)!.title}'),
      ListSelectorItem(id: attrBillAmount, name: '$bill: ${AppLocalizations.of(context)!.expense}'),
      ListSelectorItem(id: attrBillType, name: '$bill: ${AppLocalizations.of(context)!.billTypeTooltip}'),
      ListSelectorItem(id: attrBillDate, name: '$bill: ${AppLocalizations.of(context)!.expenseDateTime}'),
      ListSelectorItem(id: attrBillCurrency, name: '$bill: ${AppLocalizations.of(context)!.currency}'),
      ListSelectorItem(id: attrBillComment, name: '$bill: ${AppLocalizations.of(context)!.description}'),
    ];
    mapping.sort((a, b) => a.name.compareTo(b.name));
    return mapping;
  }

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
        withData: true,
      );
      if (result != null) {
        Uint8List? fileBytes = result.files.first.bytes;
        String? csvString;
        if (fileBytes != null) {
          csvString = String.fromCharCodes(fileBytes);
        } else {
          final file = File(result.paths.first!.toString());
          csvString = file.readAsStringSync();
        }
        final List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvString);
        setState(() {
          fileContent = csvTable;
          columnMap = List<String>.filled(csvTable.first.length, '');
        });
      }
    } catch (e) {
      setState(() => errorMessage = e.toString());
    }
  }

  Future<void> parseFile() async {
    // TBD
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    double indent = ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    FocusController.init();

    return Consumer<AppData>(builder: (context, appState, _) {
      state = appState;
      return SingleChildScrollView(
        controller: FocusController.getController(),
        child: Padding(
          padding: EdgeInsets.all(indent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (fileContent != null)
                ...List<Widget>.generate(fileContent!.first.length + 1, (index) {
                  if (index == fileContent!.first.length) {
                    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      SizedBox(height: indent * 2),
                      SizedBox(
                        width: double.infinity,
                        child: FloatingActionButton(
                          onPressed: parseFile,
                          tooltip: AppLocalizations.of(context)!.parseFile,
                          child: Text(
                            AppLocalizations.of(context)!.parseFile,
                          ),
                        ),
                      ),
                    ]);
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: indent),
                      Text(
                        AppLocalizations.of(context)!.columnMap(fileContent!.first[index]),
                        style: textTheme.bodyLarge,
                      ),
                      ListSelector(
                        options: getMappingTypes(context),
                        indent: indent,
                        hintText: AppLocalizations.of(context)!.columnMapTooltip,
                        setState: (value) => setState(() => columnMap[index] = value),
                      ),
                    ],
                  );
                })
              else ...[
                SizedBox(height: indent),
                Text(errorMessage ?? '', style: textTheme.bodyMedium?.copyWith(color: colorScheme.error)),
                SizedBox(
                  width: double.infinity,
                  child: FloatingActionButton(
                    onPressed: pickFile,
                    tooltip: AppLocalizations.of(context)!.pickFile,
                    child: Text(
                      AppLocalizations.of(context)!.pickFile,
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      );
    });
  }
}
