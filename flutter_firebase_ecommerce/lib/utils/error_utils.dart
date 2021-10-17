import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorUtils {
  static void showErrorSnackbar({title, message}) {
    Get.snackbar(title, message,
        colorText: Colors.redAccent, backgroundColor: Colors.red[50]);
  }
}
