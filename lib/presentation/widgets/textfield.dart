import 'package:flutter/material.dart';

Widget textField({
  required TextEditingController controller,
  required String hintText,
  bool? isObscure,
  TextInputType? keyboardType,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: isObscure ?? false,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
