import 'package:app_finance/routes/home/baseWidget.dart';
import 'package:flutter/material.dart';

class BillWidget extends BaseWidget {
  BillWidget({
    super.key,
    String? title,
    double? offset,
    required EdgeInsetsGeometry margin,
  }) : super(
    margin: margin,
    offset: offset,
    title: 'Bills',
  );
}
