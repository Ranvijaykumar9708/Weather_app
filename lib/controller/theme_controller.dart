// theme_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  // Variable to track the current theme
  var isDarkMode = false;

  // Toggle the theme
  void toggleTheme() async{
    isDarkMode = !isDarkMode;
    update();
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setBool('isDarkModel', isDarkMode);
  }

  // Get the current theme data
  ThemeData get theme {
   
    return isDarkMode ? ThemeData.dark() : ThemeData.light();
  }


  
   getTheme()async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     var result=sharedPreferences.getBool('isDarkModel');
     if(result!=null){
      if(result){
        isDarkMode=true;
        update();
      }else{
        isDarkMode=false;
      }
     }else{
      isDarkMode=false;
     }
     update();
    
    print("is dark mode= $isDarkMode");
  }

@override
  void onInit() {
    getTheme();
    // TODO: implement onInit
    super.onInit();
  }

}
