import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/theme_controller.dart';
import 'package:weather_app/routes.dart';
import 'package:weather_app/screens/Splash_screen.dart';
import 'package:weather_app/screens/full_screen_intent.dart';
import 'package:weather_app/screens/homepage.dart';
import 'package:weather_app/screens/notification_landing_page.dart';
import 'package:weather_app/screens/weather_result.dart';
import 'package:weather_app/controller/local_notification_controller.dart';

final navigatorKey = GlobalKey<NavigatorState>();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> initFcm() async {
  await Firebase.initializeApp();
  await LocalNotificationsController.initialize();

  var initialNotification = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  if (initialNotification?.notificationResponse?.payload==AppRoutes.full_screen_intent_page) {
      Future.delayed(const Duration(milliseconds: 200), () {
        Get.toNamed(AppRoutes.full_screen_intent_page);
      });
    
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFcm();
  await dotenv.load(fileName: ".env");

  // Initialize Crashlytics and handle uncaught errors
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey, // Add the navigatorKey here
      theme: themeController.theme,
      title: 'Weather App',
      initialRoute: AppRoutes.splash,
      getPages: [
        GetPage(name: AppRoutes.splash, page: () => const Splashscreen()),
        GetPage(name: AppRoutes.home, page: () => const Homepage()),
        GetPage(name: AppRoutes.weather_result, page: () => const WeatherResultPage()),
        GetPage(name: AppRoutes.notification_landing_page, page: () => const NotificationDashboard()),
        GetPage(name: AppRoutes.full_screen_intent_page, page: () => const FullScreenNotificationScreen()),
      ],
    );
  }
}
