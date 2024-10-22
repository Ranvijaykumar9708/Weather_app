// loader.dart
import 'package:flutter/material.dart';
import 'package:weather_app/utils/color_constant.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.black54, // Semi-transparent background
        child: CircularProgressIndicator(
          color: ColorConstant.yelloColor,
        ), // Loading spinner
      ),
    );
  }
}
