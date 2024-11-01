import 'dart:developer';

import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/splash_controller.dart';  // Import the SplashController
import 'package:weather_app/controller/theme_controller.dart';
import 'package:weather_app/routes.dart';
import 'package:weather_app/utils/color_constant.dart';
import 'package:weather_app/utils/helper_methods.dart';
import 'package:weather_app/controller/local_notification_controller.dart';
import 'package:weather_app/widgets/botton_widget.dart';

class NotificationDashboard extends StatelessWidget {
  const NotificationDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the SplashController using GetX
    final splashController = Get.put(SplashController());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GetBuilder<ThemeController>(
          init: ThemeController(),
          builder: (themeController) {
            return Container(
              width: dipslayWidth(context) / 1,
              decoration: themeController.isDarkMode
                  ? const BoxDecoration(color: ColorConstant.blackColor)
                  : const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueGrey, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
             
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getBottonWidget(
                    title: 'Get Standard Notification',
                    onPressed: (){
                       LocalNotificationsController.showSimpleNotification(
                      title: "Standard Notification",
                      body: "This is a Standard notification",
                      payload: "nothing");
                    }
                  ),
                  SizedBox(height: 20,),
                   getBottonWidget(
                    title: 'Heads up Notification',
                    onPressed: (){
                      LocalNotificationsController.showHeadsUpNotification(
                      title: "Heads up notification",
                      body: "This is a Heads up Notification",
                      payload: "heads_up_notification");
                    }
                  ),

                  SizedBox(height: 20,),
                   getBottonWidget(
                    title: 'Schedule Meal Remider after 10 Sec',
                    onPressed: (){
                      LocalNotificationsController.showScheduleNotification(
                      title: "Schedule Meal Remider after 10 Sec",
                      body: "This is a Schedule Notification",
                      payload: AppRoutes.full_screen_intent_page);
                    }
                  ),
                    SizedBox(height: 20,),
                   getBottonWidget(
                    title: 'Get Page Weather Check Notification',
                    onPressed: (){
                      
                      LocalNotificationsController.showSimpleNotification(
                      title: "Hey How's Current Weather???????",
                      body: "Check your current Weather by just clicking here...",
                      payload: AppRoutes.home);
                    }
                  ),
                  
                  
                ],
               ),
             ),
                
            );  
            
          }
        ),
      ),
    );
  }
}
