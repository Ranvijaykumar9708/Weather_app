import 'package:flutter/material.dart';
//import 'package:weather_app/screens/Splash_screen.dart';
import 'package:weather_app/screens/homepage.dart';

void main() {
  runApp(const Weather_app());
}

// ignore: camel_case_types
class Weather_app extends StatelessWidget {
  const Weather_app({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: //splashscreen()
        Homepage()
        
        );
  }
}
