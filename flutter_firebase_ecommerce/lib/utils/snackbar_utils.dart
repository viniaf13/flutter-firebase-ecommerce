import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtils {
  static void showErrorSnackbar({title, message}) {
    Get.snackbar(title, message,
        colorText: Colors.redAccent, backgroundColor: Colors.red[50]);
  }

  static void showSucessSnackbar({title, message}) {
    Get.snackbar(title, message,
        colorText: Colors.blueAccent, backgroundColor: Colors.blue[50]);
  }
}
