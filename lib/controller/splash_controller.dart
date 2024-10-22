import 'package:get/get.dart';
import 'package:flutter/animation.dart';
import 'package:weather_app/routes.dart';

class SplashController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();

    // Initialize the animation controller
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
    // _navigateToHome();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }


  void navigateToHome() {
   
      Get.offNamed(AppRoutes.home);  // Replace with the route to your home page
 
  }
}
