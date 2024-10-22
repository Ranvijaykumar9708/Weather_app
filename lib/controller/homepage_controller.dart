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
  WebServices _webServices = new WebServices();
  TextEditingController searchController = new TextEditingController();
  var getCityDetailsApiResponse;
  GetWeatherApiResponseModel? getWeatherApiResponseModel;
  GetCurrentWeatherApiResponse? getCurrentWeatherApiResponse;
  String apikey = '';
  int limit = 5;
  bool isRequesting = true;
  ToastHelper toastHelper=new ToastHelper();


@override
  void onInit() {
    apikey = dotenv.env['API_KEY']!;
    // TODO: implement onInit
    super.onInit();
  }

  void fetchCityName() async {
    LoaderUtil.showLoader();
    try {
      String url =
          '${UrlConstant.getCityDetails}?q=${searchController.text}&limit=$limit&appid=$apikey';
      print("calling get request api ${DateTime.now()}");
      var response = await _webServices.getReqeust(url: url);

      if (response.status) {
        getCityDetailsApiResponse = response.data;
        fetchCurrentWeatherDetails();
      } else {
        toastHelper.showErrorMessage(message: 'City Not Found');
        //error.....
      }
      update();
    } catch (e,_) {
      print(_);
       toastHelper.showErrorMessage(message: 'City Not Found');
    } finally {
      LoaderUtil.hideLoader();
    }
  }

  void fetchCurrentWeatherDetails() async {
    try {
      String url =
          '${UrlConstant.getCurrentWeather}?lat=${getCityDetailsApiResponse[0]['lat']}&lon=${getCityDetailsApiResponse[0]['lon']}&appid=${apikey}&units=metric';

      var response = await _webServices.getReqeust(url: url);

      if (response.status) {
        getCurrentWeatherApiResponse =
            GetCurrentWeatherApiResponse.fromJson(response.data);
        update();
        fetchForecastingDetails();
      } else {
         toastHelper.showErrorMessage(message: 'Currently Weather not found, please try again');
        //error.....
      }
    } catch (e,_) {
      print(_);
        toastHelper.showErrorMessage(message: 'City Not Found');
    } finally {
      LoaderUtil.hideLoader();
    }
  }

  void fetchForecastingDetails() async {
    try{
      String url =
        '${UrlConstant.getWeather}?lat=${getCityDetailsApiResponse[0]['lat']}&lon=${getCityDetailsApiResponse[0]['lon']}&appid=${apikey}&units=metric';

    var response = await _webServices.getReqeust(url: url);
    LoaderUtil.hideLoader();
    if (response.status) {
      getWeatherApiResponseModel =
          GetWeatherApiResponseModel.fromJson(response.data);

      _navigateIntoDetailsPage();
    } else {
       toastHelper.showErrorMessage(message: 'Currently Forecast not available for this city');
      //error.....
    }
    }catch(e,_){
      print(_);
        toastHelper.showErrorMessage(message: 'Something went wrong, please try again!');
     
    }
  }

  _navigateIntoDetailsPage() {
    Get.toNamed(AppRoutes.weather_result);
  }
}
