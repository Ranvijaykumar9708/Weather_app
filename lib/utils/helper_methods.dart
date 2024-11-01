import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/global_variable.dart';

dipslayHeight(BuildContext context) {
  try {
    return MediaQuery.of(context).size.height;
  } catch (e, s) {
    // Log the error to Crashlytics
    FirebaseCrashlytics.instance.recordError(e, s, fatal: false);
    return 0; // Return a default value or handle appropriately
  }
}

dipslayWidth(BuildContext context) {
  try {
    return MediaQuery.of(context).size.width;
  } catch (e, s) {
    // Log the error to Crashlytics
    FirebaseCrashlytics.instance.recordError(e, s, fatal: false);
    return 0; // Return a default value or handle appropriately
  }
}

String formatTime(String dateTimeString) {
  try {
    // Parse the input string into a DateTime object
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Format the hour and determine AM/PM
    String period = dateTime.hour >= 12 ? 'PM' : 'AM';
    int hour = dateTime.hour % 12; // Convert to 12-hour format

    // Adjust hour to display 12 instead of 0
    hour = hour == 0 ? 12 : hour;

    // Return the formatted time string
    return '$hour $period';
  } catch (e, s) {
    // Log the error to Crashlytics
    FirebaseCrashlytics.instance.recordError(e, s, fatal: false);
    return ''; // Return a default value or handle appropriately
  }
}

Future<void> getFcmToken() async {
  try {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    print("FCM Token: $token");
    fcmToken = token!;
  } catch (e, s) {
    // Log the error and stack trace to Crashlytics
    await FirebaseCrashlytics.instance.recordError(e, s, fatal: true);
  }
  // You can send the token to your server or save it locally
}

