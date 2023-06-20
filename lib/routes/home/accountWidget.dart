import 'package:app_finance/routes/home/baseWidget.dart';
import 'package:flutter/material.dart';

class AccountWidget extends BaseWidget {
  AccountWidget({
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
