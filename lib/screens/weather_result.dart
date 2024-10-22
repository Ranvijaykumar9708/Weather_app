import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/homepage_controller.dart';
import 'package:weather_app/controller/theme_controller.dart';
import 'package:weather_app/utils/color_constant.dart';
import 'package:weather_app/utils/helper_methods.dart';

class WeatherResultPage extends StatelessWidget {
  const WeatherResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homepageController = Get.put(HomepageController());
    return Scaffold(
      body: GetBuilder<ThemeController>(
          init: ThemeController(),
          builder: (themeController) {
          return Container(
            height: dipslayHeight(context),
            width: dipslayWidth(context),
            decoration: themeController.isDarkMode
                  ? const BoxDecoration(color: ColorConstant.blackColor)
                  :
                  const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueGrey, Colors.deepPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/image/splash_logo.png',
                        height: 210,
                        width: 244,
                      ),
                    ),
                    Text(
                     
                      '${homepageController.getCurrentWeatherApiResponse!.main.temp.toStringAsFixed(0)}°',
                      // "${homepageController.resultWeather!.tempFeelsLike!.celsius!.toStringAsFixed(0)}°",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 65,
                          fontWeight: FontWeight.w800),
                    ),
                     Text(
                     
                    "Weather: "  '${homepageController.getCurrentWeatherApiResponse!.weather[0].main}',
                      // "${homepageController.resultWeather!.tempFeelsLike!.celsius!.toStringAsFixed(0)}°",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10,),
                     Text(
                      
                       "Max: ${homepageController.getWeatherApiResponseModel!.listData[0].main.tempMax.toStringAsFixed(0)}° Min:${homepageController.getWeatherApiResponseModel!.listData[0].main.tempMin.toStringAsFixed(0)}°",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/image/House.png',
                      height: 180,
                      width: 336,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 198,
                      width: 336,
                        
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                              image: AssetImage(
                        'assets/image/detail_view.png',
                      )),
                      
                      
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Today",
                                  style: TextStyle(
                                    color: Colors.white,fontSize: 18
                                  ),
                                  ),
                                   Text(DateFormat('d MMM').format(DateTime.now()),
                                  style: TextStyle(
                                    color: Colors.white,fontSize: 18
                                  ),
                                  )
                                ],
                              ),
                            ),
                          ),
                           Container(height: 0.5,
                           color: Colors.white70,
                           ),
                           SizedBox(height: 20,),
                           Container(
                            width: dipslayWidth(context)/1.2,
                             child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                                
                                     for(int i=0;i<homepageController.getWeatherApiResponseModel!.listData.length;i++)            
                                          Container(
                                            width: dipslayWidth(context)/5.5,
                                            child: Column(
                                                                        children: [
                                                                          Text("${homepageController.getWeatherApiResponseModel!.listData[i].main.temp.toStringAsFixed(0)}°",
                                                                          style: TextStyle(
                                                                            color: Colors.white,fontSize: 18
                                                                          ),
                                                                          ),
                                                                          Image.asset('assets/image/splash_logo.png',
                                                                          height: 50,
                                                                          width: 50,
                                                                          ),
                                                                             Text("${formatTime(homepageController.getWeatherApiResponseModel!.listData[i].dtTxt)}",
                                                                          style: TextStyle(
                                                                            color: Colors.white,fontSize: 18
                                                                          ),
                                                                          ),
                                                                        ],
                                                                      ),
                                          )
                                                
                                                  
                                ],
                               ),
                             ),
                           )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
