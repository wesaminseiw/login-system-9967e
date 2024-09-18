import 'package:flutter/material.dart';

Widget submitButtonCircularProgressIndicator({
  required double width,
}) {
  return SizedBox(
    width: width,
    height: 60,
    child: const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 3,
      ),
    ),
  );
}
