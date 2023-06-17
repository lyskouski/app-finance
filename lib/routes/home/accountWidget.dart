import 'package:app_finance/routes/home/baseWidget.dart';
import 'package:flutter/material.dart';

class AccountWidget extends BaseWidget {
  AccountWidget({
    super.key,
    String? title,
    required EdgeInsetsGeometry margin,
  }) : super(
    margin: margin,
    title: 'Accounts',
  );
}
