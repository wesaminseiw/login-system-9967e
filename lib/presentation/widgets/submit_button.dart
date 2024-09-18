import 'package:flutter/material.dart';
import 'package:login_system/presentation/styles/colors.dart';

Widget submitButton(
  BuildContext context, {
  double? width,
  TextStyle? labelStyle,
  required String label,
  required void Function() onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          width: width ?? double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              label,
              style: labelStyle ??
                  TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );

Widget googleSubmitButton(
  BuildContext context, {
  required void Function() onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.436,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/google_icon.png',
                  width: 32,
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
