import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String title;
  final Color color; 

  const BaseWidget({
    Key? key,
    required this.margin,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(context) {
    return Expanded(
      child: Container(
        color: color,
        margin: margin,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
