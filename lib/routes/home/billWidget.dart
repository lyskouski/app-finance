import 'package:flutter/material.dart';

class BillWidget extends StatelessWidget {
  BillWidget({
    super.key,
    required this.margin,
  });

  EdgeInsetsGeometry margin;

  @override
  Widget build(context) {
    return Expanded(
      child: Container(
        color: Colors.green,
        margin: margin,
        child: Center(
          child: Text(
            'Bill',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
