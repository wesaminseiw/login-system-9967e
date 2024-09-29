import 'package:flutter/material.dart';
import 'package:login_system/presentation/styles/colors.dart';

Widget submitButtonCircularProgressIndicator({
  required double width,
}) {
  return SizedBox(
    width: width,
    height: 56,
    child: Center(
      child: CircularProgressIndicator(
        color: thirdColor,
        strokeWidth: 3,
      ),
    ),
  );
}
