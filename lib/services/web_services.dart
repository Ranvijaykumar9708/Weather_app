import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:weather_app/model/base_model.dart';
class WebServices{
  Future<BaseModel>getReqeust({required String url})async{
    Uri uri=Uri.parse(url);
    var response=await http.get(uri);
    if(response.statusCode==200){
      //operation successfully done.
      var res= json.decode(response.body);
      return BaseModel(data: res, message: 'success', status: true);
    }else{
      return BaseModel(data: null, message: 'failed', status: false);
    }
  }
}