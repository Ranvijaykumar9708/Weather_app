import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/get_current_wather_api_response.dart';
import 'package:weather_app/model/get_weather_api_response.dart';
import 'dart:convert';
import 'package:weather_app/routes.dart';
import 'package:weather_app/services/url_constant.dart';
import 'package:weather_app/services/web_services.dart';
import 'package:weather_app/utils/loader_utils.dart';
import 'package:weather_app/utils/toast_helper.dart';

class HomepageController extends GetxController {
  final WebServices _webServices = WebServices();
  final TextEditingController searchController = TextEditingController();
  dynamic getCityDetailsApiResponse;
  GetWeatherApiResponseModel? getWeatherApiResponseModel;
  GetCurrentWeatherApiResponse? getCurrentWeatherApiResponse;
  String apikey = '';
  final int limit = 5;
  final ToastHelper toastHelper = ToastHelper();

  @override
  void onInit() {
    apikey = dotenv.env['API_KEY']!;
    FirebaseCrashlytics.instance.setUserIdentifier("user_id");
    super.onInit();
  }

  Future<void> fetchCityName() async {
     LoaderUtil.showLoader();
    try {
      String url =
          '${UrlConstant.getCityDetails}?q=${searchController.text}&limit=$limit&appid=$apikey';
      print("Calling get request API ${DateTime.now()}");
      
      var response = await _webServices.getReqeust(url: url);

      if (response.status) {
        getCityDetailsApiResponse = response.data;
        await fetchCurrentWeatherDetails();
      } else {
         LoaderUtil.hideLoader();
        toastHelper.showErrorMessage(message: 'City Not Found');
      }
      update();
    } catch (e, s) {
       LoaderUtil.hideLoader();
      FirebaseCrashlytics.instance.recordError(e, s, fatal: false);
      toastHelper.showErrorMessage(message: 'City Not Found');
    } finally {
      // LoaderUtil.hideLoader();
    }
  }

  Future<void> fetchCurrentWeatherDetails() async {
    try {
      String url =
          '${UrlConstant.getCurrentWeather}?lat=${getCityDetailsApiResponse[0]['lat']}&lon=${getCityDetailsApiResponse[0]['lon']}&appid=$apikey&units=metric';

      var response = await _webServices.getReqeust(url: url);

      if (response.status) {
        getCurrentWeatherApiResponse =
            GetCurrentWeatherApiResponse.fromJson(response.data);
        update();
        await fetchForecastingDetails();
      } else {
         LoaderUtil.hideLoader();
        toastHelper.showErrorMessage(message: 'Currently Weather not found, please try again');
      }
    } catch (e, s) {
       LoaderUtil.hideLoader();
      FirebaseCrashlytics.instance.recordError(e, s, fatal: false);
      toastHelper.showErrorMessage(message: 'City Not Found');
    } finally {
      // LoaderUtil.hideLoader();
    }
  }

  Future<void> fetchForecastingDetails() async {
    try {
      String url =
          '${UrlConstant.getWeather}?lat=${getCityDetailsApiResponse[0]['lat']}&lon=${getCityDetailsApiResponse[0]['lon']}&appid=$apikey&units=metric';

      var response = await _webServices.getReqeust(url: url);
       LoaderUtil.hideLoader();
      
      if (response.status) {
        getWeatherApiResponseModel =
            GetWeatherApiResponseModel.fromJson(response.data);

        _navigateIntoDetailsPage();
      } else {
         LoaderUtil.hideLoader();
        toastHelper.showErrorMessage(message: 'Currently Forecast not available for this city');
      }
    } catch (e, s) {
       LoaderUtil.hideLoader();
      FirebaseCrashlytics.instance.recordError(e, s, fatal: false);
      toastHelper.showErrorMessage(message: 'Something went wrong, please try again!');
    }
  }

  void _navigateIntoDetailsPage() {
    try{
      Get.toNamed(AppRoutes.weather_result);
    }catch(e){
      print(e);
    }
  }
}
