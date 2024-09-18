import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void successSnackBar(
  BuildContext context, {
  required String content,
}) =>
    showTopSnackBar(
      displayDuration: const Duration(milliseconds: 1000),
      Overlay.of(context),
      CustomSnackBar.success(
        message: content,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        backgroundColor: const Color.fromARGB(255, 0, 210, 7),
      ),
    );

void failureSnackBar(
  BuildContext context, {
  required String content,
}) =>
    showTopSnackBar(
      displayDuration: const Duration(milliseconds: 1000),
      Overlay.of(context),
      CustomSnackBar.error(
        message: content,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        backgroundColor: const Color.fromARGB(255, 210, 0, 0),
      ),
    );

void infoSnackBar(
  BuildContext context, {
  required String content,
}) =>
    showTopSnackBar(
      displayDuration: const Duration(milliseconds: 1000),
      Overlay.of(context),
      CustomSnackBar.info(
        message: content,
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 29, 29, 29),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 230, 0),
      ),
    );
