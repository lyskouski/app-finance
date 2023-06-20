import 'package:app_finance/widgets/home/base_widget.dart';
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
