import 'package:app_finance/widgets/home/base_widget.dart';
import 'package:flutter/material.dart';

class BillWidget extends BaseWidget {
  BillWidget({
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
