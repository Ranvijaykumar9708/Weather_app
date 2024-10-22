import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/homepage_controller.dart'; // Import the HomepageController
import 'package:weather_app/controller/theme_controller.dart';
import 'package:weather_app/utils/color_constant.dart';
import 'package:weather_app/utils/helper_methods.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the HomepageController
    final homepageController = Get.put(HomepageController());

    return Scaffold(
      backgroundColor: const Color(0xFF2E335A),
      body: GetBuilder<ThemeController>(
          init: ThemeController(),
          builder: (themeController) {
            return Container(
              height: dipslayHeight(context) / 1,
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
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                   Container(
  height: 50,
  width: dipslayWidth(context), // Corrected width to dipslayWidth(context)
  child: Row(
    children: [
      // Centering the Text
      Expanded(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "Weather",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      // Theme toggle icon on the right side
      InkWell(
        onTap: () {
          themeController.toggleTheme();
        },
        child: themeController.isDarkMode
            ? const Icon(
                Icons.light_mode,
                size: 30,
                color: Colors.white,
              )
            : const Icon(
                Icons.dark_mode,
                size: 30,
              ),
      ),
    ],
  ),
),

                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: dipslayWidth(context) / 1.45,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.7),
                                        blurRadius: 1,
                                        spreadRadius: 0.5,
                                        offset: const Offset(0, 1.6),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    onEditingComplete: () {
                                      homepageController.fetchCityName();
                                    },
                                    onChanged: (val) {
                                      print("val $val");
                                    }, // Update search text
                                    controller:
                                        homepageController.searchController,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 19),
                                      prefixIcon: const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.white70,
                                          size: 25,
                                        ),
                                      ),
                                      hintText: "Search city...",
                                      hintStyle: const TextStyle(
                                          color: Colors.white60),
                                      filled: true,
                                      fillColor: const Color(0xFF3B3C58),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    style: const TextStyle(color: Colors.white),
                                    cursorColor: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Bounce(
                                  onTap: () {
                                    homepageController.fetchCityName();
                                  },
                                  child: Container(
                                    height: 50,
                                    width: dipslayWidth(context) / 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorConstant.yelloColor),
                                    alignment: Alignment.center,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "View",
                                          style: TextStyle(
                                              color: ColorConstant.blueColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Icon(Icons.navigate_next_rounded,
                                            size: 20)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: dipslayHeight(context) / 4,
                            ),
                            Image.asset(
                              'assets/image/weather.png',
                              height: dipslayHeight(context) / 5,
                              width: dipslayHeight(context) / 5,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
