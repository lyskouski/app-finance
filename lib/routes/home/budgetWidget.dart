import 'package:app_finance/routes/home/baseWidget.dart';
import 'package:flutter/material.dart';

class BudgetWidget extends BaseWidget {
  BudgetWidget({
    super.key,
    String? title,
    String? color,
    required EdgeInsetsGeometry margin,
  }) : super(
    margin: margin,
    title: 'Budget',
    color: Colors.amber,
  );
}
