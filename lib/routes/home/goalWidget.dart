import 'package:flutter/material.dart';

class GoalWidget extends StatelessWidget {
  GoalWidget({
    super.key,
    required this.margin,
  });

  EdgeInsetsGeometry margin;

  @override
  Widget build(context) {
    return Container(
      color: Colors.blue,
      margin: margin,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Center(
        child: Text(
          'Goal',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
