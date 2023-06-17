import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BaseLineWidget extends StatelessWidget {
  final String title;
  final String details;
  final String date;

  const BaseLineWidget(
      {required this.title, required this.details, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(details),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
