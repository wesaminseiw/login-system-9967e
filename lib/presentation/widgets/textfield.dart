import 'package:flutter/material.dart';
import 'package:login_system/presentation/styles/colors.dart';

Widget textField({
  required TextEditingController controller,
  Widget? prefixIcon,
  FocusNode? focusNode,
  bool? isObscure,
  TextInputType? keyboardType,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 56,
        child: TextField(
          focusNode: focusNode,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          obscureText: isObscure ?? false,
          obscuringCharacter: '●',
          cursorColor: primaryColor,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            fillColor: thirdColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: thirdColor,
                width: 2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: thirdColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: thirdColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: thirdColor,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: thirdColor,
                width: 2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: thirdColor,
                width: 2,
              ),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: prefixIcon,
            ),
          ),
        ),
      ),
    );
