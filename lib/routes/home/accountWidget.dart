import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  AccountWidget({
    super.key,
    required this.margin,
  });

  EdgeInsetsGeometry margin;

  @override
  Widget build(context) {
    return Expanded(
      child: Container(
        color: Colors.yellow,
        margin: margin,
        child: Center(
          child: Text(
            'Account',
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
