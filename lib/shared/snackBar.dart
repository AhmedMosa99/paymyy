import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/themes/light_theme.dart';

SnackbarController snackBarWidget(
    {required String title, required String message}) {
  return Get.snackbar(title, message,
      colorText: Colors.white, backgroundColor: HexaColor.fromHexa('#174151'));
}
