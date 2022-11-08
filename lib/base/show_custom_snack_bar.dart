import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

void showCustomSnackBar(String message,
    {bool isError = true, String title = "Error", Color color = Colors.red}) {
  Get.snackbar(title, message,
      titleText: BigText(
        text: title,
        color: Colors.white,
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color);
}
