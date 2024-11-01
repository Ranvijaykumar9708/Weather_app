import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class ThemeController extends GetxController {
  // Variable to track the current theme
  var isDarkMode = false;

  // Toggle the theme
  void toggleTheme() async {
    try {
      isDarkMode = !isDarkMode;
      update();
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setBool('isDarkModel', isDarkMode);
    } catch (error, stackTrace) {
      // Log the error and stack trace to Firebase Crashlytics
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
  }

  // Get the current theme data
  ThemeData get theme {
    return isDarkMode ? ThemeData.dark() : ThemeData.light();
  }

  Future<void> getTheme() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var result = sharedPreferences.getBool('isDarkModel');
      if (result != null) {
        isDarkMode = result;
      } else {
        isDarkMode = false;
      }
      update();
      
      print("is dark mode= $isDarkMode");
    } catch (error, stackTrace) {
      // Log the error and stack trace to Firebase Crashlytics
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
  }

  @override
  void onInit() {
    getTheme();
    super.onInit();
  }
}
