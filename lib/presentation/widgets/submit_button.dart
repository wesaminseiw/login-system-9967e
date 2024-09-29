import 'package:flutter/material.dart';
import 'package:login_system/presentation/styles/colors.dart';
import 'package:login_system/presentation/widgets/sizedboxes.dart';

Widget submitButton(
  BuildContext context, {
  double? width,
  TextStyle? labelStyle,
  required String label,
  required void Function() onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: labelStyle ??
                TextStyle(
                  color: thirdColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );

Widget googleSubmitButton(
  BuildContext context, {
  required void Function() onTap,
  required bool isLogin,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 56,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(12),
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
              width(19),
              Text(
                isLogin == true ? 'Login with Google' : 'Sign Up with Google',
                style: TextStyle(
                  color: thirdColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
