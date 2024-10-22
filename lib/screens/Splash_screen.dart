import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/splash_controller.dart';  // Import the SplashController
import 'package:weather_app/controller/theme_controller.dart';
import 'package:weather_app/utils/color_constant.dart';
import 'package:weather_app/utils/helper_methods.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: dipslayHeight(context) / 2,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/image/splash_logo.png',
                      height: 428,
                      width: 428,
                    ),
                  ),
                Container(
                  height: dipslayHeight(context)/2,
                  child:  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 60),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       const Column(
                        children: [
                           const Text("Weather",
                        style: TextStyle(
                          color: Colors.white,fontSize: 50,fontWeight: FontWeight.w900
                        ),
                        ),
                        
                         const Text("ForeCasts",
                         
                        style: TextStyle(
                          color: ColorConstant.yelloColor,fontSize: 50,fontWeight: FontWeight.w300
                        ),
                        ),
                        SizedBox(height: 20,),
                        ],
                       ),
                        Bounce(
                          onTap: (){
                            splashController.navigateToHome();
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorConstant.yelloColor
                            ),
                            alignment: Alignment.center,
                          child:   Text("Get Started",
                          style: TextStyle(
                            color: ColorConstant.blueColor,fontSize: 20,fontWeight: FontWeight.w600
                          ),
                          ),
                          ),
                        ),
                        SizedBox(height: 50,)
                      ],
                    ),
                  ),
                )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
