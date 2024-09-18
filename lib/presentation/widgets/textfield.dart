import 'package:flutter/material.dart';
import 'package:login_system/presentation/styles/colors.dart';

Widget textField({
  required TextEditingController controller,
  required String hintText,
  Widget? prefixIcon,
  FocusNode? focusNode,
  bool? isObscure,
  TextInputType? keyboardType,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: const Color.fromARGB(0, 0, 0, 0),
        elevation: 6,
        borderRadius: BorderRadius.circular(6),
        child: TextField(
          focusNode: focusNode,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          obscureText: isObscure ?? false,
          obscuringCharacter: '●',
          cursorColor: Colors.white,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            fillColor: primaryColor,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
            ),
            prefixIcon: prefixIcon,
          ),
        ),
      ),
    );
