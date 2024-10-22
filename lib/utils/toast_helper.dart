import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/utils/color_constant.dart';

class ToastHelper{
  void showErrorMessage({required String message}){
    Fluttertoast.showToast(
        msg:message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorConstant.yelloColor,
        textColor:ColorConstant.blueColor,
        fontSize: 16.0
    );
  }
}