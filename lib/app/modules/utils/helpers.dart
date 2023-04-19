import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Helpers {
  static showToastMessage({
    required String message,
    bool? isError,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isError == null
          ? Colors.grey.shade400
          : isError
              ? Colors.red
              : Colors.yellow,
      textColor: isError == null
          ? Colors.white
          : isError
              ? Colors.white
              : Colors.white,
      fontSize: 12.0,
    );
  }

  static showMessage({required String message, bool isError = false}) {
    Get.snackbar(isError ? 'Error' : 'Success', message,
        duration: const Duration(
          seconds: 5,
        ),
        snackPosition: !isError ? SnackPosition.TOP : SnackPosition.BOTTOM,
        backgroundColor: !isError ? Colors.yellow : Colors.red,
        colorText: isError ? Colors.white : Colors.black,
        snackStyle: SnackStyle.FLOATING,
        icon: Icon(
          isError ? Icons.error : Icons.check,
          color: isError ? Colors.white : Colors.black,
        ),
        borderRadius: 20,
        margin: const EdgeInsets.all(10));
  }
}
