import 'package:app_finance/widgets/home/baseWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BudgetWidget extends BaseWidget {
  BudgetWidget({
    super.key,
    required String title,
    double? offset,
    required EdgeInsetsGeometry margin,
  }) : super(
    margin: margin,
    offset: offset,
    title: title,
  );
}
