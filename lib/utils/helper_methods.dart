import 'package:flutter/material.dart';

dipslayHeight(context){
  return MediaQuery.of(context).size.height;
}
dipslayWidth(context){
  return MediaQuery.of(context).size.width;
}
String formatTime(String dateTimeString) {
  // Parse the input string into a DateTime object
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Format the hour and determine AM/PM
  String period = dateTime.hour >= 12 ? 'PM' : 'AM';
  int hour = dateTime.hour % 12; // Convert to 12-hour format

  // Adjust hour to display 12 instead of 0
  hour = hour == 0 ? 12 : hour;

  // Return the formatted time string
  return '$hour $period';
}