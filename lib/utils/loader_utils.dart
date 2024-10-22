// loader_util.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/widgets/loader_widget.dart';

class LoaderUtil {
  // Function to show the loader
  static void showLoader() {
    Get.dialog(
      Loader(),
      barrierDismissible: false, // Prevents closing the dialog by tapping outside
    );
  }

  // Function to hide the loader
  static void hideLoader() {
    Get.back(); // Pops the loader off the stack
  }
}
