import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart';
import 'package:flutter/animation.dart';
import 'package:weather_app/routes.dart';
import 'package:weather_app/utils/helper_methods.dart';

class SplashController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();
    
    // Set user identifier for Crashlytics
    FirebaseCrashlytics.instance.setUserIdentifier("user_id");

    // Initialize the animation controller
    try {
      animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      );

      // Define the scale animation
      scaleAnimation = CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticOut,
      );

      // Start the animation on controller initialization
      animationController.forward();
      // Navigate to home after animation is complete
      animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // navigateToHome();
        }
      });

    } catch (error, stackTrace) {
      // Log the error and stack trace to Firebase Crashlytics
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void navigateToHome() {
   Get.offNamed(AppRoutes.home); 
  }

    void navigateToNotification() {
   Get.offNamed(AppRoutes.notification_landing_page);  
  //  Get.offNamed(AppRoutes.full_screen_intent_page); 
  }
}
