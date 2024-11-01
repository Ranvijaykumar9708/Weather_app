import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:weather_app/routes.dart';

class LocalNotificationsController {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final onClickNotification = BehaviorSubject<String>();

  static void onNotificationTap(NotificationResponse notificationResponse) {
    _handleNotificationTap(notificationResponse);
  }

  static Future initialize() async {
    try {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      final DarwinInitializationSettings initializationSettingsDarwin =
          DarwinInitializationSettings(onDidReceiveLocalNotification: (id, title, body, payload) => null);
      final LinuxInitializationSettings initializationSettingsLinux =
          LinuxInitializationSettings(defaultActionName: 'Open notification');
      final InitializationSettings initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
          linux: initializationSettingsLinux);

      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!
          .requestPermission();

      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap,
        
      );
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s, reason: 'Initialization failed');
    }
  }

  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    try {
      const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      );
      const NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);
      await _flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails, payload: payload);
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s, reason: 'Failed to show simple notification');
    }
  }

  static Future showHeadsUpNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    try {
      const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        actions: <AndroidNotificationAction>[
          AndroidNotificationAction('yes_action', 'Yes', showsUserInterface: true),
          AndroidNotificationAction('no_action', 'No', showsUserInterface: true),
        ],
      );

      const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

      await _flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails, payload: payload);
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s, reason: 'Failed to show heads-up notification');
    }
  }

  static Future showScheduleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    try {
      tz.initializeTimeZones();
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'channel 3', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            fullScreenIntent: true,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        payload: payload,
      );
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s, reason: 'Failed to schedule notification');
    }
  }

  static Future cancel(int id) async {
    try {
      await _flutterLocalNotificationsPlugin.cancel(id);
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s, reason: 'Failed to cancel notification');
    }
  }

  static Future cancelAll() async {
    try {
      await _flutterLocalNotificationsPlugin.cancelAll();
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s, reason: 'Failed to cancel all notifications');
    }
  }

  static _handleNotificationTap(NotificationResponse notificationData) {
    try {
      Timer(const Duration(milliseconds: 200), () {
        if (notificationData.payload != null) {
          Get.toNamed(notificationData.payload!);
        }
      });
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s, reason: 'Failed to handle notification tap');
    }
  }
}
