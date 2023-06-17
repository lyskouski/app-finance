import 'package:app_finance/routes/home/baseWidget.dart';
import 'package:flutter/material.dart';

class BillWidget extends BaseWidget {
  BillWidget({
    super.key,
    String? title,
    String? color,
    required EdgeInsetsGeometry margin,
  }) : super(
    margin: margin,
    title: 'Bill',
    color: Colors.green,
  );
}
