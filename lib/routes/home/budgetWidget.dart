import 'package:app_finance/routes/home/baseWidget.dart';
import 'package:flutter/material.dart';

class BudgetWidget extends BaseWidget {
  BudgetWidget({
    super.key,
    String? title,
    double? offset,
    required EdgeInsetsGeometry margin,
  }) : super(
    margin: margin,
    offset: offset,
    title: 'Budgets',
  );
}
