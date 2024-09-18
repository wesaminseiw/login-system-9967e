import 'package:flutter/material.dart';

Widget orSeperator() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: Colors.white, // Line color
            thickness: 1, // Line thickness
            endIndent: 10, // Space between line and text
          ),
        ),
        Text(
          'OR',
          style: TextStyle(
            color: Colors.white, // Text color
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 1,
            indent: 10, // Space between line and text
          ),
        ),
      ],
    ),
  );
}
