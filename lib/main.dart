import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/theme_controller.dart';
import 'package:weather_app/routes.dart';
import 'package:weather_app/screens/Splash_screen.dart';
import 'package:weather_app/screens/homepage.dart';
import 'package:weather_app/screens/weather_result.dart'; // Import your AppRoutes

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       theme: themeController.theme,
      title: 'Weather App',
      
      // Define the initial route (Splash Screen)
      initialRoute: AppRoutes.splash,
      
      // Define your routes
      getPages: [
        GetPage(
          name: AppRoutes.splash,
          page: () => const Splashscreen(),
        ),
        GetPage(
          name: AppRoutes.home,
          page: () => const Homepage(),  // Replace with your actual home page widget
        ),
         GetPage(
          name: AppRoutes.weather_result,
          page: () => const WeatherResultPage(),  // Replace with your actual home page widget
        ),
      ],
    );
  }
}
