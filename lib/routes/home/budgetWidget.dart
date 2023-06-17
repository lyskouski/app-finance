import 'package:flutter/material.dart';

class BudgetWidget extends StatelessWidget {
  BudgetWidget({
    super.key,
    required this.margin,
  });

  EdgeInsetsGeometry margin;

  @override
  Widget build(context) {
    return Expanded(
      child: Container(
        color: Colors.amber,
        margin: margin,
        child: Center(
          child: Text(
            'Budget',
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
